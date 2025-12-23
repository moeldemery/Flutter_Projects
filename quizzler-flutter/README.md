# Quizzler ❓

A simple Flutter quiz app built as part of a Flutter learning project. This project demonstrates basic Flutter UI, stateful widgets, simple object-oriented design with Dart classes, and minimal app logic for a quiz experience.

---

## Table of Contents

- [Demo](#demo)
- [What you will create](#what-you-will-create)
- [Features](#features)
- [What you will learn](#what-you-will-learn)
- [Prerequisites](#prerequisites)
- [Getting Started / Installation](#getting-started--installation)
- [Project structure](#project-structure)
- [How it works (high level)](#how-it-works-high-level)
- [Code snippet](#code-snippet)
- [Customizing the quiz](#customizing-the-quiz)
- [Contributing](#contributing)
- [Credits & License](#credits--license)

---

## Demo

We’re going to make a quiz app that tests your general knowledge. As one of the most popular types of apps on the app stores, you can create your own quiz for other people to enjoy!

![Finished App](https://github.com/londonappbrewery/Images/blob/master/quizzler-demo.gif)

---

## What you will create

A lightweight quiz application that presents questions one at a time, accepts True/False answers, keeps score (visual feedback), and can be extended with more questions or different UI flows.

---

## Features

- Simple single-question-per-screen flow
- True/False answers
- Visual score feedback (icons)
- Modular code with a Question class and a QuizBrain (or similar) manager
- Easy to extend with more questions or new question types

---

## What you will learn

- Modularising your code into separate classes
- Dart classes and objects
- Using class constructors
- Extracting Widgets to refactor your code
- Private and public modifiers in Dart
- How to use Dart lists
- The difference between `var`, `const` and `final`

---

## Prerequisites

- Flutter SDK installed (see https://flutter.dev for install instructions)
- A device or emulator configured (Android Studio, VS Code, or other editor)

---

## Getting Started / Installation

1. Clone the repository (or add this project to your own workspace):
   - git clone https://github.com/moeldemery/Flutter_Projects.git
   - cd Flutter_Projects/quizzler-flutter

2. Get dependencies:
   - flutter pub get

3. Run the app:
   - flutter run

4. To run on a specific device:
   - flutter devices
   - flutter run -d <deviceId>

---

## Project structure (typical)

- lib/
  - main.dart              -> App entrypoint, MaterialApp + top widget
  - quiz_page.dart         -> Main Quiz screen (stateful)
  - question.dart          -> Question class (model)
  - quiz_brain.dart        -> Quiz manager (question list + index/logic)
  - widgets/               -> Extracted widgets (buttons, scorekeeper, etc.)
- assets/                  -> (optional) images/sounds if you add any
- pubspec.yaml             -> Flutter configuration + dependencies

---

## How it works (high level)

- Questions are represented by a `Question` class that stores the question text and the correct answer (true/false).
- A `QuizBrain` (or similar) class holds a list of `Question` objects and provides methods to get the current question, advance to the next question, and check whether the quiz is finished.
- The UI (a StatefulWidget) displays the current question, two answer buttons (True / False), updates the score/feedback icons, and advances the question index when the user answers.
- You can extract parts of the UI (buttons, score indicators) into smaller widgets for reusability and clarity.

---

## Code snippet for project

This is an example of the question list used by the app (kept from the original README):

```dart
Question('Some cats are actually allergic to humans', true),
Question('You can lead a cow down stairs but not up stairs.', false),
Question('Approximately one quarter of human bones are in the feet.', true),
Question('A slug\'s blood is green.', true),
Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
Question('It is illegal to pee in the Ocean in Portugal.', true),
Question(
    'No piece of square dry paper can be folded in half more than 7 times.',
    false),
Question(
    'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    true),
Question(
    'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    false),
Question(
    'The total surface area of two human lungs is approximately 70 square metres.',
    true),
Question('Google was originally called "Backrub".', true),
Question(
    'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    true),
Question(
    'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
    true),
```

---

## Customizing the quiz

- Add or remove questions in `quiz_brain.dart` (or wherever your question list is stored).
- Create new question types (multiple choice) by expanding the `Question` model.
- Replace the demo image or add assets by updating `pubspec.yaml` and adding files to `assets/`.

---

## Contributing

Contributions are welcome. Simple ways to contribute:
- Improve documentation (this README!)
- Add more questions or question types
- Add tests or CI
- Improve UI/UX or accessibility

If you'd like me to commit this README update or open a PR with additional changes (e.g., reorganize code, add example screenshots from your device), tell me and I will create the change.

---
