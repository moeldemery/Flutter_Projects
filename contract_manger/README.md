# Contract Manager 📝

A comprehensive Flutter application for tracking and managing contracts with intelligent notification reminders. Never miss an important contract deadline again with automated alerts and an intuitive management interface.

## 📱 Screenshots

*Add screenshots of home screen, add contract screen, and notifications*

## ✨ Key Features

- **📋 Contract Tracking**: Store and manage multiple contracts with detailed information
- **⏰ Smart Notifications**: Scheduled reminders before contract expiration
- **📅 Date Management**: Track contract start and end dates with visual countdown
- **⚡ Quick Actions**: Swipe-to-delete with confirmation dialog
- **💾 Persistent Storage**: Local data storage using SharedPreferences
- **🎨 Visual Time Indicators**: Dynamic display showing days or hours remaining
- **✅ Form Validation**: Real-time input validation for required fields
- **🔔 Custom Alerts**: Beautiful Flushbar notifications for user feedback
- **🌐 Timezone Support**: Accurate scheduling across different timezones
- **📱 Bottom Navigation**: Easy access to home, add, and exit functions

## 🎯 How It Works

1. **Add a Contract**: Enter contract title, organization name, dates, and notification time
2. **View Dashboard**: All contracts displayed as cards with time remaining
3. **Get Notified**: Receive automatic reminders at your scheduled time
4. **Delete Contracts**: Swipe left on any contract with confirmation prompt
5. **About Info**: Access app information through the drawer menu

## ⏱️ Time Display Logic

- **More than 3 days remaining**: Shows days countdown
- **Less than 3 days remaining**: Shows hours countdown for urgency

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Local Storage**: SharedPreferences (JSON encoding)
- **Notifications**: Flutter Local Notifications Plugin
- **Timezone Handling**: Timezone package
- **UI Alerts**: RFlutter Alert & Flushbar
- **State Management**: StatefulWidget with setState
- **Navigation**: Named routes

## 📂 Project Architecture

```
lib/
├── main.dart                              # App entry & initialization
├── assets/
│   ├── constants.dart                     # UI constants & text styles
│   └── globals.dart                       # Global variables & utilities
├── screens/
│   ├── home_screen.dart                   # Main dashboard with contract list
│   └── add_contract_screen.dart           # Form for adding new contracts
├── components/
│   ├── add_card_to_list.dart             # Card widget builder
│   ├── select_date.dart                   # Date & time picker handlers
│   ├── submit_button.dart                 # Form submission logic
│   └── show_notification.dart             # Notification configuration
└── subScreen/
    ├── about_us.dart                      # About app dialog
    └── delete_confirmation_screen.dart    # Delete confirmation dialog
```

## 🎨 Design Features

### Custom Card Design
- Shadow effects with blur radius
- Rounded corners (30px border radius)
- Color-coded time indicators (red background for urgency)
- Responsive layout with flexible columns

### Color Palette
- Card Color: `#455A64`
- Text Color: `#111328`
- Sub Text: `#454746`
- Time Left Background: `#e30505` (Alert red)
- Primary Theme: Green shades

### Typography
- Title: 28px, Bold (w700)
- Subtitle: 18px, Light (w100)
- Time Numbers: 45px, Extra Bold (w700)
- Labels: 18-22px range

## 🔔 Notification System

### Features
- **Scheduled Notifications**: Set exact date and time for reminders
- **Custom Sound**: Uses custom notification sound ('slow_spring_board')
- **Platform Support**: Works on Android, iOS, and macOS
- **Timezone Aware**: Accurate scheduling across different timezones
- **Priority Levels**: Maximum importance for critical reminders

### Implementation
```dart
// Notifications are scheduled to the exact contract end time
tz.TZDateTime scheduledDate = tz.TZDateTime.from(endingDate, tz.local);
```

## 💾 Data Persistence

### Storage Strategy
- Uses SharedPreferences for local storage
- JSON encoding for complex data structures
- List-based storage for multiple contracts
- Automatic save on contract addition
- Load on app startup

### Data Structure
```dart
{
  "contractName": "Service Agreement",
  "organisationName": "Company XYZ",
  "startingDate": "2024-01-01T00:00:00.000",
  "endingDate": "2024-12-31T09:00:00.000"
}
```

