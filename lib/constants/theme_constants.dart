part of 'constants.dart';

class ThemeC {
  /// The lightTheme.
  static final lightTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    brightness: Brightness.light,

    // Background color.
    scaffoldBackgroundColor: Colors.lightBlue[100],

    // The color scheme.
    colorScheme: const ColorScheme.light(
      primary: Colors.lightBlue,
      onPrimary: Colors.white,
      secondary: Colors.lightBlueAccent,
      onSecondary: Colors.white,
    ),

    // Text constants.
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.lightBlue[500],
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  /// The dark theme.
  static final darkTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    brightness: Brightness.dark,

    // Background color.
    scaffoldBackgroundColor: Colors.blueGrey[900],

    // The color scheme.
    colorScheme: const ColorScheme.dark(
      primary: Colors.lightBlue,
      onPrimary: Colors.white,
      secondary: Colors.lightBlueAccent,
      onSecondary: Colors.white,
    ),

    // Text constants.
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.lightBlue[200],
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
