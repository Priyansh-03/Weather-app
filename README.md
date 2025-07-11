# 🌦 Flutter Weather App - Built on Android Studio

A beautiful and lightweight weather application built with **Flutter** and **Dart**, delivering real-time weather updates using the OpenWeatherMap API.

---

## 📸 Preview

## 📱 Mobile UI Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/79b6f71b-cf59-4591-8b57-b1d1e358309d" alt="Home" width="220"/>
  <img src="https://github.com/user-attachments/assets/ca3c4635-1aab-4a67-bf20-3e11fbd725e4" alt="Loading" width="220"/>
  <img src="https://github.com/user-attachments/assets/a918be9d-4ed8-4bb8-b3f1-69094dc138e4" alt="Weather Info" width="220"/>
  <img src="https://github.com/user-attachments/assets/f1161082-72ad-4403-a44c-059a90e04b42" alt="Dark Mode" width="220"/>
</p>

---

## 🖥️ Windows App Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/34717961-e635-4652-aa15-61e1881149fc" alt="Windows 1" width="700"/>
  <img src="https://github.com/user-attachments/assets/ae8a2390-e763-49ed-9976-59aa1c248efd" alt="Windows 2" width="700"/>
  <img src="https://github.com/user-attachments/assets/4aa2f1d6-392a-49cb-a346-eb8b5126bd10" alt="Windows 3" width="700"/>
</p>



---

## 📦 Built with the tools and technologies:

<p align="center">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white"/>
  <img src="https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=json&logoColor=white"/>
</p>

---

## 🚀 Features

- 🔍 Search city weather
- 📍 Get location-based weather (future scope)
- ☀️ Shows temperature, humidity, wind, sunrise/sunset
- 🌓 Light/Dark mode toggle
- 🧠 Saves recent city searches
- 🌀 Lottie-based animations for weather types
- ⏬ Swipe down to refresh
  


---

## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/your-username/flutter-weather-app.git
cd flutter-weather-app
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Insert your OpenWeatherMap API key
- Sign in to [https://openweathermap.org/](https://openweathermap.org/)
- Go to **My API Keys** under profile
- Copy your key

In `weather_services.dart`, replace this:
```dart
final String apikey="PASTE_YOUR_API_KEY";
```
like this:
```dart
final String apikey="sasx123abc78945askandj";
```

### 4. Run the app
```bash
flutter run
```

```bash
or click on run button to run main.dart
```

---

## 📁 Project Structure

```
lib/
├── main.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   └── weather_card.dart
├── services/
│   └── weather_services.dart
├── modules/
│   └── weather_module.dart
```

---

## 📌 Assumptions / TODOs

### ✅ Implemented
- Theme toggle with ValueNotifier + SharedPreferences
- Pull to refresh
- Error + Loading states
- Recent city memory

### 📝 TODOs
- Secure API key using `.env`
- Add GPS-based weather fetching
- Add splash screen and launcher icon for Play Store

---

## 🧑‍💻 Author

Made by Priyansh Srivastava 💙

🔗 [LinkedIn](https://www.linkedin.com/in/priyansh-sriv/)  |  🌐 [GitHub](https://github.com/Priyansh-03/)

---

## 📄 License

This project is licensed under the MIT License.
