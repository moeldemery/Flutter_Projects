# Dicee 🎲

A fun and interactive dice rolling app built with Flutter. Tap the dice to roll and get random results - perfect for board games, decision making, or just having fun!

## 📱 Screenshots

*Add screenshots of the app with different dice combinations*

## ✨ Features

- **🎲 Dual Dice Rolling**: Two dice that roll independently
- **👆 Interactive Tap**: Tap either die to roll both simultaneously
- **🎨 Visual Feedback**: Dice images update instantly with smooth transitions
- **🎯 Random Generation**: True random number generation (1-6)
- **🔴 Clean UI**: Minimalist red-themed design
- **⚡ Instant Response**: Real-time state updates with no lag

## 🎮 How to Play

1. Tap on either the left or right dice
2. Watch both dice roll to random numbers
3. Each tap generates new random values between 1 and 6
4. Use for games, decision making, or just for fun!

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: StatefulWidget with setState
- **Random Generation**: Dart's Random class
- **UI Components**: Material Design widgets

## 📂 Project Structure

```
lib/
└── main.dart                 # Complete app in single file

assets/
└── images/
    ├── dice1.png            # Dice face showing 1
    ├── dice2.png            # Dice face showing 2
    ├── dice3.png            # Dice face showing 3
    ├── dice4.png            # Dice face showing 4
    ├── dice5.png            # Dice face showing 5
    └── dice6.png            # Dice face showing 6
```

## 🎨 Design Features

### Color Scheme
- **Background**: Red (`Colors.red`)
- **AppBar**: Dark Red (`Colors.red[900]`)
- **Theme**: Minimalist monochromatic design

### Layout
- Center-aligned content
- Responsive design with Expanded widgets
- Equal spacing for both dice (1:1 flex ratio)
- Full-width interactive areas

## 💡 Code Highlights

### Random Number Generation
```dart
void diceRand() {
  setState(() {
    rightDiceValue = Random().nextInt(6) + 1;
    leftDiceValue = Random().nextInt(6) + 1;
  });
}
```
- `Random().nextInt(6)` generates 0-5
- Adding 1 gives us the dice range: 1-6

### Dynamic Image Loading
```dart
Image.asset('images/dice$leftDiceValue.png')
```
- String interpolation to load correct dice image
- Updates automatically when state changes

### State Management
```dart
class _DicePage2State extends State<DicePage2> {
  int leftDiceValue = 1;
  int rightDiceValue = 1;
  // setState() triggers UI rebuild
}
```

## 🚀 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd dicee
```

2. Ensure you have dice images in `images/` folder:
   - dice1.png through dice6.png
   - Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - images/
```

3. Install dependencies:
```bash
flutter pub get
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
```
No external packages required - uses only Flutter's built-in features!

## 🎓 What I Learned

- **State Management Basics**: Using setState() to update UI
- **Random Number Generation**: Working with Dart's Random class
- **Dynamic Assets**: Loading images dynamically with string interpolation
- **Responsive Layout**: Using Expanded widgets for flexible sizing
- **Event Handling**: Implementing onPressed callbacks
- **Stateful Widgets**: Understanding the StatefulWidget lifecycle
- **Material Design**: Building UI with Material components

## 🎯 Key Concepts Demonstrated

### 1. **Stateful Widget Lifecycle**
- Initial state with default values (both dice = 1)
- State updates trigger widget rebuilds
- Efficient re-rendering of only changed widgets

### 2. **Responsive Design**
- Expanded widgets ensure equal space distribution
- Works across different screen sizes
- Touch targets are appropriately sized

### 3. **Interactive Elements**
- FlatButton for tap detection
- Visual feedback through image changes
- Both dice respond to tapping either one

### 4. **Asset Management**
- Organized asset structure
- Efficient image loading
- Dynamic resource selection

## 🎲 Dice Probability

Each roll is completely random with equal probability:
- Chance of any specific number: **1/6 (≈16.67%)**
- Chance of doubles: **1/6 (≈16.67%)**
- Possible combinations: **36 unique outcomes**

## 🔮 Future Enhancements

- [ ] Add dice roll animation
- [ ] Sound effects for rolling
- [ ] Roll history tracker
- [ ] Sum display of both dice
- [ ] Multiple dice support (3, 4, or more dice)
- [ ] Different dice types (D4, D8, D12, D20)
- [ ] Shake-to-roll functionality
- [ ] Custom dice themes/skins
- [ ] Statistics tracking (most common rolls)
- [ ] Haptic feedback on roll
- [ ] Portrait/landscape orientation support

## 🎮 Use Cases

- 🎲 **Board Games**: Replace physical dice for any game
- 🤔 **Decision Making**: Let chance decide between options
- 🎯 **Probability Teaching**: Demonstrate random distributions
- 🎪 **Party Games**: Quick random number generation
- 📊 **Statistics Demo**: Show random number distribution

## 📱 UI Components Used

- **Scaffold**: App structure
- **AppBar**: Title bar with app name
- **Center**: Centers content vertically and horizontally
- **Column**: Vertical arrangement
- **Row**: Horizontal dice placement
- **Expanded**: Flexible space distribution
- **FlatButton**: Interactive dice buttons
- **Image.asset**: Displays dice images

## 🎨 Widget Tree Structure

```
MaterialApp
└── Scaffold
    ├── AppBar
    └── Body (DicePage2)
        └── Center
            └── Column
                └── Row
                    ├── Expanded (Left Dice)
                    │   └── FlatButton
                    │       └── Image
                    └── Expanded (Right Dice)
                        └── FlatButton
                            └── Image
```

## 🐛 Common Issues & Solutions

**Issue**: Images not loading
- **Solution**: Ensure images are in `images/` folder and declared in `pubspec.yaml`

**Issue**: Same numbers appearing frequently
- **Solution**: This is expected with random generation - true randomness includes patterns

**Issue**: Dice not updating
- **Solution**: Make sure `setState()` is called to trigger UI rebuild

## 💻 Performance Notes

- Lightweight app with minimal memory usage
- Instant response time (no network calls)
- Efficient state management with minimal rebuilds
- Works smoothly on all devices

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

A simple yet effective demonstration of Flutter's stateful widget capabilities and random number generation. Perfect beginner project showcasing core Flutter concepts!

---

**Note**: This is a beginner-friendly project ideal for learning Flutter basics including state management, user interaction, and dynamic UI updates.
