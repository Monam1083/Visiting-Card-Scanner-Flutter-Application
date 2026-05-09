<div align="center">
📇 Visiting Card Scanner
A smart Flutter app that scans visiting cards, extracts contact information automatically using OCR, and saves contacts locally.
Show Image
Show Image
Show Image
Show Image
</div>

📱 Screenshots
<p align="center">
  <img src="screenshots/scan_page.png" width="200" alt="Scan Page"/>
  &nbsp;&nbsp;
  <img src="screenshots/drag_drop.png" width="200" alt="Drag and Drop Mapping"/>
  &nbsp;&nbsp;
  <img src="screenshots/form_page.png" width="200" alt="Form Page"/>
  &nbsp;&nbsp;
  <img src="screenshots/contact_list.png" width="200" alt="Contact List"/>
</p>

✨ Features

📷 Scan via Camera or Gallery — pick a visiting card image from your gallery or capture one live with the camera
🔍 Automatic Text Extraction — uses Google ML Kit Text Recognition to extract all text from the card automatically
🖐️ Drag and Drop Mapping — long press and drag extracted text chips to map them to the correct fields (Name, Mobile, Email, Company, Designation, Address, Website)
✏️ Editable Form — review and edit all extracted information before saving
💾 Local Storage — all contacts saved locally using SQFlite — no internet required
📋 Contact List — view all saved contacts in a clean list with All and Favourites tabs
❤️ Favourites — mark important contacts as favourite for quick access
📞 Tap to Call — tap phone number to call directly
💬 Tap to SMS — tap phone number to send SMS directly
📧 Tap to Email — tap email to open mail app directly
🗑️ Delete Contacts — remove contacts you no longer need


🛠️ Tech Stack
TechnologyPurposeFlutter & DartCross-platform mobile developmentGoogle ML Kit Text RecognitionOCR — automatic text extraction from card imagesSQFliteLocal database for storing contactsProviderState managementGo RouterAdvanced navigation and routingImage PickerCamera and gallery accessURL LauncherCall, SMS, and email integrationFlutter Easy LoadingLoading indicators

📂 Project Structure
lib/
├── main.dart
├── db/                  # Database helper and queries
├── model/               # Contact data models
├── pages/               # All screens
│   ├── home_page.dart   # Contact list with All and Favourites tabs
│   ├── scan_page.dart   # Camera/Gallery + Drag and Drop mapping
│   └── form_page.dart   # Editable contact form before saving
├── provider/            # State management with Provider
└── utils/               # Utility functions and constants

🚀 How to Run
Prerequisites

Flutter SDK installed
Android Studio or VS Code
Android device or emulator

Steps
bash# 1. Clone the repository
git clone https://github.com/Monam1083/visiting-card-scanner-flutter.git

# 2. Navigate to project folder
cd visiting-card-scanner-flutter

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run

📦 Download APK

🔗 Download Latest APK

Install directly on your Android device to try the app without building from source.

🧠 What I Learned

Integrating Google ML Kit for real-time text recognition in a Flutter app
Building a custom drag and drop interface to map extracted text to specific contact fields
Managing local data with SQFlite including CRUD operations
Implementing Go Router for clean and scalable navigation
Separating concerns with a proper folder structure — models, pages, providers, db, utils
Using Provider for efficient state management across screens
Handling device permissions for camera, gallery, phone, and SMS


👨‍💻 Developer
Muhammad Monam Majeed
BS Software Engineering — Lahore Garrison University (Fall 2023 – 2027)
Show Image
Show Image

<div align="center">
⭐ If you found this project helpful, please give it a star!
</div>
