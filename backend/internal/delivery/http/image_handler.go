package http

import (
	"net/http"
	"os"
	"path/filepath"

	"github.com/gin-gonic/gin"
)

type ImageHandler struct {
	baseImagePath string
}

func NewImageHandler(baseImagePath string) *ImageHandler {
	return &ImageHandler{baseImagePath: baseImagePath}
}

// GetCarImage возвращает изображение машины или placeholder
// GET /api/v1/car/image/:filename
func (h *ImageHandler) GetCarImage(c *gin.Context) {
	filename := c.Param("filename")
	imagePath := filepath.Join(h.baseImagePath, "cars", filename)

	// Проверяем существование файла
	if _, err := os.Stat(imagePath); os.IsNotExist(err) {
		// Возвращаем placeholder если файл не найден
		placeholderPath := filepath.Join(h.baseImagePath, "placeholder.png")
		if _, err := os.Stat(placeholderPath); os.IsNotExist(err) {
			c.JSON(http.StatusNotFound, gin.H{"error": "Image not found"})
			return
		}
		c.File(placeholderPath)
		return
	}

	c.File(imagePath)
}

// GetAvatarImage возвращает аватар пользователя
// GET /api/v1/user/avatar/:filename
func (h *ImageHandler) GetAvatarImage(c *gin.Context) {
	filename := c.Param("filename")
	imagePath := filepath.Join(h.baseImagePath, "avatars", filename)

	if _, err := os.Stat(imagePath); os.IsNotExist(err) {
		placeholderPath := filepath.Join(h.baseImagePath, "avatars", "default_avatar.png")
		if _, err := os.Stat(placeholderPath); os.IsNotExist(err) {
			c.JSON(http.StatusNotFound, gin.H{"error": "Avatar not found"})
			return
		}
		c.File(placeholderPath)
		return
	}

	c.File(imagePath)
}
