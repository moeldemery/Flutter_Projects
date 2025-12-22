# Home Care - Medical Services Booking App 🏥🚑

A comprehensive Flutter mobile application for booking home healthcare services including laboratory tests, radiology, nursing care, and medical consultations. Features real-time location tracking, nearest service provider matching, and Firebase authentication.

## 📱 Screenshots

*Add screenshots of home screen, booking flow, map interface, and appointment confirmation*

## ✨ Key Features

### 🔐 Authentication System
- **Email/Password Registration**: Secure user account creation with Firebase
- **Email/Password Login**: Authenticated user access
- **Social Login Ready**: UI prepared for Facebook & Google OAuth
- **Session Management**: Automatic authentication state detection
- **Form Validation**: Real-time input validation with error messages

### 🗺️ Location-Based Services
- **Real-time GPS Tracking**: Automatic user location detection
- **Google Maps Integration**: Interactive map interface
- **Nearest Provider Matching**: Algorithm to find closest service provider
- **Distance Calculation**: Haversine formula for accurate distance measurement
- **Route Visualization**: Polyline routes from user to service provider
- **Multiple Provider Display**: Shows all available providers with custom markers

### 📅 Booking System
- **Service Selection**: Laboratory, Radiology, Nursing, and Other services
- **Visit Type Selection**: 
  - Home Visit (with location tracking)
  - Branch Visit (with appointment slots)
- **Appointment Scheduling**: Date and time slot selection
- **Patient Information**: Name and examination type entry
- **Payment Method**: Cash or Insurance selection
- **Booking Confirmation**: Complete booking workflow

### 🏢 Branch Booking
- **Governorate Selection**: Multi-level location picker
- **Branch Selection**: Nearest branch finder
- **Appointment Slots**: Available time slots display
- **Date Selection**: Calendar-based date picker
- **Slot Confirmation**: Radio button selection for time slots

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Authentication**: Firebase Auth
- **Database**: Firebase Firestore (ready)
- **Maps**: Google Maps Flutter
- **Location**: Geolocator
- **State Management**: Provider pattern
- **HTTP Requests**: HTTP package
- **UI Components**: Material Design + Font Awesome Icons
- **Loading Indicators**: Flutter SpinKit

## 📂 Project Architecture

```
lib/
├── main.dart                          # App entry & routing
├── assets/
│   ├── constants.dart                 # UI constants & styling
│   └── globals.dart                   # Global variables
├── models/
│   └── user.dart                      # User data model
├── services/
│   ├── auth.dart                      # Firebase authentication service
│   └── location.dart                  # GPS location service
└── screens/
    ├── home_page.dart                 # Landing page with auth options
    ├── login_page.dart                # Login form
    ├── register.dart                  # Registration form
    ├── wrapper.dart                   # Authentication wrapper
    ├── loading.dart                   # Loading indicator
    ├── main_menu_page.dart            # Dashboard after login
    ├── booking_menu_page.dart         # Service type selection
    ├── booking_selection_page.dart    # Visit type selection
    ├── booking_home_visit.dart        # Map-based home visit booking
    ├── booking_branch.dart            # Branch visit appointment
    └── booking_info.dart              # Patient & payment information
```

## 🔑 Core Features Breakdown

### Authentication Flow
```
Home Page → Login/Register → Main Menu Dashboard
     ↓
Social Login (Ready for implementation)
```

### Booking Flow
```
Main Menu → Booking Menu → Service Type Selection
     ↓
Visit Type (Home/Branch)
     ↓
Location/Appointment → Patient Info → Confirmation
```

### Location Algorithm
```dart
// Distance calculation using Haversine formula
double calculateDistance(LatLng destination) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat1 - lat2) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) *
          (1 - c((lon1 - lon2) * p)) / 2;
  return 12742 * asin(sqrt(a)); // Distance in km
}
```

### Route Drawing
- Google Directions API integration
- Polyline decoding algorithm
- Multiple route visualization
- Real-time route updates

## 🚀 Installation

### Prerequisites
- Flutter SDK 2.0+
- Firebase account
- Google Maps API key
- Android Studio / Xcode

### Firebase Setup

1. **Create Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create new project
   - Add Android/iOS apps

2. **Download Configuration Files**:
   - Android: `google-services.json` → `android/app/`
   - iOS: `GoogleService-Info.plist` → `ios/Runner/`

3. **Enable Authentication**:
   - Enable Email/Password in Firebase Auth
   - (Optional) Enable Facebook & Google sign-in

### Google Maps Setup

1. **Get API Key**:
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create project and enable Maps SDK
   - Create API key

2. **Configure Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<manifest>
  <application>
    <meta-data
      android:name="com.google.android.geo.API_KEY"
      android:value="YOUR_API_KEY_HERE"/>
  </application>
</manifest>
```

3. **Configure iOS** (`ios/Runner/AppDelegate.swift`):
```swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

### App Setup

1. Clone the repository:
```bash
git clone <your-repo-url>
cd home_care
```

2. Install dependencies:
```bash
flutter pub get
```

