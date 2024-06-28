# shoesly_priority_soft

Shoesly
Flutter version: 3.22.2
Dart Version: 3.4.3

## Prerequisites

1. **Install Flutter:**
- Follow the official Flutter installation guide to install Flutter on your system.
- Ensure the flutter command is added to your system's PATH.

2. **Install Dart:**

- Dart is included with Flutter, but you may verify its installation.
- Use the command: dart --version.

3. **Set Up an IDE:**

- VS Code:
    - Install Visual Studio Code.
    - Install Flutter and Dart plugins from the VS Code marketplace.
- Android Studio:
    - Install Android Studio.
    - Install the Flutter and Dart plugins from the plugin marketplace.

4. **Android and iOS Setup:**

- For Android, ensure Android SDK and an emulator are set up.
- For iOS, ensure Xcode is installed and set up for iOS development (Mac only).

## Project Setup Instructions

Follow these steps to set up and run the project on your local machine:

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/Ruzit/Shoesly_Priority_Soft.git
    ```

2. **Set Up FlutterFire:**
    - Install the FlutterFire CLI:
        ```bash
        dart pub global activate flutterfire_cli
        ```
    - Configure your Firebase project:
        ```bash
        flutterfire configure
        ```

3. **Install Dependencies:**
    ```bash
    flutter pub get
    ```

5. **Run the Application:**
    - For a specific device (e.g., iOS simulator, Android emulator):
        ```bash
        flutter run
        ```
    - To see the list of available devices:
        ```bash
        flutter devices
        ```

## Assumptions Made During Development

1. **User Authentication:** Cart feature needs user to access due to which a user is automatically signed in using Firebase Anonymous Sign-In.
2. **Brand Images:** All brand images are in SVG format. 
3. **Product Gender:** Products are designed for a specific gender or as unisex.
4. **Color Options:** Products have multiple color options available.
5. **Cart Selection:** Color and size must be selected when adding products to the cart.
6. **Price Range:** The maximum product price is assumed to be upto $2000.
7. **Checkout Process:** All items in the cart can be checked out at once; partial checkout is not supported.
8. **Address and Payment:** Address and payment features are not implemented so, static address and payment methods are used.

## Challenges Faced and Solutions

1. **Firebase Database Population:**
    - **Challenge:** Adding dummy data in firebase.
    - **Solution:** Used custom service to populate data in database.

2. **Firebase Configuration:**
    - **Challenge:** Configuring Firebase for both Android and iOS.
    - **Solution:** Used the FlutterFire CLI for consistent setup across platforms.

3. **Color Filter for Images:**
    - **Challenge:** Handling different color representations and formats.
    - **Solution:** Implemented a custom image filter with the `ColorFiltered` widget.

4. **Price Range Slider UI design**
    - **Challenge:** Making complete replica of price range slider in filer page from figma file was challenging. Could take more time to design custom slider.
    - **Solution:** Used third party package `syncfusion_flutter_sliders`.


## Additional Features and Improvements

1. **State Management:** Implemented using Flutter Bloc for better scalability and maintainability.
2. **UI/UX Components:** Improved user interface with custom widgets and splash screen.
3. **Database Populate:** Added a service to populate data for  products, brands and reviews into the database.
3. **Local Notification:** Added a local notification service to notify user on the succesful order placement.
4. **Unit Test** Written a few unit test for brand section, could not implemented test case for all features due to time constraint.

---

For any further assistance or queries, feel free to reach out to the project maintainer.
