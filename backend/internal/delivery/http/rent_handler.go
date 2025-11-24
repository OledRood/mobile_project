package http

import (
	"mobile_car_proj/internal/domain"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

type RentHandler struct {
	rentUseCase domain.RentUseCase
}

func NewRentHandler(rentUC domain.RentUseCase) *RentHandler {
	return &RentHandler{rentUseCase: rentUC}
}

// BookCar бронирование машины
// POST /car/book/:id
func (h *RentHandler) BookCar(c *gin.Context) {
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

	carIDStr := c.Param("id")
	carID, err := uuid.Parse(carIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid car ID"})
		return
	}

	var req struct {
		StartRentDate    string `json:"start_rent_date"`
		EndRentDate      string `json:"end_rent_date"`
		PriceOfInsurance string `json:"price_of_insurance"`
		TotalPrice       string `json:"total_price"`
		PriceOfDeposit   string `json:"price_of_deposit"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	rent := &domain.Rent{
		UserID:           uid,
		CarID:            carID,
		StartRentDate:    req.StartRentDate,
		EndRentDate:      req.EndRentDate,
		PriceOfInsurance: req.PriceOfInsurance,
		TotalPrice:       req.TotalPrice,
		PriceOfDeposit:   req.PriceOfDeposit,
		Status:           domain.RentActive,
	}

	if err := h.rentUseCase.CreateRent(rent); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, rent)
}

// GetUserRentHistory получение истории аренды пользователя
// GET /car/rent/history
func (h *RentHandler) GetUserRentHistory(c *gin.Context) {
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

	rents, err := h.rentUseCase.GetUserRentHistory(uid)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	type RentHistoryResponse struct {
		ID            uuid.UUID         `json:"id"`
		Name          string            `json:"name"`
		StartRentDate string            `json:"start_rent_date"`
		EndRentDate   string            `json:"end_rent_date"`
		Status        domain.RentStatus `json:"status"`
	}

	var response []RentHistoryResponse
	for _, r := range rents {
		carName := "Unknown Car"
		if r.Car != nil {
			carName = r.Car.Name
		}

		response = append(response, RentHistoryResponse{
			ID:            r.ID,
			Name:          carName,
			StartRentDate: r.StartRentDate,
			EndRentDate:   r.EndRentDate,
			Status:        r.Status,
		})
	}

	c.JSON(http.StatusOK, response)
}

// GetRentDetails получение деталей конкретной аренды
// GET /car/book/:bookId
func (h *RentHandler) GetRentDetails(c *gin.Context) {
	rentIDStr := c.Param("bookId")
	rentID, err := uuid.Parse(rentIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid rent ID"})
		return
	}

	rent, err := h.rentUseCase.GetRentDetails(rentID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Rent not found"})
		return
	}

	// Map status to Russian
	status := string(rent.Status)
	if rent.Status == domain.RentActive {
		status = "active"
	} else if rent.Status == domain.RentCompleted {
		status = "completed"
	} else if rent.Status == domain.RentCancelled {
		status = "cancelled"
	}

	response := gin.H{
		"id": rent.ID,
		"car": gin.H{
			"id":               rent.Car.ID,
			"name":             rent.Car.Name,
			"mark":             rent.Car.Mark,
			"price_per_day":    rent.Car.PricePerDay,
			"image_url":        rent.Car.ImageURL,
			"detail_image_url": rent.Car.DetailImageURL,
			"transmission":     rent.Car.Transmission,
			"fuel":             rent.Car.Fuel,
		},
		"start_rent_date":       rent.StartRentDate,
		"end_rent_date":         rent.EndRentDate,
		"driver_name":           rent.DriverName,
		"driver_license_number": rent.DriverLicenseNumber,
		"status":                status,
		"price_of_insurance":    rent.PriceOfInsurance,
		"total_price":           rent.TotalPrice,
		"location":              rent.Location,
	}

	c.JSON(http.StatusOK, response)
}

// CancelRent отмена аренды
// POST /car/book/cancel/:id
func (h *RentHandler) CancelRent(c *gin.Context) {
	rentIDStr := c.Param("id")
	rentID, err := uuid.Parse(rentIDStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid rent ID"})
		return
	}

	if err := h.rentUseCase.CancelRent(rentID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"status": domain.RentCancelled})
}
