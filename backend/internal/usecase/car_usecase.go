package usecase

import (
	"mobile_car_proj/internal/domain"

	"github.com/google/uuid"
)

type CarUseCase struct {
	carRepo  domain.CarRepository
	rentRepo domain.RentRepository
}

func NewCarUseCase(carRepo domain.CarRepository, rentRepo domain.RentRepository) *CarUseCase {
	return &CarUseCase{
		carRepo:  carRepo,
		rentRepo: rentRepo,
	}
}

func (uc *CarUseCase) CreateCar(car *domain.Car) error {
	return uc.carRepo.Create(car)
}

func (uc *CarUseCase) GetCarByID(carID uuid.UUID) (*domain.Car, error) {
	return uc.carRepo.GetByID(carID)
}

func (uc *CarUseCase) GetCarsList() ([]*domain.Car, error) {
	return uc.carRepo.List(100, 0)
}

func (uc *CarUseCase) GetCarsSummaryList() ([]*domain.CarSummary, error) {
	return uc.carRepo.GetSummaryList(100, 0)
}

func (uc *CarUseCase) SearchCars(query string, limit, offset int) ([]*domain.Car, error) {
	if query == "" {
		return uc.carRepo.GetByStatus(domain.CarAvailable, limit, offset)
	}
	return uc.carRepo.Search(query, limit, offset)
}

func (uc *CarUseCase) UpdateCar(car *domain.Car) error {
	return uc.carRepo.Update(car)
}

func (uc *CarUseCase) DeleteCar(carID uuid.UUID) error {
	return uc.carRepo.Delete(carID)
}

func (uc *CarUseCase) GetRecommendations(limit int) ([]*domain.Car, error) {
	return uc.carRepo.GetRecommendations(limit)
}

func (uc *CarUseCase) SetCarImage(carID uuid.UUID, imageURL string) error {
	car, err := uc.carRepo.GetByID(carID)
	if err != nil {
		return err
	}
	car.ImageURL = imageURL
	return uc.carRepo.Update(car)
}

func (uc *CarUseCase) SetCarDetailImage(carID uuid.UUID, imageURL string) error {
	car, err := uc.carRepo.GetByID(carID)
	if err != nil {
		return err
	}
	car.DetailImageURL = imageURL
	return uc.carRepo.Update(car)
}

// SetFavoriteStatus - управление избранным (упрощенная версия)
// В реальном приложении лучше использовать отдельную таблицу user_favorites
func (uc *CarUseCase) SetFavoriteStatus(carID uuid.UUID, userID uuid.UUID, isFavorite bool) error {
	car, err := uc.carRepo.GetByID(carID)
	if err != nil {
		return err
	}
	car.IsFavorite = isFavorite
	return uc.carRepo.Update(car)
}

// GetFavorites получение избранных машин
func (uc *CarUseCase) GetFavorites(userID uuid.UUID) ([]*domain.Car, error) {
	// Упрощенная версия - в реальном приложении нужна отдельная таблица
	cars, err := uc.carRepo.List(100, 0)
	if err != nil {
		return nil, err
	}

	var favorites []*domain.Car
	for _, car := range cars {
		if car.IsFavorite {
			favorites = append(favorites, car)
		}
	}

	return favorites, nil
}
