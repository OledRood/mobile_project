package domain

import "github.com/google/uuid"

// TokenResponse представляет ответ с токеном аутентификации
type TokenResponse struct {
	User         *User  `json:"user"`
	AccessToken  string `json:"access_token"`
	RefreshToken string `json:"refresh_token"`
}

// UserUseCase интерфейс для работы с пользователями
type UserUseCase interface {
	RegisterUser(user *User) (*TokenResponse, error)
	LoginUser(email, password string) (*TokenResponse, error)
	GetUserByID(id string) (*User, error)
	UpdateUser(user *User) error
	DeleteUser(id string) error
	RefreshToken(refreshToken string) (*TokenResponse, error)
}

// CarUseCase интерфейс для работы с машинами
type CarUseCase interface {
	CreateCar(car *Car) error
	GetCarByID(carID uuid.UUID) (*Car, error)
	GetCarsList() ([]*Car, error)
	GetCarsSummaryList() ([]*CarSummary, error)
	SearchCars(query string, limit, offset int) ([]*Car, error)
	UpdateCar(car *Car) error
	DeleteCar(carID uuid.UUID) error
	GetRecommendations(limit int) ([]*Car, error)
	SetCarImage(carID uuid.UUID, imageURL string) error
	// Управление избранным
	SetFavoriteStatus(carID uuid.UUID, userID uuid.UUID, isFavorite bool) error
	GetFavorites(userID uuid.UUID) ([]*Car, error)
}

// RentUseCase интерфейс для работы с бронированиями
type RentUseCase interface {
	CreateRent(rent *Rent) error
	GetRentByID(rentID uuid.UUID) (*Rent, error)
	GetUserRentHistory(userID uuid.UUID) ([]*Rent, error)
	GetRentDetails(rentID uuid.UUID) (*Rent, error)
	UpdateRentStatus(rentID uuid.UUID, status RentStatus) error
	CancelRent(rentID uuid.UUID) error
}
