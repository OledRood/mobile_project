package domain

import (
	"time"

	"github.com/google/uuid"
)

// Enum types
type CarStatus string

const (
	CarAvailable   CarStatus = "available"   // Машина доступна для аренды
	CarRented      CarStatus = "rented"      // Машина арендована
	CarMaintenance CarStatus = "maintenance" // Машина на обслуживании
	CarInactive    CarStatus = "inactive"    // Машина неактивна
)

type TransmissionType string

const (
	TransmissionAutomatic TransmissionType = "Автомат"
	TransmissionManual    TransmissionType = "Механика"
)

type FuelType string

const (
	FuelPetrol   FuelType = "Бензин"
	FuelDiesel   FuelType = "Дизель"
	FuelElectric FuelType = "Электро"
	FuelHybrid   FuelType = "Гибрид"
)

type RentStatus string

const (
	RentActive    RentStatus = "active"
	RentCompleted RentStatus = "completed"
	RentCancelled RentStatus = "cancelled"
)

type UserRole string

const (
	RoleUser  UserRole = "user"
	RoleAdmin UserRole = "admin"
)

// User represents a user in the system (Пользователь)
type User struct {
	ID                 uuid.UUID `gorm:"type:uuid;primaryKey;default:gen_random_uuid()" json:"id"`
	Email              string    `gorm:"unique;not null" json:"email"`                            // Email
	Password           string    `gorm:"not null" json:"-"`                                       // Password hash
	FirstName          string    `json:"first_name"`                                              // Имя
	LastName           string    `json:"last_name"`                                               // Фамилия
	MiddleName         string    `json:"middle_name"`                                             // Отчество
	BirthDate          string    `json:"birth_date"`                                              // Дата рождения
	IsMale             bool      `gorm:"default:true" json:"is_male"`                             // Пол
	DriverLicense      string    `json:"driver_license"`                                          // Номер водительского удостоверения
	DateOfIssue        string    `json:"date_of_issue"`                                           // Дата выдачи ВУ
	DriverLicensePhoto string    `gorm:"type:text" json:"driver_license_photo,omitempty"`         // Фото ВУ
	PassportPhoto      string    `gorm:"type:text" json:"passport_photo,omitempty"`               // Фото паспорта
	Avatar             string    `gorm:"type:text;default:'avatar1.png'" json:"avatar,omitempty"` // Avatar
	Role               UserRole  `gorm:"type:varchar(20);default:'user'" json:"role"`             // Роль
	CreatedAt          time.Time `gorm:"autoCreateTime" json:"created_at"`
	Rents              []Rent    `gorm:"foreignKey:UserID" json:"rents,omitempty"`

	RefreshToken          string    `json:"-"`
	RefreshTokenExpiresAt time.Time `json:"-"`
}

// Car represents a car available for rent
type Car struct {
	ID               uuid.UUID        `gorm:"type:uuid;primaryKey;default:gen_random_uuid()" json:"id"`
	Name             string           `gorm:"not null" json:"name"`                               // Название (например "BMW X5")
	Mark             string           `gorm:"not null" json:"mark"`                               // Марка (например "BMW")
	Description      string           `gorm:"type:text" json:"description"`                       // Описание
	PricePerDay      string           `gorm:"not null" json:"price_per_day"`                      // Цена за день
	PriceOfDeposit   string           `gorm:"not null;default:'5000'" json:"price_of_deposit"`    // Залог
	PriceOfInsurance string           `gorm:"not null;default:'0'" json:"price_of_insurance"`     // Цена страховки за день
	Transmission     TransmissionType `gorm:"type:varchar(20);not null" json:"transmission"`      // Тип трансмиссии
	Fuel             FuelType         `gorm:"type:varchar(20);not null" json:"fuel"`              // Тип топлива
	Status           CarStatus        `gorm:"type:varchar(20);default:'available'" json:"status"` // Статус
	ImageURL         string           `json:"image_url"`                                          // URL изображения для карточек (списки)
	DetailImageURL   string           `json:"detail_image_url"`                                   // URL детального изображения (страница машины)
	Location         string           `json:"location"`                                           // Адрес локации
	IsFavorite       bool             `gorm:"default:false" json:"is_favorite"`                   // Для пользователя (может быть отдельная таблица)
	CreatedAt        time.Time        `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt        time.Time        `gorm:"autoUpdateTime" json:"updated_at"`
	Rents            []Rent           `gorm:"foreignKey:CarID" json:"rents,omitempty"`
}

// CarSummary для списков (краткая информация)
type CarSummary struct {
	ID           uuid.UUID `json:"id"`
	Name         string    `json:"name"`
	Mark         string    `json:"mark"`
	PricePerDay  string    `json:"price_per_day"`
	Transmission string    `json:"transmission"`
	Fuel         string    `json:"fuel"`
	ImageURL     string    `json:"image_url"`
	IsFavorite   bool      `json:"is_favorite"`
}

// Rent represents a car rental/booking
type Rent struct {
	ID                  uuid.UUID  `gorm:"type:uuid;primaryKey;default:gen_random_uuid()" json:"id"`
	UserID              uuid.UUID  `gorm:"type:uuid;not null" json:"user_id"`
	User                *User      `gorm:"foreignKey:UserID" json:"user,omitempty"`
	CarID               uuid.UUID  `gorm:"type:uuid;not null" json:"car_id"`
	Car                 *Car       `gorm:"foreignKey:CarID" json:"car,omitempty"`
	StartRentDate       string     `gorm:"not null" json:"start_rent_date"` // Формат: DD/MM/YYYY
	EndRentDate         string     `gorm:"not null" json:"end_rent_date"`   // Формат: DD/MM/YYYY
	PriceOfInsurance    string     `gorm:"not null" json:"price_of_insurance"`
	TotalPrice          string     `gorm:"not null" json:"total_price"`
	PriceOfDeposit      string     `gorm:"not null" json:"price_of_deposit"`
	DriverName          string     `json:"driver_name"`           // Имя водителя
	DriverLicenseNumber string     `json:"driver_license_number"` // Номер ВУ
	Status              RentStatus `gorm:"type:varchar(20);default:'active'" json:"status"`
	Location            string     `json:"location"` // Адрес локации
	CreatedAt           time.Time  `gorm:"autoCreateTime" json:"created_at"`
	UpdatedAt           time.Time  `gorm:"autoUpdateTime" json:"updated_at"`
}
