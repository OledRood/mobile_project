package postgres

import (
	"mobile_car_proj/internal/domain"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type CarRepository struct {
	db *gorm.DB
}

func NewCarRepository(db *gorm.DB) *CarRepository {
	return &CarRepository{db: db}
}

func (r *CarRepository) Create(car *domain.Car) error {
	return r.db.Create(car).Error
}

func (r *CarRepository) GetByID(id uuid.UUID) (*domain.Car, error) {
	var car domain.Car
	err := r.db.First(&car, "id = ?", id).Error
	return &car, err
}

func (r *CarRepository) Update(car *domain.Car) error {
	return r.db.Save(car).Error
}

func (r *CarRepository) Delete(carID uuid.UUID) error {
	return r.db.Delete(&domain.Car{}, "id = ?", carID).Error
}

func (r *CarRepository) List(limit, offset int) ([]*domain.Car, error) {
	var cars []*domain.Car
	err := r.db.Limit(limit).Offset(offset).Find(&cars).Error
	return cars, err
}

func (r *CarRepository) GetSummaryList(limit, offset int) ([]*domain.CarSummary, error) {
	var summaries []*domain.CarSummary
	err := r.db.Model(&domain.Car{}).
		Select("id, name, mark, price_per_day, transmission, fuel, image_url, is_favorite").
		Limit(limit).Offset(offset).Find(&summaries).Error
	return summaries, err
}

func (r *CarRepository) Search(query string, limit, offset int) ([]*domain.Car, error) {
	var cars []*domain.Car
	err := r.db.Where("(name ILIKE ? OR mark ILIKE ? OR description ILIKE ?) AND status = ?",
		"%"+query+"%", "%"+query+"%", "%"+query+"%", domain.CarAvailable).
		Limit(limit).Offset(offset).Find(&cars).Error
	return cars, err
}

func (r *CarRepository) GetByStatus(status domain.CarStatus, limit, offset int) ([]*domain.Car, error) {
	var cars []*domain.Car
	err := r.db.Where("status = ?", status).
		Limit(limit).Offset(offset).Find(&cars).Error
	return cars, err
}

func (r *CarRepository) GetRecommendations(limit int) ([]*domain.Car, error) {
	var cars []*domain.Car
	// Возвращаем случайные доступные машины для имитации рекомендаций
	err := r.db.Where("status = ?", domain.CarAvailable).
		Order("RANDOM()").
		Limit(limit).Find(&cars).Error
	return cars, err
}
