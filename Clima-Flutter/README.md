# Clima ☀️

A beautiful, real-time weather application built with Flutter that provides current weather conditions based on your GPS location or any city worldwide. Features dynamic weather icons, personalized weather messages, and a sleek user interface.

## 📱 Screenshots

*Add screenshots of loading screen, location screen, and city search screen*

## ✨ Features

- **📍 GPS-based Weather**: Automatically fetches weather for your current location
- **🌍 City Search**: Search weather for any city worldwide
- **🎨 Dynamic UI**: Background images that enhance the weather experience
- **🌡️ Real-time Data**: Live weather updates from OpenWeatherMap API
- **😊 Smart Messages**: Context-aware clothing recommendations based on temperature
- **🎯 Weather Icons**: Emoji-based weather condition indicators
- **⚡ Loading Animation**: Smooth loading experience with animated spinner
- **🔄 Quick Refresh**: One-tap location refresh button

## 🌦️ Weather Conditions Supported

- ⛈️ Thunderstorm (< 300)
- 🌧️ Drizzle (300-399)
- ☔ Rain (400-599)
- ☃️ Snow (600-699)
- 🌫️ Atmosphere/Fog (700-799)
- ☀️ Clear Sky (800)
- ☁️ Cloudy (801-804)

## 🧥 Temperature-based Messages

- **Above 25°C**: "It's 🍦 time"
- **20-25°C**: "Time for shorts and 👕"
- **10-20°C**: "Bring a 🧥 just in case"
- **Below 10°C**: "You'll need 🧣 and 🧤"

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: StatefulWidget with setState
- **API**: OpenWeatherMap API
- **Location Services**: Geolocator package
- **HTTP Requests**: HTTP package
- **Loading Animation**: Flutter SpinKit
- **Navigation**: Named and anonymous routes

## 📂 Project Architecture

```
lib/
├── main.dart                    # App entry point
├── screens/
│   ├── loading_screen.dart      # Initial loading screen with spinner
│   ├── location_screen.dart     # Main weather display screen
│   └── city_screen.dart         # City search input screen
├── services/
│   ├── location.dart            # GPS location service
│   ├── networking.dart          # HTTP request handler
│   └── weather.dart             # Weather model & business logic
└── utilities/
    └── constants.dart           # UI constants and text styles
```

## 🔑 Key Components

### Service Layer Architecture

**Location Service** (`location.dart`)
- GPS coordinate retrieval using Geolocator
- Error handling for location permissions
- Low accuracy mode for better performance

**Network Service** (`networking.dart`)
- Reusable HTTP request handler
- JSON parsing and error handling
- Status code validation

**Weather Model** (`weather.dart`)
- Centralized weather API logic
- Location-based and city-based queries
- Weather condition interpretation
- Temperature-based message generation

### Screen Flow

1. **Loading Screen**: Fetches GPS location and weather data
2. **Location Screen**: Displays weather with refresh and search options
3. **City Screen**: Allows manual city input with text field

## 🚀 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd clima
```

2. Install dependencies:
```bash
flutter pub get
```

3. Get your OpenWeatherMap API key:
   - Sign up at [OpenWeatherMap](https://openweathermap.org/api)
   - Replace the API key in `services/weather.dart`:
   ```dart
   const appId = 'YOUR_API_KEY_HERE';
   ```

4. Run the app:
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^latest          # GPS location services
  http: ^latest                # HTTP networking
  flutter_spinkit: ^latest     # Loading animations
```

## 🔐 Permissions Required

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location for weather data.</string>
```

## 💡 Code Highlights

### Async/Await Pattern
```dart
Future<dynamic> getWeatherForLocation() async {
  Location loca = Location();
  await loca.getLocation();
  
  NetworkHelper networkHelper = NetworkHelper(url);
  var weatherData = await networkHelper.getNetworkData();
  
  return weatherData;
}
```

### Data Passing Between Screens
```dart
var typedName = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CityScreen())
);

if(typedName != null) {
  var weatherData = await weather.getCityWeather(typedName);
  updateUI(weatherData);
}
```

### Dynamic UI Updates
```dart
void updateUI(dynamic weatherData) {
  setState(() {
    temp = weatherData['main']['temp'];
    var condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temp.toInt());
  });
}
```

## 🎓 What I Learned

- **Asynchronous Programming**: Working with Futures and async/await
- **API Integration**: Making HTTP requests and parsing JSON responses
- **Location Services**: Implementing GPS functionality with proper permissions
- **Service Layer Pattern**: Separating business logic from UI
- **Error Handling**: Managing network failures and null data gracefully
- **State Lifecycle**: Using initState() for data loading
- **Navigation with Data**: Passing data between screens and handling return values
- **Third-party Packages**: Integrating external libraries (Geolocator, HTTP, SpinKit)

## 🎨 UI Features

- **Custom Backgrounds**: Full-screen images with color filters
- **SafeArea Implementation**: Proper padding for notched devices
- **Custom Text Styles**: Spartan MB font family throughout
- **Responsive Layout**: Flexible spacing and sizing
- **Icon Buttons**: Intuitive navigation controls

## 🐛 Error Handling

- Network request failures
- Invalid city names
- Location permission denials
- Null data checks
- API response validation

## 🔮 Future Enhancements

- [ ] 7-day weather forecast
- [ ] Hourly weather predictions
- [ ] Weather alerts and notifications
- [ ] Multiple location favorites
- [ ] Humidity, wind speed, and pressure data
- [ ] Sunrise/sunset times
- [ ] Weather maps integration
- [ ] Dark/light theme toggle
- [ ] Temperature unit conversion (C°/F°)
- [ ] Offline caching
- [ ] Weather widgets
- [ ] Share weather status

## ⚠️ Important Notes

- Replace the API key with your own before running
- Ensure location permissions are granted for GPS features
- Internet connection required for weather data
- API has rate limits on free tier

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built to demonstrate Flutter's networking capabilities, asynchronous programming, and API integration patterns. Weather data provided by OpenWeatherMap.

---

**Note**: This app requires an active internet connection and location permissions to function properly.
