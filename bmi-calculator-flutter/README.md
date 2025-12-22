# BMI Calculator 💪

A sleek, modern Flutter application for calculating Body Mass Index (BMI) with an intuitive user interface and instant health feedback. Built with custom UI components and a clean architecture separating business logic from presentation.

## 📱 Screenshots

*Add screenshots here showing the input screen and results page*

## ✨ Features

- **Interactive Gender Selection**: Tap-to-select gender cards with visual feedback
- **Smooth Height Slider**: Customized slider for precise height input (100-200 cm)
- **Weight & Age Controls**: Increment/decrement buttons with circular design
- **Real-time BMI Calculation**: Instant calculation using the standard BMI formula
- **Health Category Classification**: Automatic categorization (Underweight, Normal, Overweight)
- **Personalized Feedback**: Health recommendations based on BMI results
- **Beautiful Dark Theme**: Custom color scheme with pink accents
- **Smooth Navigation**: Seamless transition between input and results screens

## 🎯 How It Works

1. Select your gender (Male/Female)
2. Adjust your height using the slider
3. Set your weight and age using +/- buttons
4. Tap "Calculate" to see your results
5. View your BMI score, category, and health recommendations
6. Tap "Re-Calculate" to start over

## 🧮 BMI Formula

```
BMI = weight (kg) / (height (m))²
```

### Health Categories
- **Underweight**: BMI < 18.5
- **Normal**: BMI 18.5 - 24.9
- **Overweight**: BMI ≥ 25

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: MVC-inspired with separate business logic layer
- **State Management**: StatefulWidget with setState
- **Navigation**: Navigator with MaterialPageRoute
- **UI Components**: Custom reusable widgets
- **Icons**: Font Awesome Flutter

## 📂 Project Structure

```
lib/
├── main.dart                      # App entry point & theme configuration
├── calculator_brain.dart          # BMI calculation logic & business rules
├── components/
│   ├── background_card.dart       # Reusable card container widget
│   ├── gender_card.dart           # Gender selection card component
│   └── constants.dart             # App-wide constants (colors, text styles)
└── screens/
    ├── input_page.dart            # Main input screen with controls
    └── result_page.dart           # Results display screen
```

## 🎨 Design Highlights

### Custom Components
- **ReusableCardBackground**: Flexible container with gesture detection
- **GenderCard**: Icon + label combination for gender selection
- **CircleIconButton**: Custom circular buttons for increment/decrement

### Color Palette
- Primary Background: `#0A0E21`
- Active Card: `#1D1E33`
- Inactive Card: `#111328`
- Accent Color: `#EB1555`
- Text Color: `#8D8E98`

### Custom Styling
- Themed sliders with custom thumb and overlay shapes
- Rounded corners on all cards
- Consistent spacing and padding
- Custom font (Pacifico) for button text

## 🧠 Key Learning Concepts

This project demonstrates:

- **Separation of Concerns**: Business logic isolated in `CalculatorBrain` class
- **Widget Composition**: Building complex UIs from small, reusable widgets
- **State Management**: Managing user input and UI updates efficiently
- **Navigation & Routing**: Passing data between screens
- **Custom Widgets**: Creating reusable component library
- **Theme Consistency**: Centralized constants for maintainable styling
- **Gesture Detection**: Interactive UI elements with tap handlers
- **Responsive Layout**: Using Expanded and Flexible widgets

## 🚀 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd bmi_calculator
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  font_awesome_flutter: ^latest
```

## 💡 Code Highlights

### Calculator Brain Logic
```dart
class CalculatorBrain {
  final int weight;
  final int height;
  
  String calculateBMI() {
    double bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }
}
```

### Interactive Gender Selection
Uses enum-based state management with ternary operators for clean, concise code:
```dart
maleCardColor = (gender == GenderType.male) 
    ? kCardActiveColor 
    : kCardInactiveColor;
```

## 🎓 What I Learned

- Implementing business logic separation for better code maintainability
- Creating custom reusable widgets to reduce code duplication
- Using enums for type-safe state management
- Building intuitive UIs with proper visual feedback
- Implementing navigation with data passing between screens
- Theming and styling Flutter applications consistently
- Working with gestures and user interactions

## 🔮 Future Enhancements

- [ ] Add metric/imperial unit toggle
- [ ] Save calculation history locally
- [ ] Add BMI trend tracking over time
- [ ] Include additional health metrics (BMR, body fat %)
- [ ] Add animations for screen transitions
- [ ] Support for landscape orientation
- [ ] Add accessibility features (screen reader support)
- [ ] Multi-language support

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built as part of my Flutter development journey, focusing on clean architecture and reusable component design.

---

**Note**: This is a health tool for educational purposes. Always consult healthcare professionals for medical advice.
