# 💸 Expense Tracker Lite

A lightweight Flutter expense tracking app with offline support, currency conversion, pagination, and a polished custom UI. Developed as part of the Inovola technical assessment.

---

## 📦 Architecture & Structure

The project follows a **clean separation of concerns** using:

lib/
├── data/ # API services, Hive DB setup
├── models/ # Data models (Expense, Currency, Category)
├── presentation/ # Screens, widgets, theming
├── bloc/ # State management using BLoC
├── utils/ # Helpers and constants


- **Single Responsibility Principle** is maintained across components.
- UI logic is isolated from data and domain logic.
- `AppColors`, `AppButton`, and reusable widgets are stored independently.

---

## 🧠 State Management

State is managed using the **BLoC (Business Logic Component)** pattern, providing a predictable and testable flow for:

- Expense loading with pagination
- Currency conversion
- Adding new expenses
- Filter selection (e.g., This Month, Last 7 Days)

---

## 🌐 API Integration

The app uses **[exchangerate.host](https://exchangerate.host)** for currency conversion:

- Used `http` package to call `https://api.exchangerate.host/convert`
- Fetched conversion on `Save Expense` to store USD equivalent

Mock API support was also scaffolded using local delay logic.

---

## 🔁 Pagination Strategy

- Implemented **local pagination** using BLoC.
- ListView shows 10 items per page using a `Load More` button.
- Pagination works with selected filters, maintaining scoped data.

---

## 🎨 UI Screenshots


| Login Screen                                                                           
|--------------|
|[login](https://github.com/user-attachments/assets/833ddce7-c583-44a5-9290-ad81a02ea12f)|
| Dashboard Screen 
|--------------|
|[dashboard](https://github.com/user-attachments/assets/67774073-cd0e-4804-b66c-2fe9548ed27e)|
| Add Expense
|--------------|
|[add_expense](https://github.com/user-attachments/assets/485f4899-e977-48ee-aa15-6e7f7450bf16)


## ⚖️ Trade-offs & Assumptions

- Used Hive for quick local storage, ideal for offline-first apps.
- Did not use advanced animations or charts to keep performance light.
- Assumed category list is static
- Some API data structures were mocked for predictable testing.

---

## 🚀 Getting Started

### Prerequisites

- Flutter 3.10.0+
- Dart 3+
- Android/iOS emulator or device

### Installation

```bash
git clone https://github.com/Abdelr7man7assan/inovola.git
cd inovola
flutter pub get
flutter run
