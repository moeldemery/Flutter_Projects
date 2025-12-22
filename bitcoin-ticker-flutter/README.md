# Bitcoin Ticker 💰

A Flutter application for tracking cryptocurrency prices across multiple fiat currencies. This project demonstrates cross-platform UI design using both Material and Cupertino widgets for Android and iOS platforms.

## Overview

Bitcoin Ticker is a mobile app that allows users to monitor real-time cryptocurrency prices (Bitcoin, Ethereum, Litecoin) in their preferred currency. The app showcases Flutter's ability to provide platform-specific UI experiences while maintaining a single codebase.

## Features

- **Multi-Currency Support**: Track crypto prices in 21 different fiat currencies including USD, EUR, GBP, JPY, and more
- **Multiple Cryptocurrencies**: Monitor BTC, ETH, and LTC prices
- **Platform-Adaptive UI**: Different interface elements for iOS (Cupertino) and Android (Material Design)
- **Real-time Price Updates**: Fetch current cryptocurrency exchange rates
- **Clean, Intuitive Interface**: Card-based design with dropdown currency selection

## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **UI Components**: Material Design & Cupertino widgets
- **State Management**: StatefulWidget with setState
- **Design Pattern**: MVC-inspired architecture

## Supported Currencies

AUD, BRL, CAD, CNY, EUR, GBP, HKD, IDR, ILS, INR, JPY, MXN, NOK, NZD, PLN, RON, RUB, SEK, SGD, USD, ZAR

## Supported Cryptocurrencies

- Bitcoin (BTC)
- Ethereum (ETH)
- Litecoin (LTC)

## Project Structure

```
lib/
├── main.dart           # App entry point and MaterialApp configuration
├── price_screen.dart   # Main screen with price display and currency selector
└── coin_data.dart      # Data models and currency/crypto lists
```

## Key Learning Concepts

This project demonstrates several important Flutter concepts:

- **DropdownButton Widget**: Implementing Material Design dropdown menus
- **Cupertino Widgets**: Creating iOS-style UI components
- **Platform Detection**: Checking and adapting UI based on the running platform
- **Loops in Dart**: Using for and for-in loops for dynamic widget generation
- **State Management**: Managing UI state with StatefulWidget
- **Theme Customization**: Implementing dark theme with custom colors

## Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd bitcoin_ticker
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Requirements

- Flutter SDK: >=2.1.0 <3.0.0
- Dart SDK: >=2.1.0 <3.0.0
- Android Studio / Xcode for mobile development

## Development Status

This project is currently in development. Planned enhancements include:

- API integration for real-time price fetching
- Complete implementation of currency dropdown with all supported currencies
- Platform-specific pickers (CupertinoPicker for iOS, DropdownButton for Android)
- Multiple cryptocurrency price cards
- Error handling and loading states
- Price refresh functionality

## Future Enhancements

- [ ] Integrate cryptocurrency price API
- [ ] Implement platform detection for adaptive UI
- [ ] Add Cupertino picker for iOS
- [ ] Display prices for all three cryptocurrencies
- [ ] Add pull-to-refresh functionality
- [ ] Implement local data caching
- [ ] Add price change indicators (up/down trends)

## What I Learned

Through building this project, I gained hands-on experience with:

- Creating cross-platform UIs that feel native on both iOS and Android
- Working with Flutter's widget composition model
- Managing application state and UI updates
- Implementing dropdown selections and user interactions
- Structuring a Flutter application for maintainability

## License

This project is open source and available under the MIT License.

## Acknowledgments

This project was developed as part of my Flutter learning journey, inspired by The App Brewery's Flutter Development Bootcamp curriculum.

---

**Note**: This is a learning project demonstrating Flutter fundamentals and cross-platform development concepts.
