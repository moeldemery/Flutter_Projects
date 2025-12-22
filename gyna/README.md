# Gyna - Gynecology Clinic Management System 🏥

A comprehensive, enterprise-grade mobile clinic management system built with Flutter and integrated with Odoo ERP. Designed specifically for gynecology and obstetrics practices, this application streamlines patient records, medical history, visit tracking, and clinical workflows.

## 📱 Screenshots

*Add screenshots of dashboard, patient management, visit forms, and medical records*

## ✨ Key Features

### 👥 Patient Management
- **Complete Patient Records**: Personal information, medical history, and demographic data
- **Partner Information**: Spouse/husband details with separate profile management
- **Advanced Search**: Fast patient lookup with searchable database
- **Bulk Operations**: Multi-select delete with confirmation dialogs
- **Patient Summary**: Quick-view detailed patient information

### 🏥 Visit Management
- **Gynecology Visits**: Comprehensive examination forms with medical parameters
- **Obstetric Visits**: Specialized pregnancy monitoring and tracking
- **Visit History**: Searchable, sortable visit records with patient linking
- **Multi-Section Forms**: Organized data entry with collapsible sections

### 📋 Medical Records
- **Menstrual History**: Complete cycle tracking and history
- **Obstetric History**: Gravida, para, abortion tracking
- **Gynecologic History**: Detailed gynecological conditions
- **Medical History**: General medical conditions with searchable database
- **Prohibited Drugs**: Dynamic list management for contraindicated medications

### 🔬 Clinical Features
- **Lab Requests**: Lab, radiology, and pathology order management
- **Diagnostic Results**: Lab group categorization and result tracking
- **Medicine Management**: Comprehensive drug database with details
- **Prescription System**: Visit-based medication prescription

### 📊 Data Management
- **Odoo ERP Integration**: Real-time synchronization with backend
- **Offline Detection**: Visual indicator for connection status
- **Data Validation**: Form validation and error handling
- **Pull-to-Refresh**: Manual data sync capability

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: Odoo ERP (v14+)
- **State Management**: StatefulWidget with setState
- **Data Transfer**: Custom DTOs with Object Mapper
- **API Integration**: Odoo API Client
- **UI Components**: Material Design + Custom widgets
- **Icons**: Font Awesome Flutter
- **Network Monitoring**: Flutter Offline
- **Data Tables**: Horizontal Data Table

## 📂 Project Architecture

```
lib/
├── main.dart                           # App entry & Odoo initialization
├── assets/
│   ├── constants.dart                  # UI constants & app bar configs
│   ├── custom_widget.dart              # Reusable input widgets
│   ├── custom_widget_k.dart            # Widget styling constants
│   ├── custom_table.dart               # Table generators
│   └── globals.dart                    # Global variables
├── odoo/
│   ├── odooAuth.dart                   # Odoo authentication & connection
│   ├── patientDTO.dart                 # Patient data transfer object
│   ├── visitDTO.dart                   # Visit data transfer object
│   ├── medicineDTO.dart                # Medicine data transfer object
│   ├── labDTO.dart                     # Lab request data transfer object
│   ├── husbandDTO.dart                 # Partner data transfer object
│   ├── itemsDTO.dart                   # Generic item DTOs
│   └── drugsDTO.dart                   # Prohibited drugs DTO
└── screens/
    ├── home_screen.dart                # Dashboard with grid navigation
    ├── home_subscreen/
    │   ├── addPatient_screen.dart      # Patient registration form
    │   ├── viewPatient.dart            # Patient list & search
    │   ├── addVisit.dart               # Visit recording form
    │   ├── viewVisit.dart              # Visit history table
    │   ├── medicine.dart               # Medicine database entry
    │   ├── addLab_screen.dart          # Lab request creation
    │   ├── SearchPatient.dart          # Patient search widget
    │   ├── home_buttons.dart           # Dashboard button widget
    │   └── addPatient_subscreen/
    │       └── addHusband_screen.dart  # Partner registration
    └── subscreens/
        └── drawer_subScreen.dart       # Navigation drawer
```

