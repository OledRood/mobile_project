package main

import (
	"log"
	"mobile_car_proj/config"
	"mobile_car_proj/internal/delivery/http"
	"mobile_car_proj/internal/repository/postgres"
	"mobile_car_proj/internal/usecase"
	"mobile_car_proj/pkg/database"
	"strings"
	"time"

	"github.com/gin-gonic/gin"

	"github.com/gin-contrib/cors"
)

func main() {
	// Загружаем конфигурацию
	cfg, err := config.LoadConfig()
	if err != nil {
		log.Fatalf("Не удалось загрузить конфигурацию: %v", err)
	}

	// Инициализируем подключение к базе данных
	db, err := database.NewPostgresDB(cfg)
	if err != nil {
		log.Fatalf("Не удалось подключиться к базе данных: %v", err)
	}

	// Auto-migrate database schema
	if err := database.AutoMigrate(db); err != nil {
		log.Fatalf("Не удалось выполнить миграцию базы данных: %v", err)
	}

	// Seed initial data
	if err := database.SeedData(db); err != nil {
		log.Fatalf("Не удалось заполнить базу данных тестовыми данными: %v", err)
	}

	// Initialize repositories
	userRepo := postgres.NewUserRepository(db)
	carRepo := postgres.NewCarRepository(db)
	rentRepo := postgres.NewRentRepository(db)

	// Initialize use cases
	userUseCase := usecase.NewUserUseCase(userRepo, cfg.JWTSecret)
	carUseCase := usecase.NewCarUseCase(carRepo, rentRepo)
	rentUseCase := usecase.NewRentUseCase(rentRepo, carRepo, userRepo)

	// Initialize HTTP handlers
	router := gin.Default()

	// CORS: allow dev frontend origin and required methods/headers so browser preflight (OPTIONS) succeeds
	// Allow browser dev servers on localhost (any port) and 127.0.0.1
	router.Use(cors.New(cors.Config{
		AllowOriginFunc: func(origin string) bool {
			return strings.HasPrefix(origin, "http://localhost") || strings.HasPrefix(origin, "http://127.0.0.1")
		},
		AllowMethods:     []string{"GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept", "Authorization"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}))

	// Serve uploaded images from disk at /images
	router.Static("/images", "./data/images")

	// Serve static car images
	router.StaticFile("/api/v1/static/placeholder.png", "./data/images/placeholder.png")

	http.NewRouter(router, userUseCase, carUseCase, rentUseCase, cfg)

	// Start server
	log.Printf("Server starting on port %s", cfg.ServerPort)
	for _, ri := range router.Routes() {
		println(ri.Method, ri.Path)
	}

	if err := router.Run(":" + cfg.ServerPort); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
