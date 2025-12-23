# ivf

An example Flutter application contained in the `ivf/` folder of this repository.  
This README was created from the project's files (pubspec.yaml and folder structure) to provide a clear, actionable overview, setup instructions, and guidance for development.

---

## Table of contents

- [About](#about)
- [Key features / Libraries used](#key-features--libraries-used)
- [Prerequisites](#prerequisites)
- [Getting started (run locally)](#getting-started-run-locally)
- [Configuration](#configuration)
- [Project structure](#project-structure)
- [Assets (fonts & images)](#assets-fonts--images)
- [Testing](#testing)
- [Building for release](#building-for-release)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License & author](#license--author)

---

## About

This is a Flutter application scaffolded in the `ivf/` folder. The app integrates common Flutter UI libraries and several utility packages (for state management, API integration, UI components, and more). The name `ivf` is the project folder name — adapt descriptions and configuration to match your intended application domain.

---

## Key features / Libraries used

The app's `pubspec.yaml` shows a number of packages that indicate typical functionality:

- flutter, cupertino_icons
- get — routing/state management
- odoo_api — integration with Odoo back-end (ERP/API)
- rxdart — reactive programming utilities
- object_mapper — JSON-to-object mapping helpers
- responsive_sizer — responsive layout helpers
- font_awesome_flutter — iconography
- gradient_scaffold — background gradients
- smooth_page_indicator, infinite_carousel, carousel_slider — onboarding / carousels / paging UIs
- flutter_rating_bar — ratings UI
- intro_slider — app introduction slides
- flutter_calendar_carousel, syncfusion_flutter_datepicker — calendar / date selection
- cached_network_image — efficient image loading & caching
- mailer — send email (SMTP)
- toast — lightweight notifications
- http — REST requests

(See `pubspec.yaml` for exact version pins.)

---

## Prerequisites

- Flutter SDK (see `pubspec.yaml` SDK constraint: `>=2.7.0 <3.0.0`). Use a compatible Flutter stable release.
- Android SDK/Xcode (for mobile builds) or Chrome (for web).
- Optional: An Odoo instance or other back-end if you will use `odoo_api`.

Verify Flutter is installed and available:

```bash
flutter --version
```

---

## Getting started (run locally)

1. Clone the repository (if you haven't already):

```bash
git clone https://github.com/moeldemery/Flutter_Projects.git
cd Flutter_Projects/ivf
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app (choose a device/emulator):

```bash
flutter run
```

To run for a specific target:

- Android emulator / device:
  flutter run -d emulator-5554
- iOS simulator:
  open ios/Runner.xcworkspace and run from Xcode or:
  flutter run -d ios
- Web:
  flutter run -d chrome

---

## Configuration

The project includes an Odoo API dependency and `mailer`. There is no committed secrets/config file in the repository. Typical configuration steps:

- Create a local configuration file (example `lib/config.dart` or environment variables) and do not commit credentials.
- Example config (pseudo):

```dart
// lib/config.dart (example)
const ODOO_HOST = 'https://my-odoo.example.com';
const ODOO_DB = 'my_db_name';
const ODOO_USERNAME = 'user@example.com';
const ODOO_PASSWORD = 'supersecret';
const SMTP_HOST = 'smtp.example.com';
const SMTP_PORT = 587;
const SMTP_USERNAME = 'smtp_user';
const SMTP_PASSWORD = 'smtp_password';
```

- If you use `.env` files, add `.env` to `.gitignore` and read variables at runtime via an env reader.

If the app expects an API base URL or tokens, document expected keys and where to place them (e.g., `lib/config.dart`, `.env`, or platform-specific configs).

---

## Project structure

At a glance (relevant folders in `ivf/`):

- android/ — Android platform code
- ios/ — iOS platform code
- lib/ — Dart source code (main app code). (Inspect for actual package layout.)
- images/ — app image assets referenced in `pubspec.yaml`
- fonts/ — custom fonts included:
  - fonts/Arvo/Arvo-Bold.ttf
  - fonts/Kashie/KashieMercy.ttf
  - fonts/TimeBurner/TimeburnerBold.ttf
- web/ — web build support
- test/ — unit/widget tests

---

## Assets (fonts & images)

pubspec.yaml includes:

- assets:
  - images/

- fonts:
  - Arvo (fonts/Arvo/Arvo-Bold.ttf)
  - KashieMercy (fonts/Kashie/KashieMercy.ttf)
  - Timeburner (fonts/TimeBurner/TimeburnerBold.ttf)

Make sure font file paths and image files are present under `ivf/fonts/` and `ivf/images/`. If you add or rename assets, re-run `flutter pub get`.

---

## Testing

Run unit and widget tests:

```bash
flutter test
```

Add tests under `ivf/test/` to increase coverage.

---

## Building for release

- Android (APK):

```bash
flutter build apk --release
```

- iOS:

Open `ivf/ios/Runner.xcworkspace` in Xcode and follow code signing instructions, or:

```bash
flutter build ios --release
```

- Web:

```bash
flutter build web
```

Follow Flutter's official docs for platform-specific signing and distribution steps.

---

## Troubleshooting

- SDK constraint errors: ensure your installed Flutter/Dart versions meet `>=2.7.0 <3.0.0`. Consider using a compatible Flutter channel (stable) or update pubspec if you intentionally need a newer SDK.
- iOS: if CocoaPods fail, run:
  `cd ios && pod install`
- Gradle/Android build issues: run `flutter clean`, then `flutter pub get`, and try again.
- Missing assets/fonts: double-check paths in `pubspec.yaml` and that files exist in `fonts/` and `images/`.

---

## Contributing

- Open issues or pull requests in the repository for bug fixes, enhancements, or documentation improvements.
- Keep secrets out of commits. Use environment variables or local config files excluded by `.gitignore`.
- Follow existing code style and add tests for new functionality when feasible.

---

## License & author

- Author: moeldemery (GitHub: https://github.com/moeldemery)
- No license file is present in this folder. Add a LICENSE file at repository root if you want to declare a license (e.g., MIT, Apache-2.0).

---
