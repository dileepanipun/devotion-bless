import 'package:flutter/material.dart';
import 'app_fonts.dart';

/// Centralized text styles configuration for the application
/// 
/// This class provides predefined text styles that follow Material Design
/// typography guidelines while incorporating our custom font families.
/// All text styles support both English (Exo) and Sinhala (NotoSansSinhala) fonts.
class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  // Base text style that can be customized
  static TextStyle _baseStyle({
    required double fontSize,
    required int fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    String? text,
  }) {
    return TextStyle(
      fontFamily: AppFonts.getFontFamily(text),
      fontFamilyFallback: AppFonts.getFontFamilyWithFallbacks(text),
      fontSize: fontSize,
      fontWeight: FontWeight.w400, // Variable fonts handle weight dynamically
      fontVariations: [FontVariation('wght', fontWeight.toDouble())],
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display styles - Large headlines and hero text
  static TextStyle displayLarge({Color? color, String? text}) => _baseStyle(
    fontSize: 57,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.12,
    letterSpacing: -0.25,
    text: text,
  );

  static TextStyle displayMedium({Color? color, String? text}) => _baseStyle(
    fontSize: 45,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.16,
    text: text,
  );

  static TextStyle displaySmall({Color? color, String? text}) => _baseStyle(
    fontSize: 36,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.22,
    text: text,
  );

  // Headline styles - Section headers and important titles
  static TextStyle headlineLarge({Color? color, String? text}) => _baseStyle(
    fontSize: 32,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.25,
    text: text,
  );

  static TextStyle headlineMedium({Color? color, String? text}) => _baseStyle(
    fontSize: 28,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.29,
    text: text,
  );

  static TextStyle headlineSmall({Color? color, String? text}) => _baseStyle(
    fontSize: 24,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.33,
    text: text,
  );

  // Title styles - Card titles, dialog headers
  static TextStyle titleLarge({Color? color, String? text}) => _baseStyle(
    fontSize: 22,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.27,
    text: text,
  );

  static TextStyle titleMedium({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.5,
    letterSpacing: 0.15,
    text: text,
  );

  static TextStyle titleSmall({Color? color, String? text}) => _baseStyle(
    fontSize: 14,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.43,
    letterSpacing: 0.1,
    text: text,
  );

  // Label styles - Buttons, tabs, form labels
  static TextStyle labelLarge({Color? color, String? text}) => _baseStyle(
    fontSize: 14,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.43,
    letterSpacing: 0.1,
    text: text,
  );

  static TextStyle labelMedium({Color? color, String? text}) => _baseStyle(
    fontSize: 12,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.33,
    letterSpacing: 0.5,
    text: text,
  );

  static TextStyle labelSmall({Color? color, String? text}) => _baseStyle(
    fontSize: 11,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.45,
    letterSpacing: 0.5,
    text: text,
  );

  // Body styles - Regular content text
  static TextStyle bodyLarge({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.5,
    letterSpacing: 0.15,
    text: text,
  );

  static TextStyle bodyMedium({Color? color, String? text}) => _baseStyle(
    fontSize: 14,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.43,
    letterSpacing: 0.25,
    text: text,
  );

  static TextStyle bodySmall({Color? color, String? text}) => _baseStyle(
    fontSize: 12,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.33,
    letterSpacing: 0.4,
    text: text,
  );

  // Custom app-specific styles
  
  /// Style for Bible verse text with enhanced readability
  static TextStyle bibleVerse({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.6, // Increased line height for better readability
    letterSpacing: 0.15,
    text: text,
  );

  /// Style for Bible verse references
  static TextStyle bibleReference({Color? color, String? text}) => _baseStyle(
    fontSize: 14,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.43,
    text: text,
  );

  /// Style for user greeting text
  static TextStyle greeting({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.25,
    text: text,
  );

  /// Style for user name display
  static TextStyle userName({Color? color, String? text}) => _baseStyle(
    fontSize: 20,
    fontWeight: AppFonts.bold,
    color: color,
    height: 1.2,
    text: text,
  );

  /// Style for prayer card titles
  static TextStyle prayerTitle({Color? color, String? text}) => _baseStyle(
    fontSize: 18,
    fontWeight: AppFonts.bold,
    color: color,
    height: 1.22,
    text: text,
  );

  /// Style for prayer descriptions
  static TextStyle prayerDescription({Color? color, String? text}) => _baseStyle(
    fontSize: 14,
    fontWeight: AppFonts.regular,
    color: color,
    height: 1.43,
    text: text,
  );

  /// Style for section headers with decorative lines
  static TextStyle sectionHeader({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.medium,
    color: color,
    height: 1.25,
    text: text,
  );

  /// Style for button text
  static TextStyle button({Color? color, String? text}) => _baseStyle(
    fontSize: 16,
    fontWeight: AppFonts.semiBold,
    color: color,
    height: 1.25,
    letterSpacing: 0.1,
    text: text,
  );
} 