## 🚀 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd contract_manager
```

2. Install dependencies:
```bash
flutter pub get
```

3. Add notification sound (optional):
   - Place your custom sound file in `android/app/src/main/res/raw/`
   - For iOS, add to `ios/Runner/` directory

4. Run the app:
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^latest      # Local data storage
  flutter_local_notifications: ^latest  # Push notifications
  timezone: ^latest                # Timezone handling
  rflutter_alert: ^latest         # Alert dialogs
  flushbar: ^latest               # Toast-style notifications
```

## 🔐 Permissions Required

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```

## 💡 Code Highlights

### JSON Encoding for Storage
```dart
var cardData = {
  "contractName": contractTitleController.text,
  "organisationName": organisationNameController.text,
  "startingDate": startingDate.toIso8601String(),
  "endingDate": endingDate.toIso8601String()
};
String encodedCardData = jsonEncode(cardData);
```

### Swipe to Delete with Confirmation
```dart
Dismissible(
  direction: DismissDirection.endToStart,
  confirmDismiss: (direction) async {
    return await showDeleteConfirm(context);
  },
  onDismissed: (direction) {
    setState(() => _deleteCard(index));
  },
  child: contractList[index],
)
```

### Real-time Form Validation
```dart
TextFormField(
  autovalidate: _validateContractName,
  validator: (val) {
    if (val.isEmpty) {
      return 'Contract name cannot be empty.';
    } else {
      isContactNameEmpty = false;
      return null;
    }
  },
)
```

### Dynamic Time Display Logic
```dart
(endingDate.difference(todayDate) > Duration(days: 3))
  ? Text('Days Left: ${endingDate.difference(todayDate).inDays}')
  : Text('Hours Left: ${endingDate.difference(todayDate).inHours}')
```

## 🎓 What I Learned

- **Local Data Persistence**: Implementing SharedPreferences with JSON serialization
- **Scheduled Notifications**: Working with timezone-aware notification scheduling
- **Form Validation**: Real-time input validation with error messages
- **Complex State Management**: Managing global state across multiple screens
- **ListView Operations**: Dynamic list building with dismissible items
- **User Experience**: Confirmation dialogs and feedback mechanisms
- **Date/Time Handling**: Date pickers, time pickers, and timezone conversions
- **Navigation Patterns**: Named routes and callback-based screen updates
- **Custom Widgets**: Building reusable card components
- **Package Integration**: Working with multiple third-party packages

## 🎨 UI/UX Features

- **Swipe Gestures**: Intuitive left swipe to delete
- **Visual Feedback**: Color-coded time indicators (red for urgency)
- **Loading States**: Smooth transitions between screens
- **Error Prevention**: Validation prevents invalid date ranges
- **Confirmation Dialogs**: Prevents accidental deletions
- **Success Notifications**: Clear feedback for user actions
- **Empty State Handling**: Graceful handling of no contracts
- **Responsive Layout**: Works across different screen sizes

## 🐛 Validation & Error Handling

- Contract name validation (required field)
- Organization name validation (required field)
- Date range validation (end date must be after start date)
- Null safety checks for stored data
- JSON parsing error handling
- Notification scheduling error handling

## 🔮 Future Enhancements

- [ ] Multiple notification reminders per contract
- [ ] Contract categories/tags
- [ ] Search and filter functionality
- [ ] Export contracts to PDF
- [ ] Cloud sync with Firebase
- [ ] Contract renewal tracking
- [ ] Statistics dashboard
- [ ] Dark mode theme
- [ ] Attachment support (PDFs, images)
- [ ] Calendar integration
- [ ] Recurring contracts support
- [ ] Email notifications
- [ ] Biometric authentication
- [ ] Multi-language support

## ⚠️ Important Notes

- Ensure notification permissions are granted for alerts to work
- App uses local storage only - data is not backed up automatically
- Timezone package must be initialized before scheduling notifications
- Custom notification sounds require proper asset configuration

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built to demonstrate Flutter's capabilities in local data persistence, notification scheduling, and complex form handling. Perfect for managing business contracts, subscriptions, and time-sensitive agreements.

---

**Note**: This app stores data locally on your device. Regular backups are recommended for important contract information.
