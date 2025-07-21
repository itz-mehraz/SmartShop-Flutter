# Smart Shop - Flutter E-Commerce App

## Description

**Smart Shop** is a mini e-commerce app built with **Flutter**, using **Provider** for state management, **SharedPreferences** for persistence, and a **FakeStore API** to fetch products.

---

## Features

- **Login**: User authentication with **TextFormField** validation and **SharedPreferences** for storing login state.
- **Product Display**: Fetch products using **FakeStore API** and display with price, description, and ratings.
- **Favorites**: Mark products as favorites and view them on a separate page.
- **Cart**: Add products to the cart and view total price.
- **Theme Toggle**: Switch between **Dark** and **Light** themes.
- **Sorting**: Sort products by **price** (low → high, high → low) and **rating**.

---

## Video Demonstration

Watch the app demo below. (Autoplay enabled)

[![Smart Shop Demo](https://img.youtube.com/vi/KVBNaOjDvNI/0.jpg)](https://youtu.be/KVBNaOjDvNI?autoplay=1)

---

## Screenshots

- **Home Screen**  
  ![Homepage](assets/Homepage.png)

- **Login Page**  
  ![Login Page](assets/login_page.png)

- **Favorites Page**  
  ![Favorites Page](assets/Favorites_Page.png)

- **Cart Page**  
  ![Cart Page](assets/Cart_Page.png)

- **Sorting: Price High to Low**  
  ![Sorting Price high Low](assets/Sorting_Price_high_Low.png)

- **Dark Theme**  
  ![Dark Theme](assets/Dark_Theme.png)



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

---

## License

This project is open-source and available under the [MIT License](LICENSE).

````

### What to Do Next:
1. **Images**: Ensure that the images (e.g., `Homepage.png`, `login_page.png`, etc.) are placed in the `assets/` folder in your project. The images should be properly linked for the markdown to show them in the GitHub repository.
   
2. **Commit the changes**:
   Once you have updated the README.md with correct image paths, commit the changes and push them to GitHub:

   ```bash
   git add README.md
   git commit -m "Update README with correct image paths"
   git push origin main
````

This will make sure the images display properly on GitHub's README page.
