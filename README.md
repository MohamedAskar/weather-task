# 🌦️ TheWeatherReport

A modern, feature-rich Flutter weather application that provides real-time weather information using the OpenWeatherMap API. The app follows clean architecture principles and implements best practices for Flutter development.

## 📱 Demo

<div align="center">

https://github.com/user-attachments/assets/51edbaa5-9c94-4530-81ce-04ec0ef29cda

</div>

## ✨ Features

### 🌤️ Weather Information
- **Current Weather**: Real-time weather data with temperature, humidity, pressure, wind speed, and more
- **5-Day Forecast**: Detailed weather predictions for the upcoming days
- **Today's Hourly Forecast**: Hour-by-hour weather updates for the current day
- **Sunrise/Sunset Times**: Daily sunrise and sunset information

### 📍 Location Services
- **GPS Location**: Automatic weather data for your current location
- **Location Search**: Search for weather in any city worldwide
- **Location Permissions**: Intelligent handling of location permissions

### 🎨 User Experience
- **Dark/Light Theme**: Automatic theme switching based on weather conditions
- **Responsive Design**: Optimized for different screen sizes
- **Pull-to-Refresh**: Easy data refresh functionality
- **Error Handling**: Graceful error handling with user-friendly messages

### 🌍 Localization
- **Multi-language Support**: Available in English and German
- **Unit Conversion**: Toggle between Metric and Imperial units
- **Local Time Display**: Shows local time for searched locations

## 🏗️ Architecture

The app follows **Clean Architecture** principles with a well-organized folder structure:

```
lib/
├── core/                 # Core functionality
│   ├── configuration/    # App configuration
│   ├── constants/        # App constants
│   ├── extensions/       # Dart extensions
│   ├── network/          # Network layer
│   └── theme/           # App theming
├── l10n/                # Localization files
├── models/              # Data models
├── repositories/        # Data repositories
├── screens/             # UI screens
├── services/            # Business logic services
├── utils/               # Utility functions
└── widgets/             # Reusable widgets
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- OpenWeatherMap API key

### Installation

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd weather-task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up OpenWeatherMap API**
   - Get your free API key from [OpenWeatherMap](https://openweathermap.org/api)
   - Create a `.env` file in the root directory:
   ```env
   API_KEY=your_openweathermap_api_key_here
   WEATHER_API_URL=https://api.openweathermap.org/data/2.5
   GEOCODING_API_URL=https://api.openweathermap.org/geo/1.0
   ```

4. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Project Structure

### Models
- **Weather Models**: Comprehensive weather data structures using Freezed
- **Location Models**: City suggestions and location data
- **API Models**: Request/response models for OpenWeatherMap API

### Services
- **WeatherService**: Manages weather data fetching and state
- **LocationService**: Handles GPS location and permissions
- **SearchService**: Manages city search functionality
- **UnitService**: Handles unit conversion (Metric/Imperial)

### Repositories
- **WeatherRepository**: API calls for weather data
- **GeoRepository**: Geocoding and location search

### UI Components
- **Responsive Widgets**: Adaptive UI components
- **Custom Animations**: Smooth transitions and loading states
- **Weather Icons**: Custom weather condition icons
- **Search Interface**: Intuitive location search


## 🎨 Design System

- **Custom Font**: Satoshi font family
- **Dynamic Theming**: Adapts based on weather conditions


## 🔧 Configuration

### Environment Variables
Required environment variables in `.env`:
- `API_KEY`: OpenWeatherMap API key
- `WEATHER_API_URL`: Weather API base URL
- `GEOCODING_API_URL`: Geocoding API base URL
- `ICON_BASE_URL`: Weather icons base URL

### Permissions

#### Android
- `ACCESS_FINE_LOCATION`: For precise location access
- `ACCESS_COARSE_LOCATION`: For approximate location access

#### iOS
- Location permissions are handled automatically by the geolocator package


## 📱 Platform Support

- ✅ **Android** (API level 21+)
- ✅ **iOS** (iOS 12.0+)  
- ✅ **Web**
- ✅ **macOS**
- ✅ **Linux**
- ✅ **Windows**

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
