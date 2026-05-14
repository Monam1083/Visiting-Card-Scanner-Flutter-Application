
📇 Visiting Card Scanner
A smart Flutter app that scans visiting cards, extracts contact information automatically using OCR, and saves contacts locally.

📷 Scan via Camera or Gallery — pick a visiting card image from your gallery or capture one live with the camera<br>
🔍 Automatic Text Extraction — uses Google ML Kit Text Recognition to extract all text from the card automatically<br>
🖐️ Drag and Drop Mapping — long press and drag extracted text chips to map them to the correct fields (Name, Mobile, Email, Company, Designation, Address, Website)<br>
✏️ Editable Form — review and edit all extracted information before saving<br>
💾 Local Storage — all contacts saved locally using SQFlite — no internet required<br>
📋 Contact List — view all saved contacts in a clean list with All and Favourites tabs<br>
❤️ Favourites — mark important contacts as favourite for quick access<br>
📞 Tap to Call — tap phone number to call directly<br>
💬 Tap to SMS — tap phone number to send SMS directly<br>
📧 Tap to Email — tap email to open mail app directly<br>
🗑️ Delete Contacts — remove contacts you no longer need<br>
<b>r
🛠️ Tech Stack
TechnologyPurposeFlutter & DartCross-platform mobile developmentGoogle ML Kit Text RecognitionOCR — automatic text extraction from card imagesSQFliteLocal database for storing contactsProviderState managementGo RouterAdvanced navigation and routingImage PickerCamera and gallery accessURL LauncherCall, SMS, and email integrationFlutter Easy LoadingLoading indicators
<br>
📂 Project Structure
lib/
├── main.dart
├── db/                 
├── model/               
├── pages/              
│   ├── home_page.dart   
│   ├── scan_page.dart   
│   └── form_page.dart   
├── provider/            
└── utils/              

🚀 How to Run
Prerequisites
Flutter SDK installed
Android Studio or VS Code
Android device or emulator
Steps
# 1. Clone the repository
git clone https://github.com/Monam1083/visiting-card-scanner-flutter
# 2. Navigate to project folder
cd visiting-card-scanner-flutter
# 3. Install dependencies
flutter pub get
# 4. Run the app
flutter run

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


<div align="center">
⭐ If you found this project helpful, please give it a star!
</div>
