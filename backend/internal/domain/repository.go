package domain

import "github.com/google/uuid"

// UserRepository defines methods for user data access
type UserRepository interface {
	Create(user *User) error
	GetByID(id uuid.UUID) (*User, error)
	GetByEmail(email string) (*User, error)
	Update(user *User) error
	Delete(id uuid.UUID) error
	List(limit, offset int) ([]*User, error)
	GetByRefreshToken(refreshToken string) (*User, error)
}

// CarRepository defines methods for car data access
type CarRepository interface {
	Create(car *Car) error
	GetByID(id uuid.UUID) (*Car, error)
	Update(car *Car) error
	Delete(carID uuid.UUID) error
	List(limit, offset int) ([]*Car, error)
	GetSummaryList(limit, offset int) ([]*CarSummary, error)
	Search(query string, limit, offset int) ([]*Car, error)
	GetByStatus(status CarStatus, limit, offset int) ([]*Car, error)
	GetRecommendations(limit int) ([]*Car, error)
}

// RentRepository defines methods for rent data access
type RentRepository interface {
	Create(rent *Rent) error
	GetByID(id uuid.UUID) (*Rent, error)
	GetByUserID(userID uuid.UUID) ([]*Rent, error)
	GetByCarID(carID uuid.UUID) ([]*Rent, error)
	Update(rent *Rent) error
	Delete(id uuid.UUID) error
	List(limit, offset int) ([]*Rent, error)
}
