# Smart Shop - Flutter E-Commerce App

## Description

**Smart Shop** is a mini e-commerce app built with **Flutter**. It uses **Provider** for state management, **SharedPreferences** for persistence, and **FakeStore API** to fetch product data. 

---

## Features

- **Login/Register**: Simple login with validation.
- **Home Page**: Displays products fetched from **FakeStore API**.
- **Cart**: Add/remove products and view total price.
- **Favorites**: Mark products as favorites.
- **Theme Switch**: Toggle between light/dark themes.
- **Drawer Navigation**: Quick access to Home, Cart, Favorites, and Logout.

---

## Video Demonstration

Watch the app in action below:

[![Smart Shop Demo](https://img.youtube.com/vi/KVBNaOjDvNI/0.jpg)](https://youtu.be/KVBNaOjDvNI?autoplay=1)

---

## Screenshots

### Home & Login Screens
<p align="center">
  <img src="homepage.png" width="250px" style="margin-right: 15px;"/>
  <img src="login_page.png" width="250px"/>
</p>

### Favorites & Cart Pages
<p align="center">
  <img src="Favorites_Page.png" width="250px" style="margin-right: 15px;"/>
  <img src="Cart_Page.png" width="250px"/>
</p>

### Sorting & Dark Theme
<p align="center">
  <img src="Sorting_Price_high_Low.png" width="250px" style="margin-right: 15px;"/>
  <img src="Dark_Theme.png" width="250px"/>
</p>

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/itz-mehraz/SmartShop-Flutter.git

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/itz-mehraz/SmartShop-Flutter.git


## Installation

### 1. Clone the repository

```bash
git clone https://github.com/itz-mehraz/SmartShop-Flutter.git

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/itz-mehraz/SmartShop-Flutter.git


### 2. Change the directory

```bash
cd SmartShop-Flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the app

To run the app on an Android emulator or device, use the following command:

```bash
flutter run
```

---

## Technologies Used

* **Flutter**: A framework for building natively compiled applications.
* **Provider**: For state management.
* **SharedPreferences**: For storing app preferences and login data.
* **FakeStore API**: A simple API for product data.
* **Dart**: Programming language used for app development.

---

## Folder Structure

```plaintext
lib/
├── main.dart                  # Entry point of the app
├── models/
│   └── product_model.dart     # Product model
├── providers/
│   ├── auth_provider.dart     # Auth logic for login/logout
│   ├── cart_provider.dart     # Cart management
│   ├── favorites_provider.dart # Favorite products management
│   ├── product_provider.dart  # Fetching and managing products
│   └── theme_provider.dart    # Theme management (dark/light)
├── screens/
│   ├── auth/
│   │   └── login_screen.dart  # Login screen
│   ├── cart/
│   │   └── cart_screen.dart   # Cart page
│   ├── favorites/
│   │   └── favorites_screen.dart # Favorites page
│   ├── home/
│   │   └── home_screen.dart   # Home page
│   └── splash_screen.dart     # Splash screen
├── services/
│   └── api_service.dart       # API service for fetching data
├── utils/
│   ├── app_routes.dart        # Route management
│   └── app_theme.dart         # Theme configuration
├── widgets/
│   ├── app_drawer.dart        # Drawer widget
│   └── product_card.dart      # Product display widget
assets/
├── Homepage.png               # Screenshot of Home Page
├── Dark_Theme.png             # Screenshot of Dark Theme
├── Favorites_Page.png         # Screenshot of Favorites Page
├── Cart_Page.png              # Screenshot of Cart Page
├── Sorting_Price_high_Low.png # Screenshot of Sorting (Price High to Low)
├── login_page.png             # Screenshot of Login Page
```

---

## Contributing

1. Fork the repository.
2. Create your branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a new Pull Request.

--

## License

This project is open-source and available under the [MIT License](LICENSE).
