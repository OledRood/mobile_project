# 🚀 Быстрый старт: Google OAuth

## ✅ Что уже сделано

1. ✅ Установлен пакет `google_sign_in`
2. ✅ Создан `GoogleAuthService` - сервис для работы с Google
3. ✅ Обновлен `AuthRepository` с методом входа через Google
4. ✅ Обновлен `SignInViewModel` для обработки Google входа
5. ✅ UI с кнопкой "Войти через Google" уже готов

## 📋 Что нужно сделать (по порядку)

### 1️⃣ Получить SHA-1 (для Android)

Откройте терминал в корне проекта:

```bash
cd android
./gradlew signingReport
```

Найдите в выводе строку с `SHA1:` для debug варианта и **скопируйте** этот хеш.

### 2️⃣ Создать Google Cloud Project

1. Откройте [Google Cloud Console](https://console.cloud.google.com/)
2. Создайте новый проект (или выберите существующий)
3. Включите **Google+ API**

### 3️⃣ Настроить OAuth Consent Screen

1. **APIs & Services** → **OAuth consent screen**
2. Выберите **External**
3. Заполните:
   - App name: `Mobile Study`
   - User support email: ваш email
   - Developer email: ваш email
4. Нажмите **Save and Continue**
5. На экране **Scopes** - Skip
6. Добавьте **Test users** (свой email)
7. Нажмите **Save and Continue**

### 4️⃣ Создать Android Client ID

1. **APIs & Services** → **Credentials**
2. **Create Credentials** → **OAuth client ID**
3. Выберите **Android**
4. Заполните:
   - Name: `Mobile Study Android`
   - Package name: `com.example.mobile_study`
   - SHA-1: вставьте тот, что скопировали на шаге 1
5. Нажмите **Create**

### 5️⃣ Создать iOS Client ID

1. **Create Credentials** → **OAuth client ID**
2. Выберите **iOS**
3. Заполните:
   - Name: `Mobile Study iOS`
   - Bundle ID: `com.example.mobileStudy`
4. Нажмите **Create**
5. **Скопируйте Client ID!** (понадобится на следующем шаге)

### 6️⃣ Настроить iOS (Info.plist)

Откройте файл `ios/Runner/Info.plist` и добавьте ПЕРЕД `</dict>`:

```xml
<!-- Google Sign-In Configuration -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- ЗАМЕНИТЕ: если Client ID = 123-abc.apps.googleusercontent.com -->
            <!-- То здесь: com.googleusercontent.apps.123-abc -->
            <string>com.googleusercontent.apps.ВАШ_IOS_CLIENT_ID</string>
        </array>
    </dict>
</array>

<key>GIDClientID</key>
<!-- ЗАМЕНИТЕ на полный iOS Client ID -->
<string>ВАШ_IOS_CLIENT_ID.apps.googleusercontent.com</string>
```

### 7️⃣ Установить iOS зависимости

```bash
cd ios
pod install
cd ..
```

### 8️⃣ Протестировать!

```bash
flutter run
```

**Важно**: Тестируйте на реальном устройстве! Эмулятор может не работать.

## 🔥 Быстрая проверка

После запуска приложения:

1. Нажмите кнопку "Войти через Google"
2. Должно открыться окно выбора Google аккаунта
3. Выберите свой аккаунт
4. Дайте разрешения
5. Приложение должно перейти на главный экран

## 🐛 Проблемы?

### Android не работает
- ✅ Проверьте Package Name = `com.example.mobile_study`
- ✅ Проверьте SHA-1 правильный
- ✅ Включен ли Google+ API?

### iOS не работает
- ✅ Проверьте Bundle ID в Info.plist и Google Console совпадают
- ✅ Запустили `pod install`?
- ✅ Client ID правильно вставлен в Info.plist?

### "Вход отменен"
- ✅ Добавлен ли ваш email в Test users?
- ✅ Попробуйте другой аккаунт

## 📚 Подробные документы

- `GOOGLE_OAUTH_SETUP.md` - полная инструкция по настройке
- `GOOGLE_OAUTH_EXPLANATION.md` - объяснение архитектуры
- `IOS_INFO_PLIST_TEMPLATE.md` - шаблон для iOS

## 🎯 Следующие шаги (для production)

1. Создать Backend endpoint `/auth/google`
2. Раскомментировать код отправки на backend в `AuthRepository`
3. Создать Production OAuth credentials с release SHA-1
4. Добавить обработку ошибок в UI (SnackBar)
