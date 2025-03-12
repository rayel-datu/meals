# Meal App - README

This document provides instructions for setting up and running the Meal App.

## Table of Contents

* Prerequisites
* Getting Started
    * Generating Codes (Build Runner)
    * Running Storybook
    * Running the App
* Configuration
    * Base URL
* Troubleshooting
* Contributing
* License

## Prerequisites

Before you begin, ensure you have the following installed:

1.  **Flutter SDK:** Version 3.29 or higher. You can download and install it from the official Flutter website: [flutter.dev](https://flutter.dev).
2.  **Dart SDK:** Included with Flutter.
3.  **An IDE:**
    * VS Code with the Flutter and Dart extensions (recommended).
    * Android Studio with the Flutter plugin.
    * IntelliJ IDEA with the Flutter plugin.
4.  **Android SDK and/or iOS SDK:** If you plan to run the app on a physical device or emulator.

## Getting Started

### Generating Codes (Build Runner)

This app utilizes code generation, so you'll need to run the build runner.

1.  Open your terminal or command prompt.
2.  Navigate to the project's root directory.
3.  Execute the following command:

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

    This command will generate the necessary Dart code. Run this command whenever you make changes to files that require code generation (e.g., annotated classes).

### Running Storybook

The app includes a Storybook for component testing and development.

**For VS Code:**

1.  Open the project in VS Code.
2.  In the Run and Debug view, select the "meal\_app \[story book]" configuration.
3.  Click the "Start Debugging" button (green arrow).

**For Other IDEs:**

1.  Open the project in your IDE.
2.  Locate and run the `main_story_book.dart` file.

### Running the App

**For VS Code:**

1.  Open the project in VS Code.
2.  In the Run and Debug view, select the "meal\_app" configuration.
3.  Click the "Start Debugging" button (green arrow).

**For Other IDEs:**

1.  Open the project in your IDE.
2.  Locate and run the `main.dart` file.

**For all IDEs:**

1.  Choose a target device or emulator.
2.  The app should launch on your selected device.

## Configuration

### Base URL

The app's base URL for API requests can be configured using Dart defines.

* To update the base URL, modify the `dart-defines` parameter in your IDE's run configuration or command-line execution.
* Example `dart-defines` parameter:

    ```
    --dart-define=BASE_URL=[https://your-api-base-url.com](https://your-api-base-url.com)
    ```

    Replace `https://your-api-base-url.com` with the actual base URL. If no value is provided, a default value within the code will be used.

## Troubleshooting

* **Build Runner Issues:** If you encounter errors during code generation, try cleaning the build cache and running the build runner again:

    ```bash
    flutter clean
    dart run build_runner build --delete-conflicting-outputs
    ```

* **Emulator/Device Issues:** Ensure your emulator or device is properly configured and connected.
* **Dependency Issues:** If you encounter dependency conflicts, run `flutter pub get` or `flutter pub upgrade`.
* **Storybook Issues:** If the storybook is not running, ensure you have ran the build runner, and that you have selected the correct run configuration.