# Flutter Navigation and Routing Demo

This repository demonstrates how to handle navigation and routing in a Flutter application, focusing on how to mimic Android's navigation behavior (like `onBackPressed()` and `finish()`) using Flutter's `Navigator`.

## Features

- Navigation between `HomePage` and `IntroPage`
- Various navigation methods mimicking Android's `onBackPressed()` and `finish()` behaviors
- Example of clearing all back stack screens and navigating to a single screen

## Code Structure

The project consists of two main screens:

1. **HomePage** - The main entry point of the app.
2. **IntroPage** - A secondary screen you can navigate to from the HomePage.

```dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home_page': (context) => const HomePage(),
        '/intro_page': (context) => const IntroPage(),
      },
    );
  }
}
```

## Navigation Methods

### Go Back (Equivalent of `onBackPressed()` or `finish()`)

To mimic the behavior of Android's `onBackPressed()` or `finish()`, use the following code in Flutter:

```dart
Navigator.pop(context);
```

This will close the current screen and go back to the previous screen in the navigation stack.

### Navigate and Replace Current Screen

To navigate to another screen and remove the current screen from the stack (like Android's `finish()` when starting a new activity):

```dart
Navigator.pushReplacementNamed(context, '/intro_page');
```

This will replace the current screen (`HomePage`) with `IntroPage`.

### Navigate and Clear All Screens from Back Stack

If you want to navigate to a screen and clear all previous screens (like finishing all activities and starting a new one):

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/intro_page', 
  (Route<dynamic> route) => false,
);
```

This clears the entire back stack and navigates to `IntroPage`, making it the only screen on the stack.

### Additional Useful Navigation Methods

- **Push a New Screen** (Adds to the stack):
  ```dart
  Navigator.pushNamed(context, '/home_page');
  ```

  This adds a new screen (`HomePage`) to the navigation stack.

- **Pop Until a Certain Screen** (Go back to a specific screen in the stack):
  ```dart
  Navigator.popUntil(context, ModalRoute.withName('/home_page'));
  ```

  This pops screens until it finds `HomePage` in the stack.

- **Replace All Routes with a New One**:
  ```dart
  Navigator.pushNamedAndRemoveUntil(
    context,
    '/home_page',
    (Route<dynamic> route) => false,
  );
  ```

  This navigates to `HomePage` and removes all other routes from the stack.

### Navigate and Remove Specific Screens from Back Stack
If you want to navigate to a screen and remove only specific screens from the stack (e.g., `'/login'` and `'/signup'`):

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/login',
  (route) => route.settings.name != '/login' && route.settings.name != '/signup',
);
```

## Passing Arguments Between Screens
Flutter allows you to pass data between screens when navigating using `Navigator.pushNamed` or similar methods. Below is a demonstration of how to pass and retrieve arguments.

### Passing Arguments
To pass arguments when navigating to a screen, use the `arguments` parameter:
```dart
Navigator.pushNamed(
  context,
  '/intro_page',
  arguments: {
    'title': 'Welcome to Intro Page',
    'description': 'This is an example of passing arguments in Flutter.',
  },
);
```

### Retrieving Arguments
In the target screen (`IntroPage` in this case), retrieve the arguments using `ModalRoute.of(context)?.settings.arguments`:
```dart
// Retrieve the arguments passed during navigation
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final title = args['title'] ?? 'Default Title';
    final description = args['description'] ?? 'Default Description';
```

## Contact

For questions or feedback, please contact [@Bhavyansh03-tech](https://github.com/Bhavyansh03-tech) on GitHub or connect with me on [LinkedIn](https://www.linkedin.com/in/bhavyansh03/).

---
