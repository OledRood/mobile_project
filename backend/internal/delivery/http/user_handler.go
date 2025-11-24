package http

import (
	"fmt"
	"mime/multipart"
	"mobile_car_proj/internal/domain"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
)

type UserHandler struct {
	userUC    domain.UserUseCase
	jwtSecret string
}

// saveUploadedFile сохраняет загруженный файл и возвращает имя файла
func saveUploadedFile(c *gin.Context, file *multipart.FileHeader, subfolder string) string {
	// Создаём директорию для хранения файлов, если её нет
	uploadDir := filepath.Join("data", "images", subfolder)
	if err := os.MkdirAll(uploadDir, 0755); err != nil {
		println("Ошибка создания директории:", err.Error())
		return ""
	}

	// Генерируем уникальное имя файла
	ext := filepath.Ext(file.Filename)
	filename := fmt.Sprintf("%s_%d%s", uuid.New().String(), time.Now().Unix(), ext)
	filePath := filepath.Join(uploadDir, filename)

	// Сохраняем файл
	if err := c.SaveUploadedFile(file, filePath); err != nil {
		println("Ошибка сохранения файла:", err.Error())
		return ""
	}

	println("Файл успешно сохранен:", filePath)
	// Возвращаем относительный путь для хранения в БД
	return filepath.Join(subfolder, filename)
}

func (h *UserHandler) GetByID(c *gin.Context) {

	println("GetByID called")
	userIdRaw, exists := c.Get("userId")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Пользователь не аутентифицирован"})
		return
	}

	userIDStr, ok := userIdRaw.(string)
	if !ok || userIDStr == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Неверный идентификатор пользователя в токене"})
		return
	}
	user, err := h.userUC.GetUserByID(userIDStr)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	if user == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Пользователь не найден"})
		return
	}
	c.JSON(http.StatusOK, user)
}

// фабрика создания нового обработчика пользователей
func NewUserHandler(userUC domain.UserUseCase, jwtSecret ...string) *UserHandler {
	secret := ""
	if len(jwtSecret) > 0 {
		secret = jwtSecret[0]
	}
	return &UserHandler{userUC: userUC, jwtSecret: secret}
}

type RegisterRequest struct {
	Email              string `json:"email" binding:"required,email"`
	Password           string `json:"password" binding:"required,min=6"`
	FirstName          string `json:"firstName"`
	LastName           string `json:"lastName"`
	MiddleName         string `json:"middleName"`
	BirthDate          string `json:"birthDate"`
	IsMale             *bool  `json:"isMale"`
	DriverLicense      string `json:"driverLicense"`
	DateOfIssue        string `json:"dateOfIssue"`
	DriverLicensePhoto string `json:"driverLicensePhoto"`
	PassportPhoto      string `json:"passportPhoto"`
}

func (h *UserHandler) Register(c *gin.Context) {
	// Получаем данные из формы
	email := c.PostForm("email")
	password := c.PostForm("password")

	if email == "" || password == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Email и пароль обязательны"})
		return
	}

	if len(password) < 6 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Пароль должен содержать минимум 6 символов"})
		return
	}

	user := &domain.User{
		Email:         email,
		Password:      password,
		FirstName:     c.PostForm("firstName"),
		LastName:      c.PostForm("lastName"),
		MiddleName:    c.PostForm("middleName"),
		BirthDate:     c.PostForm("birthDate"),
		DriverLicense: c.PostForm("driverLicense"),
		DateOfIssue:   c.PostForm("dateOfIssue"),
	}

	// Парсим поле isMale
	if isMaleStr := c.PostForm("isMale"); isMaleStr != "" {
		user.IsMale = isMaleStr == "true"
	} else {
		user.IsMale = true
	}

	// Обработка загруженных файлов
	if driverLicenseFile, err := c.FormFile("driverLicensePhoto"); err == nil {
		// Сохраняем файл водительского удостоверения
		filename := saveUploadedFile(c, driverLicenseFile, "driver_licenses")
		if filename != "" {
			user.DriverLicensePhoto = filename
		}
	}

	if passportFile, err := c.FormFile("passportPhoto"); err == nil {
		// Сохраняем файл паспорта
		filename := saveUploadedFile(c, passportFile, "passports")
		if filename != "" {
			user.PassportPhoto = filename
		}
	}

	if avatarFile, err := c.FormFile("avatar"); err == nil {
		// Сохраняем аватар
		filename := saveUploadedFile(c, avatarFile, "avatars")
		if filename != "" {
			user.Avatar = filename
		}
	}

	tokens, err := h.userUC.RegisterUser(user)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, tokens)
}

type LoginRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

func (h *UserHandler) Login(c *gin.Context) {
	var req LoginRequest
	err := c.ShouldBindJSON(&req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	tokens, err := h.userUC.LoginUser(req.Email, req.Password)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, tokens)
}

type RefreshRequest struct {
	RefreshToken string `json:"refresh_token" binding:"required"`
}

func (h *UserHandler) Refresh(c *gin.Context) {
	var req RefreshRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tokens, err := h.userUC.RefreshToken(req.RefreshToken)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, tokens)
}

// UpdateMe updates fields of the currently authenticated user (partial update supported)
func (h *UserHandler) UpdateMe(c *gin.Context) {
	userIdRaw, exists := c.Get("userId")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Пользователь не аутентифицирован"})
		return
	}

	userIDStr, ok := userIdRaw.(string)
	if !ok || userIDStr == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Неверный идентификатор пользователя в токене"})
		return
	}

	user, err := h.userUC.GetUserByID(userIDStr)
	if err != nil || user == nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Не удалось загрузить пользователя"})
		return
	}

	// Update fields from form data
	// Frontend sends all these fields, defaulting to empty string if null
	user.FirstName = c.PostForm("first_name")
	user.LastName = c.PostForm("last_name")
	user.MiddleName = c.PostForm("middle_name")
	user.BirthDate = c.PostForm("birth_date")

	// Handle Avatar File
	if avatarFile, err := c.FormFile("avatar"); err == nil {
		filename := saveUploadedFile(c, avatarFile, "avatars")
		if filename != "" {
			user.Avatar = filename
		}
	}

	if err := h.userUC.UpdateUser(user); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, user)
}

// DeleteMe deletes the currently authenticated user
func (h *UserHandler) DeleteMe(c *gin.Context) {
	userIdRaw, exists := c.Get("userId")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Пользователь не аутентифицирован"})
		return
	}

	userIDStr, ok := userIdRaw.(string)
	if !ok || userIDStr == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Неверный идентификатор пользователя в токене"})
		return
	}

	if err := h.userUC.DeleteUser(userIDStr); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.Status(http.StatusNoContent)
}

// ValidateToken validates the provided JWT token and returns user info
func (h *UserHandler) ValidateToken(c *gin.Context) {
	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Authorization header missing"})
		return
	}

	// Extract token from "Bearer <token>" format
	parts := strings.Split(authHeader, " ")
	if len(parts) != 2 || parts[0] != "Bearer" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid Authorization header format"})
		return
	}

	tokenStr := parts[1]

	// Parse and validate JWT token
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, jwt.ErrSignatureInvalid
		}
		return []byte(h.jwtSecret), nil
	})

	if err != nil || !token.Valid {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
		return
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token claims"})
		return
	}

	userID, ok := claims["userId"].(string)
	if !ok || userID == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "userId not found in token"})
		return
	}

	// Get user info
	user, err := h.userUC.GetUserByID(userID)
	if err != nil || user == nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "User not found"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"valid":  true,
		"userId": user.ID,
		"email":  user.Email,
		"role":   user.Role,
	})
}
