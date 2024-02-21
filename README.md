# LinkingSign

LinkingSign is the mobile application project that facilitates sign-language learning process with the help of AI in practice assessment.

## Video

#insert a link

## Getting started

- To run any Android application built with Flutter you need to configure the enviroments in your machine, you can do this following the the tutorial provided by Google in [Flutter website](https://docs.flutter.dev/get-started/install)
- Flutter SDK
- Android Studio (to download Android SDK)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

## Tech Stack

- Flutter
- API with Go backend and Database
- AI

## Set up

- Clone the repository
- Open the project in your preferred IDE (e.g. Android - Studio, VS Code)
- Run `flutter pub get` to install the required dependencies
- Run the project in an emulator or on a physical device

## Project Structure

- app
  - data:
    - models: contains the app's models
  - global_widgets: contains widgets that are used multiple times in app
  - modules:
    - <module_name>:each module is named after its specified function
      - screens: contains screens of the function
      - widgets: contains widgets that only appear in this function.
      - <module_name>\_controller.dart: Initializes controller for the feature
      - <module_name>\_binding.dart: Defines functions and variables for controller
  - routes
  - app_pages.dart: routes to corresponding pages
  - app_routes.dart: contains names of routes
- main.dart

## Resource

- [Figma](https://www.figma.com/)
- [Github](https://github.com/)