## 🔑 Core Components

### Data Transfer Objects (DTOs)
All DTOs use Object Mapper for JSON serialization/deserialization:
- **PatientDTO**: 50+ fields including personal, medical, and diagnostic data
- **VisitDTO**: Comprehensive visit forms (Gynecology & Obstetric)
- **MedicineDTO**: Drug information with composition, dosage, indications
- **LabDTO**: Lab/radiology/pathology request structure

### Custom Widgets Library
Reusable, production-ready form components:
- **InputField**: Standard text input with icons
- **InputDigitField**: Numeric input with validation
- **InputDateField**: Date picker with age calculation
- **InputDropDownMenu**: Dropdown with custom styling
- **InputSearchField**: Searchable autocomplete with add capability
- **InputListField**: Dynamic list with add/remove
- **InputSearchListField**: Multiple searchable selections
- **InputBoolField**: Checkbox with label and icon

### Odoo Integration
```dart
// Authentication
await client.authenticate(username, password, database);

// Create record
await client.create(model, dataMap);

// Search and read
await client.searchRead(model, domain, fields);

// Update record
await client.write(model, [id], dataMap);

// Delete records
await client.unlink(model, [ids]);
```

## 🚀 Installation

### Prerequisites
- Flutter SDK 2.0+
- Dart SDK 2.12+
- Odoo Server (v14 or higher)
- Android Studio / Xcode for mobile development

### Backend Setup

1. **Configure Odoo Server**:
   - Install Odoo ERP
   - Install custom gynecology module
   - Configure database

2. **Update Connection Settings**:
   Edit `lib/odoo/odooAuth.dart`:
   ```dart
   static String baseUrl = 'http://your-server:8070';
   static String userName = "your@email.com";
   static String password = "your_password";
   static String databaseName = "your_database";
   ```

### Frontend Setup

1. Clone the repository:
```bash
git clone <your-repo-url>
cd gyna
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
  fonts:
    - family: FugazOne
      fonts:
        - asset: fonts/FugazOne-Regular.ttf
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
  
  # Odoo Integration
  odoo_api: ^latest                      # Odoo ERP client
  object_mapper: ^latest                 # JSON mapping
  
  # UI Components
  font_awesome_flutter: ^latest          # Icon library
  getwidget: ^latest                     # UI widgets
  horizontal_data_table: ^latest         # Data tables
  
  # Connectivity
  flutter_offline: ^latest               # Offline detection
  connectivity_for_web: ^latest          # Web connectivity
  
  # User Feedback
  flushbar: ^latest                      # Toast notifications
  
  # Utilities
  intl: ^latest                          # Date formatting
  image_picker: ^latest                  # Image selection
```

## 💡 Key Features Breakdown

### Patient Registration Form
- **7 Collapsible Sections**: Personal Info, Medical Info, Visits, Diagnostic Results, Operative Data, Reports, Scanned Documents
- **Dynamic Fields**: Age auto-calculation, marriage duration calculation
- **Searchable Relations**: Husband selection with inline add capability
- **Medical History**: Multi-select from predefined conditions
- **Drug Management**: Dynamic list for prohibited medications

### Visit Recording
- **Gynecology Section**: 
  - Vital signs (temp, BP, weight)
  - Ultrasound findings (uterus, ovaries, endometrium)
  - Myoma measurements (submucous, interstitial, subserous)
  - Adenomyosis, cervix, tubes evaluation

- **Obstetric Section**:
  - Pregnancy details (LMP, EDD, gestational age)
  - Gravida/Para tracking
  - Blood type, antibodies, TORCH screening
  - Fetal monitoring (weight, viability, presentation)
  - Placenta evaluation (position, grading, amniotic fluid)

- **Request Management**: Lab, radiology, pathology orders
- **Prescription**: Medication entry
- **Visit Summary**: Auto-generated summary fields

