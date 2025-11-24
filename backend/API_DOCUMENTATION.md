# API Documentation - Mobile Car Proj Backend

## Базовая информация

- **Base URL**: `http://localhost:8080/api/v1`
- **Content-Type**: `application/json` (если не указано иное)
- **Health Check**: `GET /health` → `{"status": "ok"}`

---

## Статические файлы (Изображения)

### Типы изображений автомобилей

API поддерживает два типа изображений для каждого автомобиля:

1. **Изображение для карточек** (`image_url`) - компактное изображение для отображения в списках и карточках
   - Используется в эндпоинтах: `/api/v1/car/`, `/api/v1/car/summary`, `/api/v1/car/favorites`
   - Пример: `/images/cars/cards/BMW_X5_card.png`
   - Хранятся в: `data/images/cars/cards/`

2. **Детальное изображение** (`detail_image_url`) - полноразмерное изображение для страницы автомобиля
   - Используется в эндпоинтах: `/api/v1/car/details/:id`
   - Пример: `/images/cars/details/BMW_X5.jpg`
   - Хранятся в: `data/images/cars/details/`

### Получить изображение автомобиля

**GET** `/images/cars/cards/:filename` или `/images/cars/details/:filename`

Возвращает изображение автомобиля. Если файл не найден, возвращается placeholder.

**Примеры**: 
- `http://localhost:8080/images/cars/cards/BMW_X5_card.png`
- `http://localhost:8080/images/cars/details/BMW_X5.jpg`

### Получить аватар пользователя

**GET** `/images/avatars/:filename`

Возвращает аватар пользователя. Если файл не найден, возвращается дефолтный аватар.

**Пример**: `http://localhost:8080/images/avatars/avatar1.png`

### Прямой доступ к статическим файлам

**GET** `/images/*`

Альтернативный путь для прямого доступа к статическим файлам.

**Пример**: `http://localhost:8080/images/cars/cards/BMW_X5_card.png`

---

## Аутентификация

Большинство эндпоинтов требуют JWT токен в заголовке:
```
Authorization: Bearer <access_token>
```

### Регистрация пользователя

**POST** `/api/v1/auth/register`

**Content-Type**: `multipart/form-data`

**Поля формы**:
- `email` (required) - Email пользователя
- `password` (required, min 6 символов) - Пароль
- `firstName` (optional) - Имя
- `lastName` (optional) - Фамилия
- `middleName` (optional) - Отчество
- `birthDate` (optional) - Дата рождения
- `isMale` (optional, default: true) - Пол (true/false)
- `driverLicense` (optional) - Номер водительского удостоверения
- `dateOfIssue` (optional) - Дата выдачи ВУ
- `driverLicensePhoto` (optional, file) - Фото водительского удостоверения
- `passportPhoto` (optional, file) - Фото паспорта
- `avatar` (optional, file) - Аватар пользователя

**Пример запроса** (cURL):
```bash
curl -X POST http://localhost:8080/api/v1/auth/register \
  -F "email=user@example.com" \
  -F "password=mypassword123" \
  -F "firstName=Иван" \
  -F "lastName=Иванов" \
  -F "isMale=true" \
  -F "driverLicensePhoto=@/path/to/license.jpg" \
  -F "avatar=@/path/to/avatar.png"
```

**Успешный ответ** (201 Created):
```json
{
  "access_token": "eyJhbGc...",
  "refresh_token": "eyJhbGc...",
  "expires_in": 3600
}
```

**Ошибки**:
- `400 Bad Request` - Невалидные данные
- `400 Bad Request` - Email уже используется

---

### Вход пользователя

**POST** `/api/v1/auth/login`

**Content-Type**: `application/json`

**Тело запроса**:
```json
{
  "email": "user@example.com",
  "password": "mypassword123"
}
```

**Успешный ответ** (200 OK):
```json
{
  "access_token": "eyJhbGc...",
  "refresh_token": "eyJhbGc...",
  "expires_in": 3600
}
```

**Ошибки**:
- `400 Bad Request` - Невалидные данные
- `401 Unauthorized` - Неверные учетные данные

---

### Обновление токена

