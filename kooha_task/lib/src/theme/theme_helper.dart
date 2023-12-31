import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blueGray900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray900,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodySmall: TextStyle(
          color: appTheme.deepOrange900,
          fontSize: 12.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 32.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 24.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 10.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 16.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 14.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFF5219),
    primaryContainer: Color(0XFF1A1A1A),
    secondary: Color(0XFF1A1A1A),
    secondaryContainer: Color(0XFF666666),
    tertiary: Color(0XFF1A1A1A),
    tertiaryContainer: Color(0XFF666666),

    // Background colors
    background: Color(0XFF1A1A1A),

    // Surface colors
    surface: Color(0XFF1A1A1A),
    surfaceTint: Color(0XFF141414),
    surfaceVariant: Color(0XFF666666),

    // Error colors
    error: Color(0XFF141414),
    errorContainer: Color(0XFF4C4C4C),
    onError: Color(0XFF7F7F7F),
    onErrorContainer: Color(0XFFFFFFFF),

    // On colors(text colors)
    onBackground: Color(0X6CFF9674),
    onInverseSurface: Color(0XFF7F7F7F),
    onPrimary: Color(0XFF141414),
    onPrimaryContainer: Color(0X6CFF9674),
    onSecondary: Color(0X6CFF9674),
    onSecondaryContainer: Color(0XFF141414),
    onTertiary: Color(0X6CFF9674),
    onTertiaryContainer: Color(0XFF141414),

    // Other colors
    outline: Color(0XFF141414),
    outlineVariant: Color(0XFF1A1A1A),
    scrim: Color(0XFF1A1A1A),
    shadow: Color(0XFF141414),

    // Inverse colors
    inversePrimary: Color(0XFF1A1A1A),
    inverseSurface: Color(0XFF141414),

    // Pending colors
    onSurface: Color(0X6CFF9674),
    onSurfaceVariant: Color(0XFF141414),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amberA700 => Color(0XFFF8A80D);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blackf
  Color get black9007f => Color(0X7F000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFCCCCCC);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF333333);

  // DeepOrange
  Color get deepOrange900 => Color(0XFFB92E00);

  // Gray
  Color get gray100 => Color(0XFFF2F2F2);
  Color get gray400 => Color(0XFFB3B3B3);
  Color get gray500 => Color(0XFFAAAAAA);
  Color get gray50001 => Color(0XFF999999);
  Color get gray800 => Color(0XFF393939);
  Color get gray900 => Color(0XFF553902);
  Color get gray90001 => Color(0XFF5D1700);

  // Green
  Color get green700 => Color(0XFF219653);

  // Lime
  Color get lime900 => Color(0XFFAA7105);

  // Red
  Color get redA700 => Color(0XFFE71212);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
