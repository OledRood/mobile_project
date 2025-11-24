package http

import (
	"mobile_car_proj/config"
	"mobile_car_proj/internal/domain"

	"github.com/gin-gonic/gin"
)

func NewRouter(router *gin.Engine, userUC domain.UserUseCase, carUC domain.CarUseCase, rentUC domain.RentUseCase, cfg *config.Config) {
	// Health check
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{"status": "ok"})
	})

	// Image handler для обслуживания изображений
	imageHandler := NewImageHandler("./data/images")

	api := router.Group("/api/v1")
	{
		// Auth endpoints
		auth := api.Group("/auth")
		{
			userHandler := NewUserHandler(userUC, cfg.JWTSecret)
			auth.POST("/register", userHandler.Register)
			auth.POST("/login", userHandler.Login)
			auth.POST("/refresh", userHandler.Refresh)
			auth.GET("/validate", userHandler.ValidateToken)
		}

		// User endpoints
		users := api.Group("/users")
		{
			userHandler := NewUserHandler(userUC, cfg.JWTSecret)

			authed := users.Group("/")
			authed.Use(AuthMiddleware(cfg.JWTSecret))
			authed.GET("/me", userHandler.GetByID)
			authed.PUT("/me", userHandler.UpdateMe)
			authed.DELETE("/me", userHandler.DeleteMe)
		}

		// Car endpoints
		cars := api.Group("/car")
		{
			carHandler := NewCarHandler(carUC)
			rentHandler := NewRentHandler(rentUC)

			// Public endpoints
			cars.GET("/details/:id", carHandler.GetCarDetails)
			cars.GET("/list", carHandler.GetCarsList)
			cars.GET("/summary", carHandler.GetSummaryList)
			cars.GET("/search", carHandler.SearchCars)
			cars.GET("/recommendations", carHandler.GetRecommendations)

			// Protected endpoints
			authed := cars.Group("/")
			authed.Use(AuthMiddleware(cfg.JWTSecret))
			authed.GET("/favorites", carHandler.GetFavorites)
			authed.POST("/favorite/:id", carHandler.SetFavoriteStatus)
			authed.POST("/book/:id", rentHandler.BookCar)
			authed.GET("/rent/history", rentHandler.GetUserRentHistory)
			authed.GET("/book/:bookId", rentHandler.GetRentDetails)
			authed.POST("/book/cancel/:id", rentHandler.CancelRent)
			authed.POST("/create", carHandler.CreateCar)

			// Admin endpoints
		}

		// Image endpoints (публичные)
		images := api.Group("/images")
		{
			images.GET("/cars/:filename", imageHandler.GetCarImage)
			images.GET("/avatars/:filename", imageHandler.GetAvatarImage)
		}

		// Direct access to avatars
		api.GET("/avatars/:filename", imageHandler.GetAvatarImage)
	}
}
