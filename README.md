# 🎓 Campus Eventos

A responsive Flutter application for discovering, filtering, and registering for university events.

---

## 🎯 About The Project

Campus Eventos is a Flutter application designed to help university students discover activities happening around their campus.

The application provides a clean and responsive interface where users can browse academic, sports, cultural, technology, and workshop events. Events can be searched and filtered dynamically, and users can register or cancel their registration directly from each event card.

The project was developed as part of the **Mobile Device Programming** course.

### Why Campus Eventos?

- 🔎 Search university events dynamically
- 🏷️ Filter events by category
- 📱 Responsive design for mobile, tablet, and larger screens
- 🎟️ Register and cancel event registrations
- 🔔 Interactive feedback using SnackBars
- 🎨 Custom university-inspired visual identity
- 📅 View relevant event information at a glance

---

## ✨ Features

### 🔎 Event Discovery

- Browse a catalog of university events
- Search events by name
- Filter events by category
- Dynamic event counter
- Empty state when no events match the selected filters

### 🏷️ Event Categories

Events are organized into:

- 🎓 Academic
- ⚽ Sports
- 🎨 Cultural
- 💻 Technology
- 🛠️ Workshops

### 🎟️ Event Registration

Users can register for an event directly from its card.

When an event is registered:

- The event displays a **Registered** status
- The registration button changes its appearance
- A confirmation message is displayed using a SnackBar
- The registration can be cancelled at any time

### 📱 Responsive Interface

The application automatically adjusts the number of event cards displayed depending on the available screen width.

It supports layouts for:

- Mobile devices
- Tablets
- Desktop and web screens

---

## 📸 Demo

### Welcome Screen

> Add a screenshot of the welcome screen here.

### Event Catalog

> Add a screenshot showing the event cards and categories here.

### Search & Filters

> Add a screenshot showing an active search or category filter here.

### Event Registration

> Add a screenshot showing a registered event here.

---

## 🚀 Installation

### Prerequisites

Before running the project, make sure you have the following installed:

| Requirement | Purpose |
| --- | --- |
| Flutter SDK | Application framework |
| Dart SDK | Programming language |
| Git | Version control |
| Android Studio / Xcode | Mobile emulation |
| VS Code | Recommended editor |

### Quick Start

```bash
# Clone the repository
git clone <repository-url>

# Navigate to the Flutter project
cd CampusEventos/eventos_universitarios

# Install dependencies
flutter pub get

# Run the application
flutter run
```

To check available devices:

```bash
flutter devices
```

To run the application on Chrome:

```bash
flutter run -d chrome
```

---

## 💻 Usage

After starting the application:

1. Open the welcome screen.
2. Select **Explore Events**.
3. Browse the available university events.
4. Use the search bar to find an event by name.
5. Select a category to filter the results.
6. Press **Register** to register for an event.
7. Press **Cancel Registration** to remove the registration.

---

## 🛠️ Tech Stack

| Technology | Purpose |
| --- | --- |
| Dart | Programming language |
| Flutter | Application framework |
| Material Design | User interface components |
| Git | Version control |
| GitHub | Source code repository |

---

## 📁 Project Structure

```text
eventos_universitarios/
│
├── lib/
│   ├── main.dart
│   │
│   ├── data/
│   │   └── event_data.dart
│   │
│   ├── screens/
│   │   ├── home_page.dart
│   │   └── welcome_page.dart
│   │
│   ├── widgets/
│   │   ├── campus_logo.dart
│   │   ├── category_chip.dart
│   │   └── event_card.dart
│   │
│   └── theme/
│       └── app_theme.dart
│
├── android/
├── ios/
├── macos/
├── web/
├── test/
├── pubspec.yaml
└── README.md
```

---

## 👤 Author

**César Malanco**

---

_Built with ❤️ using Flutter and Dart._