**POST** `/api/v1/auth/refresh`

**Content-Type**: `application/json`

**Тело запроса**:
```json
{
  "refresh_token": "eyJhbGc..."
}
```

**Успешный ответ** (200 OK):
```json
{
  "access_token": "eyJhbGc...",
  "refresh_token": "eyJhbGc...",
  "expires_in": 3600
}
```

**Ошибки**:
- `401 Unauthorized` - Невалидный или истекший refresh token

---

### Валидация токена

**GET** `/api/v1/auth/validate`

**Headers**: `Authorization: Bearer <access_token>`

**Успешный ответ** (200 OK):
```json
{
  "valid": true,
  "user_id": "uuid",
  "role": "user"
}
```

**Ошибки**:
- `401 Unauthorized` - Невалидный токен

---

## Пользователи

### Получить профиль текущего пользователя

**GET** `/api/v1/users/me`

**Headers**: `Authorization: Bearer <access_token>`

**Успешный ответ** (200 OK):
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "first_name": "Иван",
  "last_name": "Иванов",
  "middle_name": "Петрович",
  "birth_date": "1990-01-01",
  "is_male": true,
  "driver_license": "1234567890",
  "date_of_issue": "2015-01-01",
  "driver_license_photo": "driver_licenses/uuid_timestamp.jpg",
  "passport_photo": "passports/uuid_timestamp.jpg",
  "avatar": "avatars/uuid_timestamp.png",
  "role": "user",
  "created_at": "2024-01-01T00:00:00Z"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `404 Not Found` - Пользователь не найден

---

### Обновить профиль

**PUT** `/api/v1/users/me`

**Headers**: `Authorization: Bearer <access_token>`

**Content-Type**: `multipart/form-data`

**Поля формы**:
- `firstName` (optional) - Имя
- `lastName` (optional) - Фамилия
- `middleName` (optional) - Отчество
- `birthDate` (optional) - Дата рождения
- `isMale` (optional) - Пол
- `driverLicense` (optional) - Номер ВУ
- `dateOfIssue` (optional) - Дата выдачи ВУ
- `driverLicensePhoto` (optional, file) - Новое фото ВУ
- `passportPhoto` (optional, file) - Новое фото паспорта
- `avatar` (optional, file) - Новый аватар

**Успешный ответ** (200 OK):
```json
{
  "message": "Profile updated successfully"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `400 Bad Request` - Невалидные данные

---

### Удалить аккаунт

**DELETE** `/api/v1/users/me`

**Headers**: `Authorization: Bearer <access_token>`

**Успешный ответ** (200 OK):
```json
{
  "message": "User deleted successfully"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован

---

## Автомобили

### Получить список всех автомобилей

**GET** `/api/v1/car/list`

**Параметры запроса**: нет

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "description": "Премиум кроссовер",
    "price_per_day": "5000",
    "transmission": "Автомат",
    "fuel": "Бензин",
    "status": "available",
    "image_url": "/images/cars/cards/BMW_X5_card.png",
    "detail_image_url": "/images/cars/details/BMW_X5.jpg",
    "location": "г. Москва, ул. Ленина, 1",
    "is_favorite": false,
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T00:00:00Z"
  }
]
```

---

### Получить краткий список автомобилей

**GET** `/api/v1/car/summary`

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "price_per_day": "5000",
    "transmission": "Автомат",
    "fuel": "Бензин",
    "image_url": "bmw_x5.jpg",
    "status": "available"
  }
]
```

---

### Получить детали автомобиля

**GET** `/api/v1/car/details/:id`

**Параметры URL**:
- `id` - UUID автомобиля

