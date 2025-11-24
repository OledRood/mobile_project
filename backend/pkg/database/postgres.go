package database

import (
	"fmt"
	"log"
	"mobile_car_proj/config"
	"mobile_car_proj/internal/domain"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// Создает новое подключение к базе данных PostgreSQL с повторными попытками
func NewPostgresDB(cfg *config.Config) (*gorm.DB, error) {
	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s dbname=%s port=%s sslmode=%s connect_timeout=10",
		cfg.DBHost,
		cfg.DBUser,
		cfg.DBPassword,
		cfg.DBName,
		cfg.DBPort,
		cfg.DBSSLMode,
	)

	var db *gorm.DB
	var err error
	maxRetries := 30
	retryDelay := 2 * time.Second

	log.Println("Попытка подключения к базе данных...")

	for i := 0; i < maxRetries; i++ {
		db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
		if err == nil {
			log.Println("✓ Успешное подключение к базе данных")
			return db, nil
		}

		log.Printf("⚠ Попытка %d/%d не удалась: %v", i+1, maxRetries, err)

		if i < maxRetries-1 {
			log.Printf("Повторная попытка через %v...", retryDelay)
			time.Sleep(retryDelay)
		}
	}

	return nil, fmt.Errorf("не удалось подключиться к базе данных после %d попыток: %w", maxRetries, err)
}

// Автоматическая миграция схемы базы данных
func AutoMigrate(db *gorm.DB) error {
	return db.AutoMigrate(
		&domain.User{},
		&domain.Car{},
		&domain.Rent{},
	)
}
