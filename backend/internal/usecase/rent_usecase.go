package usecase

import (
	"errors"
	"mobile_car_proj/internal/domain"

	"github.com/google/uuid"
)

type RentUseCase struct {
	rentRepo domain.RentRepository
	carRepo  domain.CarRepository
	userRepo domain.UserRepository
}

func NewRentUseCase(rentRepo domain.RentRepository, carRepo domain.CarRepository, userRepo domain.UserRepository) *RentUseCase {
	return &RentUseCase{
		rentRepo: rentRepo,
		carRepo:  carRepo,
		userRepo: userRepo,
	}
}

func (uc *RentUseCase) CreateRent(rent *domain.Rent) error {
	// Проверяем, что машина доступна
	car, err := uc.carRepo.GetByID(rent.CarID)
	if err != nil {
		return err
	}

	if car.Status != domain.CarAvailable {
		return errors.New("car is not available for rent")
	}

	// Получаем данные пользователя
	user, err := uc.userRepo.GetByID(rent.UserID)
	if err != nil {
		return err
	}

	// Заполняем данные аренды
	rent.DriverName = user.FirstName + " " + user.LastName
	rent.DriverLicenseNumber = user.DriverLicense
	rent.Location = car.Location

	// Создаем бронирование
	if err := uc.rentRepo.Create(rent); err != nil {
		return err
	}

	// Обновляем статус машины
	car.Status = domain.CarRented
	return uc.carRepo.Update(car)
}

func (uc *RentUseCase) GetRentByID(rentID uuid.UUID) (*domain.Rent, error) {
	return uc.rentRepo.GetByID(rentID)
}

func (uc *RentUseCase) GetUserRentHistory(userID uuid.UUID) ([]*domain.Rent, error) {
	return uc.rentRepo.GetByUserID(userID)
}

func (uc *RentUseCase) GetRentDetails(rentID uuid.UUID) (*domain.Rent, error) {
	return uc.rentRepo.GetByID(rentID)
}

func (uc *RentUseCase) UpdateRentStatus(rentID uuid.UUID, status domain.RentStatus) error {
	rent, err := uc.rentRepo.GetByID(rentID)
	if err != nil {
		return err
	}

	rent.Status = status
	if err := uc.rentRepo.Update(rent); err != nil {
		return err
	}

	// Если аренда завершена или отменена, освобождаем машину
	if status == domain.RentCompleted || status == domain.RentCancelled {
		car, err := uc.carRepo.GetByID(rent.CarID)
		if err != nil {
			return err
		}
		car.Status = domain.CarAvailable
		return uc.carRepo.Update(car)
	}

	return nil
}

func (uc *RentUseCase) CancelRent(rentID uuid.UUID) error {
	return uc.UpdateRentStatus(rentID, domain.RentCancelled)
}
