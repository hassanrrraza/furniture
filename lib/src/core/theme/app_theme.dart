import 'package:flutter/material.dart';

/// Primary color palette
const Color primaryColor = Color(0xFF007A73); // Example: A teal variant
const Color accentColor = Color(0xFFFFAB00); // Example: Amber
const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);
const Color appBarColor = primaryColor;
const Color textColor = Color(0xFF333333);

/// Surface colors
const Color cardColor = Colors.white;
const Color surfaceColor = Colors.white;

/// Text colors
const Color onPrimaryColor = Colors.white;
const Color primaryTextColor = Color(0xFF293241); // Dark blue-gray
const Color secondaryTextColor = Color(0xFF6C757D); // Medium gray
const Color captionTextColor = Color(0xFF8D99AE); // Light gray

/// UI element colors
const Color inputBackgroundColor =
    Color(0xFFF1F3F5); // Light gray for input fields
const Color inputBorderColor = Color(0xFFDEE2E6); // Border for input fields
const Color inputFocusedBorderColor = primaryColor;
const Color dividerColor = Color(0xFFE9ECEF); // Very light gray

/// Feedback colors
const Color successColor = Color(0xFF40916C); // Green
const Color errorColor = Color(0xFFD62828); // Red
const Color warningColor = Color(0xFFF8961E); // Orange
const Color infoColor = Color(0xFF457B9D); // Blue

/// Shadow elevation system
class AppElevation {
  /// No elevation - flat surface
  static const List<BoxShadow> none = [];

  /// Subtle elevation - for cards, slightly raised surfaces
  static const List<BoxShadow> low = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity black
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  /// Medium elevation - for floating action buttons, dialogs
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1F000000), // 12% opacity black
      blurRadius: 8,
      offset: Offset(0, 3),
    ),
  ];

  /// High elevation - for app bars, navigational elements, modals
  static const List<BoxShadow> high = [
    BoxShadow(
      color: Color(0x29000000), // 16% opacity black
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];
}

/// Border radius system
class AppRadius {
  static const double small = 4.0;
  static const double medium = 8.0;
  static const double large = 16.0;
  static const double extraLarge = 24.0;
}

/// Animation durations
class AppAnimation {
  static const Duration short = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration long = Duration(milliseconds: 500);
}

/// App theme data
ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: appBarColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: textColor, fontSize: 16.0),
    bodyMedium: TextStyle(color: textColor.withOpacity(0.8), fontSize: 14.0),
    headlineSmall:
        TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge:
        TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w600),
    // Add other basic text styles if needed from your original theme
  ),
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: accentColor,
    surface: Colors.white,
    background: scaffoldBackgroundColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: textColor,
    onBackground: textColor,
    error: Colors.red,
    onError: Colors.white,
  ),
  // Add other theme properties like buttonTheme, cardTheme from your simple theme if necessary
);