3. Add assets to `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
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
  
  # Firebase
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest          # Ready for implementation
  
  # Maps & Location
  google_maps_flutter: ^latest
  geolocator: ^latest
  
  # State Management
  provider: ^latest
  
  # UI Components
  font_awesome_flutter: ^latest
  flutter_spinkit: ^latest
  
  # Networking
  http: ^latest
```

## 🔐 Permissions Required

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access to find nearest healthcare providers.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs location access to track service providers.</string>
```

## 💡 Key Technical Implementations

### Firebase Authentication Service
```dart
class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Sign in with email & password
  Future signInEmailPw(String email, String pw) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
      email: email, 
      password: pw
    );
    return _userFormFirebaseUser(result.user);
  }
  
  // Register new user
  Future registerEmailPw(String email, String pw) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: pw
    );
    return _userFormFirebaseUser(result.user);
  }
}
```

### Provider Pattern for State
```dart
StreamProvider<User>.value(
  value: AuthServices().user,
  child: Wrapper(),
)
```

### Nearest Provider Algorithm
1. Calculate distance to all providers
2. Find minimum distance
3. Get route from Google Directions API
4. Decode polyline and display route
5. Show nearest provider with visual indicator

### Route Decoding
```dart
// Decode Google's encoded polyline format
List _decodePoly(String poly) {
  var list = poly.codeUnits;
  var result = <double>[];
  // Algorithm to decode encoded coordinates
  return result;
}

// Convert to LatLng objects
List<LatLng> _convertToLatLng(List points) {
  List<LatLng> result = [];
  for (int i = 0; i < points.length; i += 2) {
    result.add(LatLng(points[i], points[i + 1]));
  }
  return result;
}
```

## 🎨 Design Features

### Color Scheme
- **Primary Blue**: `#0D47A1` (Material Blue 900)
- **Secondary Blue**: `#1976D2` (Material Blue 700)
- **Accent Red**: `#C62828` (Material Red 800)
- **Background**: Custom medical-themed images
- **Text**: White on colored backgrounds

### UI Components
- **Icon Grid Dashboard**: 2x3 grid with Font Awesome icons
- **Custom Buttons**: Rounded corners with icons and text
- **Form Fields**: White filled text fields with icon prefixes
- **Loading States**: Animated spinners for async operations
- **Data Tables**: Appointment slots with radio button selection

### Navigation Pattern
- **Named Routes**: Clean, hierarchical routing structure
- **Modal Navigation**: Stack-based screen flow
- **Back Navigation**: Proper navigation stack management
- **Pop Until**: Direct navigation to specific routes

## 🎯 Booking Workflow Details

### Service Types
1. **Laboratory** - Blood tests, urine tests, etc.
2. **Radiology** - X-rays, CT scans, ultrasounds
3. **Nursing** - Home nursing care and monitoring
4. **Others** - Consultation and other services

### Examination Types (Example)
- CPR Test
- Corona Test
- Blood Cell Count
- Blood Test
- *Expandable list*

### Payment Methods
- **Cash**: Pay on service delivery
- **Insurance**: Insurance claim processing

## 🔮 Future Enhancements

- [ ] Real-time provider tracking
- [ ] In-app chat with providers
- [ ] Push notifications for appointments
- [ ] Booking history and management
- [ ] Provider ratings and reviews
- [ ] Multiple appointment management
- [ ] Payment gateway integration
- [ ] Insurance verification system
- [ ] Medical reports upload/download
- [ ] Prescription management
- [ ] Emergency booking feature
- [ ] Multilingual support (Arabic/English)
- [ ] Voice call integration
- [ ] Video consultation
- [ ] Analytics dashboard

## 🐛 Current Limitations

- Social login UI present but not implemented
- Booking confirmation doesn't save to database yet
- Provider markers are static (demo data)
- No real-time provider location updates
- Branch appointment slots are hardcoded
- No booking cancellation feature
- Payment processing not integrated

## 📊 User Flow Diagrams

### Authentication Flow
```
Landing → Login/Register → Main Menu
                ↓
        Firebase Auth Verification
```

### Home Visit Flow
```
Service Selection → Home Visit → Map Interface
        ↓
Find Nearest Provider → Select Location → Patient Info → Book
```

### Branch Visit Flow
```
Service Selection → Branch Visit → Select Governorate
        ↓
Select Branch → Choose Slot → Patient Info → Book
```

## 🎓 What This Project Demonstrates

- **Firebase Integration**: Full authentication implementation
- **Google Maps API**: Advanced mapping features
- **Complex Algorithms**: Distance calculation and routing
- **State Management**: Provider pattern usage
- **Form Validation**: Comprehensive input validation
- **Navigation**: Multi-level routing architecture
- **Async Programming**: Future/async/await patterns
- **API Integration**: HTTP requests and JSON parsing
- **Location Services**: GPS and geolocation handling
- **UI/UX Design**: Healthcare-specific user flows

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built as a comprehensive healthcare booking solution demonstrating full-stack mobile development capabilities with Firebase backend, Google Maps integration, and complex location-based algorithms.

---

**⚠️ Note**: This is a demonstration app. For production use, ensure compliance with healthcare regulations (HIPAA, GDPR, etc.) and implement proper data encryption and security measures.
