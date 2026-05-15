# 📇 Visiting Card Scanner

A Flutter application that scans visiting/business cards and automatically extracts contact information, storing it locally for easy access and communication.

---

## ✨ Features

- 📸 **Scan Business Cards** — Capture visiting cards using the device camera
- 🤖 **Auto Extract Info** — Automatically parses name, mobile, email, company, designation, website, and address from scanned cards
- 💾 **Local Storage** — All contacts saved locally using SQLite (no internet required)
- 📞 **One-tap Call** — Call any contact directly from the app
- 💬 **One-tap SMS** — Send an SMS without leaving the app
- 📧 **One-tap Email** — Opens your mail app pre-filled with the contact's email
- 🌐 **Website Launch** — Opens contact's website in the browser
- 🗺️ **Open in Maps** — View the contact's address in Google Maps
- ⭐ **Favourites** — Mark important contacts as favourites
- 📝 **Add / Edit Manually** — Add or update contacts via a form

---

## 🗂️ Project Structure

```
lib/
├── db/
│   └── db_helper.dart          # SQLite database setup & CRUD operations
├── model/
│   └── contact_models.dart     # Contact data model & table constants
├── pages/
│   ├── home_page.dart          # Contact list & search
│   ├── scan_page.dart          # Camera & card scanning
│   ├── form_page.dart          # Add / Edit contact form
│   └── contact_details_page.dart  # Full contact detail view
├── provider/
│   └── contact_provider.dart   # State management (Provider)
├── utils/                      # Utility/helper functions
└── main.dart                   # App entry point
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| Database | SQLite (`sqflite`) |
| State Management | Provider |
| URL Actions | `url_launcher` |
| Camera / Scan | Flutter Camera / ML Kit |

---

## 📦 Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  sqflite: ^2.3.3
  path: ^1.9.0
  url_launcher: ^6.3.1
  image_picker: ^1.1.2
```

---

## ⚙️ Setup & Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/visiting-card-scanner.git
   cd visiting-card-scanner
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Android — add permissions** in `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.CAMERA"/>
   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
   <uses-permission android:name="android.permission.CALL_PHONE"/>
   <uses-permission android:name="android.permission.SEND_SMS"/>
   ```

4. **Android — add url_launcher queries** in `AndroidManifest.xml` inside `<manifest>`:
   ```xml
   <queries>
     <intent>
       <action android:name="android.intent.action.DIAL"/>
     </intent>
     <intent>
       <action android:name="android.intent.action.SENDTO"/>
       <data android:scheme="mailto"/>
     </intent>
     <intent>
       <action android:name="android.intent.action.SENDTO"/>
       <data android:scheme="sms"/>
     </intent>
     <intent>
       <action android:name="android.intent.action.VIEW"/>
       <data android:scheme="https"/>
     </intent>
   </queries>
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 🗄️ Database Schema

**Table:** `tbl_contact`

| Column | Type | Description |
|---|---|---|
| `id` | INTEGER (PK) | Auto-increment primary key |
| `name` | TEXT | Contact full name |
| `mobile` | TEXT | Phone number |
| `email` | TEXT | Email address |
| `company` | TEXT | Company name |
| `designation` | TEXT | Job title |
| `website` | TEXT | Website URL |
| `address` | TEXT | Physical address |
| `image` | TEXT | Local path to scanned card image |
| `favourite` | INTEGER | `1` = favourite, `0` = normal |

---

## 📱 Screenshots

| Home | Scan | Details |
|---|---|---|
| *(Add screenshot)* | *(Add screenshot)* | *(Add screenshot)* |

---

## 🚀 Roadmap

- [ ] Dark mode support
- [ ] Export contacts to CSV / vCard
- [ ] Cloud backup & sync
- [ ] Search & filter by company
- [ ] Share contact as QR code

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

> Built with ❤️ using Flutter