**Успешный ответ** (200 OK):
```json
{
  "id": "uuid",
  "name": "BMW X5",
  "mark": "BMW",
  "description": "Премиум кроссовер с полным приводом",
  "price_per_day": "5000",
  "price_of_deposit": "15000",
  "price_of_insurance": "500",
  "transmission": "Автомат",
  "fuel": "Бензин",
  "status": "available",
  "image_url": "/images/cars/cards/BMW_X5_card.png",
  "detail_image_url": "/images/cars/details/BMW_X5.jpg",
  "location": "г. Москва, ул. Ленина, 1",
  "is_favorite": false,
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

**Ошибки**:
- `400 Bad Request` - Невалидный ID
- `404 Not Found` - Автомобиль не найден

---

### Поиск автомобилей

**GET** `/api/v1/car/search?q=<query>`

**Параметры запроса**:
- `q` - Поисковый запрос (название, марка)

**Пример**: `/api/v1/car/search?q=BMW`

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "price_per_day": "5000",
    "transmission": "Автомат",
    "fuel": "Бензин",
    "image_url": "bmw_x5.jpg",
    "status": "available"
  }
]
```

---

### Получить рекомендации

**GET** `/api/v1/car/recommendations`

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "price_per_day": "5000",
    "transmission": "Автомат",
    "fuel": "Бензин",
    "image_url": "/images/cars/cards/BMW_X5_card.png",
    "status": "available"
  }
]
```

**Примечание о изображениях**: 
- `image_url` - изображение для карточек в списках (компактное)
- `detail_image_url` - детальное изображение для страницы автомобиля (полноразмерное)
- Оба поля содержат относительный путь. Для полного URL используйте: `http://localhost:8080{image_url}`




---

### Получить избранные автомобили

**GET** `/api/v1/car/favorites`

