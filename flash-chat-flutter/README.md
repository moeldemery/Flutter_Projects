# Flash Chat ⚡

A modern, real-time messaging application built with Flutter. Flash Chat provides a sleek interface for user authentication and messaging with a beautiful Material Design UI.

## 📱 Screenshots

*Add screenshots of welcome screen, login, registration, and chat interface*

## ✨ Features

- **🔐 User Authentication**: Secure login and registration system
- **💬 Real-time Messaging**: Instant message delivery and updates
- **🎨 Modern UI**: Clean Material Design with custom styling
- **📱 Responsive Layout**: Works seamlessly across different screen sizes
- **🔄 Named Routes**: Clean navigation structure throughout the app
- **⚡ Fast Performance**: Optimized for smooth user experience
- **🌙 Dark Theme**: Eye-friendly dark mode interface

## 🎯 User Flow

1. **Welcome Screen**: Choose to login or register
2. **Authentication**: Enter email and password
3. **Chat Screen**: Send and receive messages in real-time
4. **Logout**: Sign out with a single tap

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **UI Pattern**: Material Design
- **State Management**: StatefulWidget
- **Navigation**: Named Routes
- **Backend Ready**: Structured for Firebase integration

## 📂 Project Structure

```
lib/
├── main.dart                       # App entry point & routing
├── constants.dart                  # UI constants & styling
└── screens/
    ├── welcome_screen.dart         # Landing page with auth options
    ├── login_screen.dart           # User login interface
    ├── registration_screen.dart    # New user registration
    └── chat_screen.dart            # Main messaging interface
```

## 🎨 Design Features

### Color Scheme
- **Primary**: Light Blue Accent (`Colors.lightBlueAccent`)
- **Secondary**: Blue Accent (`Colors.blueAccent`)
- **Background**: White for auth screens, Dark theme for chat
- **Contrast**: High contrast for readability

### UI Components
- **Rounded Text Fields**: 32px border radius for modern look
- **Elevated Buttons**: Material elevation for depth
- **Custom Borders**: Focus states with color transitions
- **SafeArea Implementation**: Proper padding for notched devices

### Typography
- **Welcome Title**: 45px, Extra Bold (w900)
- **Button Text**: Default Material style
- **Send Button**: 18px, Bold with custom color

## 🔑 Key Components

### Named Routes Pattern
```dart
static String id = 'screen_name';

// Navigation
Navigator.pushNamed(context, ScreenName.id);
```

### Custom Input Decoration
```dart
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
```

### Consistent Styling
All UI constants are centralized in `constants.dart` for easy theme management.

## 🚀 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd flash_chat
```

2. Install dependencies:
```bash
flutter pub get
```

3. Add logo image:
   - Place `logo.png` in `images/` folder
   - Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - images/logo.png
```

4. Run the app:
```bash
flutter run
```

## 📦 Current Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
```

## 🔮 Ready for Backend Integration

The app structure is designed for easy Firebase integration:

### Recommended Setup:
```yaml
dependencies:
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
```

### Integration Points:
- **Login Screen**: Add Firebase Auth sign-in
- **Registration Screen**: Add Firebase Auth user creation
- **Chat Screen**: Add Firestore message stream
- **Logout**: Add Firebase Auth sign-out

## 💡 Code Highlights

### Named Routes Architecture
```dart
initialRoute: WelcomeScreen.id,
routes: {
  WelcomeScreen.id: (context) => WelcomeScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  ChatScreen.id: (context) => ChatScreen(),
}
```

### Reusable Input Fields
```dart
TextField(
  decoration: InputDecoration(
    hintText: 'Enter your email',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  ),
)
```

### Clean Screen Structure
```dart
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
```

## 🎓 What I Learned

- **Navigation Patterns**: Implementing named routes for cleaner code
- **UI Consistency**: Using constants for maintainable styling
- **State Management**: Organizing stateful widgets effectively
- **Material Design**: Creating polished UIs with elevation and shadows
- **Input Handling**: Managing text fields and user input
- **Screen Flow**: Building logical user journeys
- **Code Organization**: Separating concerns across multiple files
- **Reusable Components**: Creating consistent UI elements

## 🎨 Screen Details

### Welcome Screen
- App logo with title
- Two prominent action buttons (Login/Register)
- Clean, centered layout
- Instant navigation to auth screens

### Login & Registration Screens
- Email and password input fields
- Custom rounded borders with focus states
- Elevated action buttons
- Consistent padding and spacing
- Form validation ready

### Chat Screen
- Message input field at bottom
- Send button with custom styling
- Logout icon in app bar
- Ready for message display area
- SafeArea for proper device compatibility

## 🔐 Security Considerations

Current implementation is UI-focused. For production:
- [ ] Add input validation
- [ ] Implement password security (hiding, strength check)
- [ ] Add email format validation
- [ ] Implement secure authentication (Firebase Auth)
- [ ] Add error handling
- [ ] Implement loading states
- [ ] Add network connectivity checks

## 🔮 Future Enhancements

- [ ] Firebase Authentication integration
- [ ] Cloud Firestore for message storage
- [ ] Real-time message streaming
- [ ] User profile pictures
- [ ] Message timestamps
- [ ] Read receipts
- [ ] Typing indicators
- [ ] Image/file sharing
- [ ] Push notifications
- [ ] Group chat functionality
- [ ] Message search
- [ ] User presence (online/offline)
- [ ] Message reactions/emojis
- [ ] Dark/light theme toggle
- [ ] Custom user themes

## 📱 UI Best Practices Demonstrated

- **Consistent Spacing**: Using SizedBox for uniform gaps
- **Responsive Design**: Stretched buttons with minWidth
- **Visual Hierarchy**: Clear distinction between primary and secondary actions
- **Touch Targets**: Adequate button sizes (42px height minimum)
- **Focus States**: Different border styles for input states
- **Material Elevation**: Depth perception through shadows

## 🎯 Project Goals Achieved

✅ Clean navigation structure with named routes  
✅ Consistent UI styling across all screens  
✅ Reusable constants for maintainability  
✅ Material Design principles  
✅ Scalable architecture for backend integration  
✅ Professional authentication flow  
✅ Ready for real-time messaging implementation  

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built to demonstrate Flutter's navigation, state management, and UI design capabilities. The clean architecture makes it easy to extend with Firebase for a fully functional chat application.

---

**Note**: This is the UI foundation for a messaging app. Backend integration (Firebase Auth & Firestore) is required for full functionality.
