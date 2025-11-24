package postgres

import (
	"mobile_car_proj/internal/domain"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type RentRepository struct {
	db *gorm.DB
}

func NewRentRepository(db *gorm.DB) *RentRepository {
	return &RentRepository{db: db}
}

func (r *RentRepository) Create(rent *domain.Rent) error {
	return r.db.Create(rent).Error
}

func (r *RentRepository) GetByID(id uuid.UUID) (*domain.Rent, error) {
	var rent domain.Rent
	err := r.db.Preload("Car").Preload("User").First(&rent, "id = ?", id).Error
	return &rent, err
}

func (r *RentRepository) GetByUserID(userID uuid.UUID) ([]*domain.Rent, error) {
	var rents []*domain.Rent
	err := r.db.Preload("Car").Where("user_id = ?", userID).Find(&rents).Error
	return rents, err
}

func (r *RentRepository) GetByCarID(carID uuid.UUID) ([]*domain.Rent, error) {
	var rents []*domain.Rent
	err := r.db.Preload("Car").Preload("User").
		Where("car_id = ?", carID).Find(&rents).Error
	return rents, err
}

func (r *RentRepository) Update(rent *domain.Rent) error {
	return r.db.Save(rent).Error
}

func (r *RentRepository) Delete(id uuid.UUID) error {
	return r.db.Delete(&domain.Rent{}, "id = ?", id).Error
}

func (r *RentRepository) List(limit, offset int) ([]*domain.Rent, error) {
	var rents []*domain.Rent
	err := r.db.Preload("Car").Preload("User").
		Limit(limit).Offset(offset).Find(&rents).Error
	return rents, err
}