**Headers**: `Authorization: Bearer <access_token>`

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "price_per_day": "5000",
    "transmission": "Автомат",
    "fuel": "Бензин",
    "image_url": "/images/cars/cards/BMW_X5_card.png",
    "status": "available",
    "is_favorite": true
  }
]
```
**Ошибки**:
- `401 Unauthorized` - Не авторизован

---

### Установить/снять статус избранного

**POST** `/api/v1/car/favorite/:id`

**Headers**: `Authorization: Bearer <access_token>`

**Параметры URL**:
- `id` - UUID автомобиля

**Content-Type**: `application/json`

**Тело запроса**:
```json
{
  "is_favorite": true
}
```

**Успешный ответ** (200 OK):
```json
{
  "is_favorite": true
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `400 Bad Request` - Невалидный ID

---

### Создать автомобиль (только для администраторов)

**POST** `/api/v1/car/create`

**Headers**: `Authorization: Bearer <access_token>`

**Content-Type**: `application/json`

**Тело запроса**:
```json
{
  "name": "BMW X5",
  "mark": "BMW",
  "description": "Премиум кроссовер",
  "price_per_day": "5000",
  "transmission": "Автомат",
  "fuel": "Бензин",
  "status": "available",
  "image_url": "/images/cars/cards/BMW_X5_card.png",
  "detail_image_url": "/images/cars/details/BMW_X5.jpg",
  "location_id": "uuid"
}
```

**Успешный ответ** (201 Created):
```json
{
  "id": "uuid",
  "name": "BMW X5",
  "mark": "BMW",
  "description": "Премиум кроссовер",
  "price_per_day": "5000",
  "transmission": "Автомат",
  "fuel": "Бензин",
  "status": "available",
  "image_url": "/images/cars/cards/BMW_X5_card.png",
  "detail_image_url": "/images/cars/details/BMW_X5.jpg",
  "location_id": "uuid",
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `403 Forbidden` - Недостаточно прав
- `400 Bad Request` - Невалидные данные

---

## Аренда

### Забронировать автомобиль

**POST** `/api/v1/car/book/:id`

**Headers**: `Authorization: Bearer <access_token>`

**Параметры URL**:
- `id` - UUID автомобиля

**Content-Type**: `application/json`

**Тело запроса**:
```json
{
  "start_rent_date": "2024-01-01",
  "end_rent_date": "2024-01-05",
  "price_of_insurance": "500",
  "total_price": "20500",
  "price_of_deposit": "10000",
  "driver_name": "Иван Иванов",
  "driver_license_number": "1234567890",
  "location": "г. Москва, ул. Ленина, 1"
}
```

**Успешный ответ** (201 Created):
```json
{
  "id": "uuid",
  "user_id": "uuid",
  "car_id": "uuid",
  "start_rent_date": "2024-01-01",
  "end_rent_date": "2024-01-05",
  "price_of_insurance": "500",
  "total_price": "20500",
  "price_of_deposit": "10000",
  "driver_name": "Иван Иванов",
  "driver_license_number": "1234567890",
  "location": "г. Москва, ул. Ленина, 1",
  "status": "active",
  "created_at": "2024-01-01T00:00:00Z"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `400 Bad Request` - Невалидные данные
- `500 Internal Server Error` - Автомобиль уже забронирован

---

### Получить историю аренды пользователя

**GET** `/api/v1/car/rent/history`

**Headers**: `Authorization: Bearer <access_token>`

**Успешный ответ** (200 OK):
```json
[
  {
    "id": "uuid",
    "name": "BMW X5",
    "start_rent_date": "2024-01-01",
    "end_rent_date": "2024-01-05",
    "status": "active"
  }
]
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован

---

### Получить детали аренды

**GET** `/api/v1/car/book/:bookId`

**Headers**: `Authorization: Bearer <access_token>`

**Параметры URL**:
- `bookId` - UUID аренды

**Успешный ответ** (200 OK):
```json
{
  "id": "uuid",
  "car": {
    "id": "uuid",
    "name": "BMW X5",
    "mark": "BMW",
    "price_per_day": "1000",
    "image_url": "/images/cars/cards/BMW_X5_card.png",
    "detail_image_url": "/images/cars/details/BMW_X5.jpg",
    "transmission": "Автомат",
    "fuel": "Бензин"
  },
  "start_rent_date": "2024-01-01",
  "end_rent_date": "2024-01-05",
  "driver_name": "Иван Иванов",
  "driver_license_number": "1234567890",
  "status": "active",
  "price_of_insurance": "500",
  "total_price": "20500",
  "location": "г. Москва, ул. Ленина, 1"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `400 Bad Request` - Невалидный ID
- `404 Not Found` - Аренда не найдена

---

### Отменить аренду

**DELETE** `/api/v1/car/rent/:rentId`

**Headers**: `Authorization: Bearer <access_token>`

**Параметры URL**:
- `rentId` - UUID аренды

**Успешный ответ** (200 OK):
```json
{
  "message": "Rent cancelled successfully"
}
```

**Ошибки**:
- `401 Unauthorized` - Не авторизован
- `400 Bad Request` - Невалидный ID
- `500 Internal Server Error` - Ошибка при отмене

---

## Статические файлы

### Получить изображение

**GET** `/images/{subfolder}/{filename}`

**Примеры**:
- `/images/avatars/uuid_timestamp.png`
- `/images/driver_licenses/uuid_timestamp.jpg`
- `/images/passports/uuid_timestamp.jpg`

**Успешный ответ**: Файл изображения

**Ошибки**:
- `404 Not Found` - Файл не найден

---

## Типы данных

### CarStatus (enum)
- `available` - Доступна для аренды
- `rented` - Арендована
- `maintenance` - На обслуживании
- `inactive` - Неактивна

### TransmissionType (enum)
- `Автомат` - Автоматическая
- `Механика` - Механическая

### FuelType (enum)
- `Бензин` - Бензиновый двигатель
- `Дизель` - Дизельный двигатель
- `Электро` - Электрический двигатель
- `Гибрид` - Гибридный двигатель

### RentStatus (enum)
- `active` - Активная аренда
- `completed` - Завершенная аренда
- `cancelled` - Отмененная аренда

### UserRole (enum)
- `user` - Обычный пользователь
- `admin` - Администратор

---

## Коды ошибок

- `200 OK` - Успешный запрос
- `201 Created` - Ресурс успешно создан
- `400 Bad Request` - Невалидные данные в запросе
- `401 Unauthorized` - Требуется аутентификация
- `403 Forbidden` - Недостаточно прав
- `404 Not Found` - Ресурс не найден
- `500 Internal Server Error` - Внутренняя ошибка сервера

---

## CORS

Сервер настроен на прием запросов с:
- `http://localhost:*` (любой порт)
- `http://127.0.0.1:*` (любой порт)

Разрешенные методы: `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS`

Разрешенные заголовки: `Origin`, `Content-Type`, `Accept`, `Authorization`
