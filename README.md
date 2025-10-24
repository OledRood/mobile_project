# Mobile Study App

Flutter приложение для бронирования и управления учебными материалами.

## Замоканные данные для сервера

**Важно!** В приложении используются моки вместо реальных запросов к серверу. Ниже список всех замоканных функций и данных.

### Восстановление пароля (Forgot Password)

**Файл:** `lib/features/auth/forgot_password.dart/domain/forgot_password_viewmodel.dart`

**Отправка кода на email (строки 85-87):**
- Мок: имитация отправки кода с задержкой 2 секунды
- Реальный запрос закомментирован: `AuthRepository.sendPasswordResetCode()`
- Код НЕ отправляется на email

**Проверка кода подтверждения (строка 95):**
- Единственный правильный код: `"1234"`
- Любой другой код показывает ошибку "Неверный код подтверждения"
- Код хардкоднен, не проверяется на сервере

### Сброс пароля (Reset Password)

**Файл:** `lib/core/auth/auth_repository.dart` (строки 223-237)

- Мок: всегда возвращает `true` (успех)
- Задержка: 2 секунды
- Реальный запрос закомментирован: `/auth/reset-password`
- Пароль НЕ сохраняется на сервере

### Регистрация (Sign Up)

**Файл:** `lib/core/auth/auth_repository.dart` (строки 62-94)

Возвращает фейковые данные:
- Токены: `fake_token_123` и `fake_refresh_token_123`
- User ID: всегда `'123'`
- Реальный запрос закомментирован: `/auth/register`
- Файлы (фото, документы) НЕ загружаются на сервер

### Вход через Google (Google Sign In)

**Файл:** `lib/core/auth/auth_repository.dart` (строки 149-180)

- ID Token от Google НЕ проверяется на сервере
- Токены: `google_fake_token_{id}` и `google_fake_refresh_token_{id}`
- User ID: используется ID от Google аккаунта
- Реальный запрос закомментирован: `/auth/google`
- Токен НЕ верифицируется на backend

## Что раскомментировать для работы с реальным сервером

1. **Forgot Password - отправка кода** (`forgot_password_viewmodel.dart`, строка 86):
   ```dart
   AuthRepository.sendPasswordResetCode(emailController.text).then((value) {});
   ```

2. **Forgot Password - проверка кода** (`forgot_password_viewmodel.dart`, строка 95):
   - Заменить хардкод `"1234"` на проверку с сервера

3. **Reset Password** (`auth_repository.dart`, строки 231-235):
   ```dart
   final response = await _apiService.post('/auth/reset-password', {
     'email': email,
     'newPassword': newPassword,
   });
   ```

4. **Registration** (`auth_repository.dart`, строки 62-66):
   ```dart
   final response = await _apiService.postMultipart(
     '/auth/register',
     fields,
     files,
   );
   ```

5. **Google Sign In** (`auth_repository.dart`, строки 149-151):
   ```dart
   final response = await _apiService.post('/auth/google', {
     'idToken': idToken,
   });
   ```

## Запуск проекта

```bash
# Установка зависимостей
flutter pub get

# Генерация кода (freezed, json_serializable)
./codegen.sh

# Запуск приложения
flutter run
```

## Архитектура

Приложение построено на:
- **Riverpod** - управление состоянием
- **GoRouter** - навигация
- **Freezed** - immutable модели
- **MVVM** - архитектурный паттерн

## Важные замечания

- Все моки работают с задержкой для имитации сетевых запросов
- Токены фейковые и не проходят валидацию на реальном сервере
- Код для восстановления пароля: только `"1234"`
- AutoDispose используется для forgot_password ViewModels - автоочистка при уходе со страницы
- Навигация через `go()` вместо `push()` - нельзя вернуться назад после смены пароля
