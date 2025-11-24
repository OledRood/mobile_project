package database

import (
	"log"
	"mobile_car_proj/internal/domain"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

// SeedData наполняет базу данных начальными тестовыми данными
func SeedData(db *gorm.DB) error {
	// Проверяем, есть ли уже данные
	var carCount int64
	db.Model(&domain.Car{}).Count(&carCount)
	if carCount > 0 {
		log.Println("База данных уже содержит данные, пропускаем seed")
		return nil
	}

	log.Println("Начинаем заполнение базы данных тестовыми данными...")

	// Создаем машины
	cars := []domain.Car{
		{
			ID:               uuid.New(),
			Name:             "BMW X5",
			Mark:             "BMW",
			Description:      "Комфортный внедорожник премиум-класса, просторный салон, автомат, полный привод",
			PricePerDay:      "3500",
			PriceOfDeposit:   "15000",
			PriceOfInsurance: "500",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/BMW_X5_card.png",
			DetailImageURL:   "/images/cars/details/BMW_X5.jpg",
			Location:         "г. Москва, ул. Тверская, 10",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Mercedes S500",
			Mark:             "Mercedes",
			Description:      "Седан представительского класса, роскошный интерьер, страховка включена",
			PricePerDay:      "2000",
			PriceOfDeposit:   "10000",
			PriceOfInsurance: "400",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/merc_card.png",
			DetailImageURL:   "/images/cars/details/merc.png",
			Location:         "г. Москва, Кутузовский проспект, 25",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Lada Largus",
			Mark:             "Lada",
			Description:      "Практичный универсал для города и поездок, вместительный багажник",
			PricePerDay:      "200",
			PriceOfDeposit:   "3000",
			PriceOfInsurance: "100",
			Transmission:     domain.TransmissionManual,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/lada_largus_card.png",
			DetailImageURL:   "/images/cars/details/lada_largus.jpeg",
			Location:         "г. Москва, ул. Ленина, 5",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Tesla Model S (2019)",
			Mark:             "Tesla",
			Description:      "Электромобиль, запас хода 450 км, премиум-сегмент, быстрый заряд",
			PricePerDay:      "2500",
			PriceOfDeposit:   "12000",
			PriceOfInsurance: "450",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelElectric,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/tesla_card.png",
			DetailImageURL:   "/images/cars/details/car_detail_photo.png",
			Location:         "г. Москва, Новый Арбат, 15",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Audi A6",
			Mark:             "Audi",
			Description:      "Бизнес-седан с отличной динамикой, кожаный салон, система навигации",
			PricePerDay:      "2800",
			PriceOfDeposit:   "10000",
			PriceOfInsurance: "450",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/audi_a6_card.png",
			DetailImageURL:   "/images/cars/details/audi_a6.jpg",
			Location:         "г. Москва, ул. Пушкина, 8",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Toyota Camry",
			Mark:             "Toyota",
			Description:      "Надежный седан среднего класса, экономичный расход топлива, климат-контроль",
			PricePerDay:      "1800",
			PriceOfDeposit:   "8000",
			PriceOfInsurance: "300",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/toyota_camry_card.png",
			DetailImageURL:   "/images/cars/details/toyota_camry.jpg",
			Location:         "г. Москва, Ленинградский проспект, 40",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Volkswagen Polo",
			Mark:             "Volkswagen",
			Description:      "Компактный городской автомобиль, экономичный, легкий в управлении",
			PricePerDay:      "1200",
			PriceOfDeposit:   "5000",
			PriceOfInsurance: "200",
			Transmission:     domain.TransmissionManual,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/vw_polo_card.png",
			DetailImageURL:   "/images/cars/details/vw_polo.jpg",
			Location:         "г. Москва, ул. Садовая, 22",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Hyundai Solaris",
			Mark:             "Hyundai",
			Description:      "Популярный седан для города, недорогое обслуживание, кондиционер",
			PricePerDay:      "1000",
			PriceOfDeposit:   "5000",
			PriceOfInsurance: "200",
			Transmission:     domain.TransmissionAutomatic,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/hyundai_solaris_card.png",
			DetailImageURL:   "/images/cars/details/hyundai_solaris.jpg",
			Location:         "г. Москва, ул. Гагарина, 12",
			IsFavorite:       false,
		},
		{
			ID:               uuid.New(),
			Name:             "Kia Rio",
			Mark:             "Kia",
			Description:      "Современный хэтчбек, яркий дизайн, мультимедийная система",
			PricePerDay:      "950",
			PriceOfDeposit:   "5000",
			PriceOfInsurance: "200",
			Transmission:     domain.TransmissionManual,
			Fuel:             domain.FuelPetrol,
			Status:           domain.CarAvailable,
			ImageURL:         "/images/cars/cards/kia_rio_card.png",
			DetailImageURL:   "/images/cars/details/kia_rio.jpg",
			Location:         "г. Москва, Проспект Мира, 55",
			IsFavorite:       false,
		},
		{
			ID:             uuid.New(),
			Name:           "Nissan Qashqai",
			Mark:           "Nissan",
			Description:    "Компактный кроссовер, удобен для семейных поездок, панорамная крыша",
			PricePerDay:    "2200",
			Transmission:   domain.TransmissionAutomatic,
			Fuel:           domain.FuelPetrol,
			Status:         domain.CarAvailable,
			ImageURL:       "/images/cars/cards/nissan_qashqai_card.png",
			DetailImageURL: "/images/cars/details/nissan_qashqai.jpg",
			Location:       "г. Москва, ул. Маяковского, 30",
			IsFavorite:     false,
		},
		{
			ID:             uuid.New(),
			Name:           "Mazda CX-5",
			Mark:           "Mazda",
			Description:    "Стильный кроссовер, отличная управляемость, премиальная акустика",
			PricePerDay:    "2400",
			Transmission:   domain.TransmissionAutomatic,
			Fuel:           domain.FuelPetrol,
			Status:         domain.CarAvailable,
			ImageURL:       "/images/cars/cards/mazda_cx5_card.png",
			DetailImageURL: "/images/cars/details/mazda_cx5.jpg",
			Location:       "г. Москва, ул. Чехова, 18",
			IsFavorite:     false,
		},
		{
			ID:             uuid.New(),
			Name:           "Renault Duster",
			Mark:           "Renault",
			Description:    "Проходимый кроссовер, надежный для любых дорог, большой клиренс",
			PricePerDay:    "1500",
			Transmission:   domain.TransmissionManual,
			Fuel:           domain.FuelPetrol,
			Status:         domain.CarAvailable,
			ImageURL:       "/images/cars/cards/renault_duster_card.png",
			DetailImageURL: "/images/cars/details/renault_duster.jpg",
			Location:       "г. Москва, Рублевское шоссе, 100",
			IsFavorite:     false,
		},
		{
			ID:             uuid.New(),
			Name:           "Ford Focus",
			Mark:           "Ford",
			Description:    "Динамичный хэтчбек, спортивная подвеска, мультимедиа с Bluetooth",
			PricePerDay:    "1400",
			Transmission:   domain.TransmissionAutomatic,
			Fuel:           domain.FuelPetrol,
			Status:         domain.CarAvailable,
			ImageURL:       "/images/cars/cards/ford_focus_card.png",
			DetailImageURL: "/images/cars/details/ford_focus.jpg",
			Location:       "г. Москва, ул. Достоевского, 7",
			IsFavorite:     false,
		},
		{
			ID:             uuid.New(),
			Name:           "Skoda Octavia",
			Mark:           "Skoda",
			Description:    "Просторный лифтбек, огромный багажник, комфортная подвеска",
			PricePerDay:    "1600",
			Transmission:   domain.TransmissionAutomatic,
			Fuel:           domain.FuelPetrol,
			Status:         domain.CarAvailable,
			ImageURL:       "/images/cars/cards/skoda_octavia_card.png",
			DetailImageURL: "/images/cars/details/skoda_octavia.jpg",
			Location:       "г. Москва, Большая Дмитровка, 3",
			IsFavorite:     false,
		},
	}

	for _, car := range cars {
		if err := db.Create(&car).Error; err != nil {
			return err
		}
		log.Printf("Создана машина: %s", car.Name)
	}

	log.Println("База данных успешно заполнена тестовыми данными")
	return nil
}
