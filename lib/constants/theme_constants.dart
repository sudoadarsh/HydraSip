part of 'constants.dart';

class ThemeC {
  /// The lightTheme.
  static final lightTheme = ThemeData(
    fontFamily: 'QuickSand',
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
        fontWeight: FontWeight.w800,
      ),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: const TextStyle(color: Colors.black, fontSize: 18.0),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: const TextStyle(color: Colors.black, fontSize: 14.0),
    ),
  );

  /// The dark theme.
  static final darkTheme = ThemeData(
    fontFamily: 'QuickSand',
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
        fontWeight: FontWeight.w800,
      ),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: const TextStyle(color: Colors.white, fontSize: 18.0),
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: const TextStyle(color: Colors.white, fontSize: 14.0),
    ),
  );
}
