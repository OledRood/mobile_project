package http

import (
	"fmt"
	"math/rand"
	"mobile_car_proj/internal/domain"
	"net/http"
	"path/filepath"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

type CarHandler struct {
	carUseCase domain.CarUseCase
}

func NewCarHandler(carUC domain.CarUseCase) *CarHandler {
	return &CarHandler{carUseCase: carUC}
}

// GetCarDetails получение деталей машины по ID
// GET /car/details/:id
func (h *CarHandler) GetCarDetails(c *gin.Context) {
	idStr := c.Param("id")
	id, err := uuid.Parse(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid car ID"})
		return
	}

	car, err := h.carUseCase.GetCarByID(id)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Car not found"})
		return
	}

	if car.Status != domain.CarAvailable {
		c.JSON(http.StatusConflict, gin.H{"error": "Машина недоступна для аренды"})
		return
	}

	c.JSON(http.StatusOK, car)
}

// GetCarsList получение списка всех машин
// GET /car/list
func (h *CarHandler) GetCarsList(c *gin.Context) {
	cars, err := h.carUseCase.GetCarsList()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, cars)
}

// GetSummaryList получение краткого списка машин
// GET /car/summary
func (h *CarHandler) GetSummaryList(c *gin.Context) {
	cars, err := h.carUseCase.GetCarsSummaryList()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, cars)
}

// SearchCars поиск машин
// GET /car/search?q=query
func (h *CarHandler) SearchCars(c *gin.Context) {
	query := c.Query("q")

	cars, err := h.carUseCase.SearchCars(query, 100, 0)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, cars)
}

// GetRecommendations получение рекомендаций
// GET /car/recommendations
func (h *CarHandler) GetRecommendations(c *gin.Context) {
	cars, err := h.carUseCase.GetRecommendations(5)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, cars)
}

// GetFavorites получение избранных машин
// GET /car/favorites (требует аутентификации)
func (h *CarHandler) GetFavorites(c *gin.Context) {
	userID, exists := c.Get("userId")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	uid, err := uuid.Parse(userID.(string))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	cars, err := h.carUseCase.GetFavorites(uid)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, cars)
}

// SetFavoriteStatus изменение статуса избранного
// POST /car/favorite/:id
func (h *CarHandler) SetFavoriteStatus(c *gin.Context) {
	carIDStr := c.Param("id")
	carID, err := uuid.Parse(carIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid car ID"})
		return
	}

	userID, exists := c.Get("userId")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	uid, err := uuid.Parse(userID.(string))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	var input struct {
		IsFavorite bool `json:"is_favorite"`
	}
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := h.carUseCase.SetFavoriteStatus(carID, uid, input.IsFavorite); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"is_favorite": input.IsFavorite})
}

// CreateCar создание нового автомобиля
// POST /car/create
func (h *CarHandler) CreateCar(c *gin.Context) {
	// 1. Parse form fields
	address := c.PostForm("address")
	yearStr := c.PostForm("year")
	make := c.PostForm("make")
	model := c.PostForm("model")
	transmissionStr := c.PostForm("transmission")
	mileageStr := c.PostForm("mileage")
	description := c.PostForm("description")

	// 2. Parse files
	form, err := c.MultipartForm()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid form data"})
		return
	}
	files := form.File["photos"]

	var imageURL string
	var detailImageURL string

	if len(files) > 0 {
		// Save first file
		file := files[0]
		ext := filepath.Ext(file.Filename)
		newFilename := uuid.New().String() + ext
		// Ensure directory exists
		savePath := filepath.Join("data", "images", "cars", newFilename)

		if err := c.SaveUploadedFile(file, savePath); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save image"})
			return
		}

		// URL path
		imageURL = "/images/cars/" + newFilename
		detailImageURL = imageURL // Use same for now
	}

	// 3. Generate random data
	pricePerDay := fmt.Sprintf("%d", rand.Intn(20000)+3000) // 3000 - 23000
	priceOfDeposit := fmt.Sprintf("%d", rand.Intn(10000)+5000)
	priceOfInsurance := fmt.Sprintf("%d", rand.Intn(2000)+500)

	fuels := []domain.FuelType{domain.FuelPetrol, domain.FuelDiesel, domain.FuelElectric, domain.FuelHybrid}
	fuel := fuels[rand.Intn(len(fuels))]

	var transmission domain.TransmissionType
	if transmissionStr == "manual" || transmissionStr == "Механика" {
		transmission = domain.TransmissionManual
	} else {
		transmission = domain.TransmissionAutomatic
	}

	// 4. Construct Car object
	car := &domain.Car{
		Name:             make + " " + model,
		Mark:             make,
		Description:      fmt.Sprintf("%s\nYear: %s\nMileage: %s", description, yearStr, mileageStr),
		PricePerDay:      pricePerDay,
		PriceOfDeposit:   priceOfDeposit,
		PriceOfInsurance: priceOfInsurance,
		Transmission:     transmission,
		Fuel:             fuel,
		Status:           domain.CarAvailable,
		ImageURL:         imageURL,
		DetailImageURL:   detailImageURL,
		Location:         address,
	}

	// 5. Call UseCase
	if err := h.carUseCase.CreateCar(car); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	// 6. Return ID
	c.JSON(http.StatusCreated, gin.H{"id": car.ID})
}
