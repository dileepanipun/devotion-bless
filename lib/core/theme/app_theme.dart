import 'package:flutter/material.dart';
import 'app_fonts.dart';
import 'app_text_styles.dart';

/// Application theme configuration
/// 
/// This class provides centralized theme configuration for both light and dark modes.
/// It integrates our custom fonts (Exo and NotoSansSinhala) with Material Design
/// guidelines while maintaining consistency across the application.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  // Color scheme definitions
  static const Color _primaryBlue = Color(0xFF2196F3);
  static const Color _primaryBlueDark = Color(0xFF1976D2);
  static const Color _successGreen = Color(0xFF4CAF50);
  static const Color _warningOrange = Color(0xFFFF9800);
  static const Color _errorRed = Color(0xFFE53935);

  // Light theme colors
  static const Color _lightBackground = Color(0xFFF5F5F5);
  static const Color _lightSurface = Colors.white;
  static const Color _lightOnPrimary = Colors.white;
  static const Color _lightOnSurface = Color(0xFF212121);
  static const Color _lightOnBackground = Color(0xFF212121);

  // Dark theme colors
  static const Color _darkBackground = Color(0xFF0A0A0A);
  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _darkOnPrimary = Colors.white;
  static const Color _darkOnSurface = Colors.white;
  static const Color _darkOnBackground = Colors.white;

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _primaryBlue,
        primaryContainer: Color(0xFFE3F2FD),
        secondary: _successGreen,
        secondaryContainer: Color(0xFFE8F5E8),
        surface: _lightSurface,
        background: _lightBackground,
        error: _errorRed,
        onPrimary: _lightOnPrimary,
        onSecondary: Colors.white,
        onSurface: _lightOnSurface,
        onBackground: _lightOnBackground,
        onError: Colors.white,
      ),
      
      // Typography configuration using our custom fonts
      textTheme: _buildTextTheme(Brightness.light),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: _lightSurface,
        foregroundColor: _lightOnSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.titleLarge(
          color: _lightOnSurface,
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlue,
          foregroundColor: _lightOnPrimary,
          textStyle: AppTextStyles.button(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryBlue,
          textStyle: AppTextStyles.button(color: _primaryBlue),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryBlue,
          side: const BorderSide(color: _primaryBlue),
          textStyle: AppTextStyles.button(color: _primaryBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryBlue),
        ),
        labelStyle: AppTextStyles.bodyMedium(),
        hintStyle: AppTextStyles.bodyMedium(
          color: _lightOnSurface.withValues(alpha: 0.6),
        ),
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _primaryBlue,
        contentTextStyle: AppTextStyles.bodyMedium(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _primaryBlue,
        primaryContainer: Color(0xFF1565C0),
        secondary: _successGreen,
        secondaryContainer: Color(0xFF2E7D32),
        surface: _darkSurface,
        background: _darkBackground,
        error: _errorRed,
        onPrimary: _darkOnPrimary,
        onSecondary: Colors.white,
        onSurface: _darkOnSurface,
        onBackground: _darkOnBackground,
        onError: Colors.white,
      ),
      
      // Typography configuration using our custom fonts
      textTheme: _buildTextTheme(Brightness.dark),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkOnSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.titleLarge(
          color: _darkOnSurface,
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlue,
          foregroundColor: _darkOnPrimary,
          textStyle: AppTextStyles.button(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryBlue,
          textStyle: AppTextStyles.button(color: _primaryBlue),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryBlue,
          side: const BorderSide(color: _primaryBlue),
          textStyle: AppTextStyles.button(color: _primaryBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryBlue),
        ),
        labelStyle: AppTextStyles.bodyMedium(),
        hintStyle: AppTextStyles.bodyMedium(
          color: _darkOnSurface.withValues(alpha: 0.6),
        ),
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _primaryBlue,
        contentTextStyle: AppTextStyles.bodyMedium(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Builds text theme with appropriate colors for the given brightness
  static TextTheme _buildTextTheme(Brightness brightness) {
    final color = brightness == Brightness.light ? _lightOnSurface : _darkOnSurface;
    
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge(color: color),
      displayMedium: AppTextStyles.displayMedium(color: color),
      displaySmall: AppTextStyles.displaySmall(color: color),
      headlineLarge: AppTextStyles.headlineLarge(color: color),
      headlineMedium: AppTextStyles.headlineMedium(color: color),
      headlineSmall: AppTextStyles.headlineSmall(color: color),
      titleLarge: AppTextStyles.titleLarge(color: color),
      titleMedium: AppTextStyles.titleMedium(color: color),
      titleSmall: AppTextStyles.titleSmall(color: color),
      labelLarge: AppTextStyles.labelLarge(color: color),
      labelMedium: AppTextStyles.labelMedium(color: color),
      labelSmall: AppTextStyles.labelSmall(color: color),
      bodyLarge: AppTextStyles.bodyLarge(color: color),
      bodyMedium: AppTextStyles.bodyMedium(color: color),
      bodySmall: AppTextStyles.bodySmall(color: color),
    );
  }

  /// Utility method to get text color based on current theme
  static Color getTextColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? _lightOnSurface : _darkOnSurface;
  }

  /// Utility method to get background color based on current theme
  static Color getBackgroundColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? _lightBackground : _darkBackground;
  }

  /// Utility method to get surface color based on current theme
  static Color getSurfaceColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? _lightSurface : _darkSurface;
  }
} 