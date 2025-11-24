package usecase

import (
	"errors"
	"mobile_car_proj/internal/domain"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
	// "golang.org/x/crypto/bcrypt"
)

type UserUseCase struct {
	userRepo  domain.UserRepository
	jwtSecret string
}

// NewUserUseCase creates a new user use case
func NewUserUseCase(userRepo domain.UserRepository, jwtSecret string) *UserUseCase {
	return &UserUseCase{
		userRepo:  userRepo,
		jwtSecret: jwtSecret,
	}
}

func (uc *UserUseCase) RegisterUser(user *domain.User) (*domain.TokenResponse, error) {
	// Check if user already exists
	existingUser, err := uc.userRepo.GetByEmail(user.Email)
	if err == nil && existingUser != nil {
		return nil, errors.New("Пользователь с таким email уже существует")
	}
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		return nil, err
	}

	// Hash password
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return nil, err
	}
	user.Password = string(hashedPassword)

	// Set default avatar
	if user.Avatar == "" {
		user.Avatar = "avatar1.png"
	}

	// Create user
	err = uc.userRepo.Create(user)
	if err != nil {
		return nil, err
	}

	// Generate new pair of tokens
	return uc.generateTokenPair(user)
}

func (uc *UserUseCase) generateTokenPair(user *domain.User) (*domain.TokenResponse, error) {
	// Generate Access Token
	claims := jwt.MapClaims{
		"sub":       user.ID,
		"userId":    user.ID.String(),
		"email":     user.Email,
		"firstName": user.FirstName,
		"lastName":  user.LastName,
		"role":      user.Role,
		"exp":       time.Now().Add(time.Hour * 10).Unix(),
		"iat":       time.Now().Unix(),
	}
	jwtToken := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	accessToken, err := jwtToken.SignedString([]byte(uc.jwtSecret))
	if err != nil {
		return nil, err
	}

	refreshToken := uuid.New().String()
	refreshTokenExpiresAt := time.Now().Add(time.Hour * 24 * 120) // Expires in 120 days

	user.RefreshToken = refreshToken
	user.RefreshTokenExpiresAt = refreshTokenExpiresAt

	if err := uc.userRepo.Update(user); err != nil {
		return nil, err
	}

	return &domain.TokenResponse{
		User:         user,
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
	}, nil
}

func (uc *UserUseCase) LoginUser(email, password string) (*domain.TokenResponse, error) {
	user, err := uc.userRepo.GetByEmail(email)
	if err != nil {
		return nil, errors.New("Неверный email или пароль")
	}
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		return nil, errors.New("Неверный email или пароль")
	}
	return uc.generateTokenPair(user)
}

func (uc *UserUseCase) RefreshToken(refreshToken string) (*domain.TokenResponse, error) {
	user, err := uc.userRepo.GetByRefreshToken(refreshToken)
	if err != nil {
		return nil, errors.New("Неверный токен обновления")
	}

	if time.Now().After(user.RefreshTokenExpiresAt) {
		return nil, errors.New("Токен обновления истёк")
	}

	// Generate new pair of tokens
	return uc.generateTokenPair(user)
}

// // LoginUser authenticates a user
// func (uc *UserUseCase) LoginUser(email, password string) (*domain.User, error) {
// 	user, err := uc.userRepo.GetByEmail(email)
// 	if err != nil {
// 		return nil, errors.New("invalid email or password")
// 	}

// 	// Compare password
// 	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
// 		return nil, errors.New("invalid email or password")
// 	}

// 	return user, nil
// }

// // GetUserByID retrieves a user by ID
// func (uc *UserUseCase) GetUserByID(id uuid.UUID) (*domain.User, error) {
// 	return uc.userRepo.GetByID(id)
// }

// // UpdateUser updates user information
// func (uc *UserUseCase) UpdateUser(user *domain.User) error {
// 	return uc.userRepo.Update(user)
// }

func (uc *UserUseCase) GetUserByID(id string) (*domain.User, error) {
	uuidID, err := uuid.Parse(id)
	if err != nil {
		return nil, errors.New("Неверный формат идентификатора пользователя")
	}
	return uc.userRepo.GetByID(uuidID)
}

// UpdateUser updates user information in the repository
func (uc *UserUseCase) UpdateUser(user *domain.User) error {
	return uc.userRepo.Update(user)
}

func (uc *UserUseCase) DeleteUser(id string) error {
	uuidID, err := uuid.Parse(id)
	if err != nil {
		return errors.New("Неверный формат идентификатора пользователя")
	}
	return uc.userRepo.Delete(uuidID)
}