### View Patient/Visit Screens
- **Horizontal Scrolling Tables**: Efficient data display
- **Multi-select**: Checkbox selection for bulk operations
- **Pull-to-Refresh**: Manual sync capability
- **Inline Search**: Fast patient/visit lookup
- **Delete Confirmation**: Safety dialogs before deletion

## 🎨 Design Features

### Color Scheme
- **Primary**: Maroon Red `#8C2035`
- **Accent**: Light Blue `#8dc0c6`
- **Background**: Custom gradient with medical imagery
- **Cards**: White with shadow elevation

### UI/UX Elements
- **Grid Dashboard**: 2-column grid with icon buttons
- **Expansion Tiles**: Organized form sections
- **Offline Indicator**: Red banner with loading spinner
- **Form Validation**: Real-time field validation
- **Date Pickers**: Custom themed date selectors
- **Search Bars**: Overlay search with suggestions

## 🔐 Security & Permissions

### Required Permissions
```xml
<!-- Android -->
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

### Data Security
- Odoo session-based authentication
- Encrypted API communication
- Role-based access control (configured in Odoo)
- No local sensitive data storage

## 🎓 Technical Highlights

### Object Mapper Pattern
```dart
class PatientDTO with Mappable {
  @override
  void mapping(Mapper map) {
    map("name", patientControllerName.text, 
        (v) => patientControllerName.text = v.toString());
    map("female_age", controllerAge.text, 
        (v) => controllerAge.text = v.toString());
    // ... more mappings
  }
}
```

### Dynamic Widget Creation
```dart
// Reusable search field with inline add
InputSearchField(
  valueDrop: selectedItem,
  listItems: searchableList,
  iconName: FontAwesomeIcons.userAlt,
  labelText: 'Select Item',
  onAddTap: '/addNewItem',  // Navigate to add screen
)
```

### Offline Detection
```dart
OfflineBuilder(
  connectivityBuilder: (context, connectivity, child) {
    final bool connected = connectivity != ConnectivityResult.none;
    return Stack([
      child,
      if (!connected) OfflineIndicator(),
    ]);
  },
  child: MainContent(),
)
```

## 📊 Database Models

### Patient Model (gyn.clinic.patient)
- Personal: name, type, birth_date, age, mobile, occupation
- Partner: husband_name, husband_details
- Address: city, zone, street, phone
- Medical: menstrual_history, obstetric_history, gynecologic_history
- Lab: lab_type, lab_groups, diagnostic_results

### Visit Model (gyn.clinic.visit)
- Header: date, patient_id, fees
- Gynecology: 20+ examination fields
- Obstetric: 40+ pregnancy monitoring fields
- Requests: lab, radiology, pathology
- Prescription: medication details
- Summary: visit summary fields

### Medicine Model (gyn.clinic.medicine)
- name, medicament_type, dose
- pregnancy, composition, indications
- adverse_reactions, storage, dosage_instructions

## 🔮 Future Enhancements

- [ ] Report generation (PDF exports)
- [ ] Graphical data visualization
- [ ] Appointment scheduling
- [ ] SMS/Email notifications
- [ ] Image attachment (ultrasounds, scans)
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Biometric authentication
- [ ] Cloud backup integration
- [ ] Analytics dashboard
- [ ] Billing and invoicing module
- [ ] Prescription printing
- [ ] Lab result integration
- [ ] Video consultation

## 🐛 Known Limitations

- Requires stable internet connection for Odoo sync
- Large forms may have memory overhead on older devices
- Image upload not fully implemented
- Report generation pending
- Graph visualization not yet integrated

## 📄 License

This project is proprietary software. All rights reserved.

## 🙏 Acknowledgments

Built as a comprehensive solution for gynecology and obstetrics clinics to digitize and streamline patient care workflows. Demonstrates enterprise-level Flutter development with complex form handling, ERP integration, and medical data management.

---

**⚠️ Medical Disclaimer**: This is a clinical management tool. Always verify medical information with qualified healthcare professionals. Not intended to replace professional medical judgment.
