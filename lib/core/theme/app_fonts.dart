/// Font configuration constants and utilities for the application
/// 
/// This class centralizes font family definitions and provides methods
/// to determine appropriate fonts based on language and content type.
class AppFonts {
  AppFonts._(); // Private constructor to prevent instantiation

  // Font family constants
  static const String primaryFont = 'Exo';
  static const String sinhalaFont = 'NotoSansSinhala';
  
  // Fallback font for system compatibility
  static const String systemFallback = 'SF Pro Display'; // iOS
  static const String androidFallback = 'Roboto'; // Android

  /// Returns the appropriate font family based on text content
  /// 
  /// Automatically detects Sinhala characters and returns the appropriate font.
  /// For mixed content, prioritizes readability by using the primary font
  /// with Sinhala font as fallback in the font stack.
  static String getFontFamily(String? text) {
    if (text == null || text.isEmpty) return primaryFont;
    
    // Check if text contains Sinhala Unicode characters (0D80-0DFF)
    final bool containsSinhala = text.runes.any((rune) => 
        rune >= 0x0D80 && rune <= 0x0DFF);
    
    return containsSinhala ? sinhalaFont : primaryFont;
  }

  /// Returns a font family list with appropriate fallbacks
  /// 
  /// Creates a font stack that ensures proper rendering across different
  /// platforms and languages while maintaining design consistency.
  static List<String> getFontFamilyWithFallbacks(String? text) {
    final primaryFontFamily = getFontFamily(text);
    
    if (primaryFontFamily == sinhalaFont) {
      return [sinhalaFont, primaryFont, systemFallback, androidFallback];
    } else {
      return [primaryFont, sinhalaFont, systemFallback, androidFallback];
    }
  }

  /// Font weight constants for consistent typography
  static const int thin = 100;
  static const int extraLight = 200;
  static const int light = 300;
  static const int regular = 400;
  static const int medium = 500;
  static const int semiBold = 600;
  static const int bold = 700;
  static const int extraBold = 800;
  static const int black = 900;
} 