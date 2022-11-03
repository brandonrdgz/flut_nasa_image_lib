import 'package:flutter/material.dart';

class AppColors {
  // Material You (Material 3) colors

  // Light Colors
  static const Color lightPrimary = Color(0xFF345AB0);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFDAE2FF);
  static const Color lightOnPrimaryContainer = Color(0xFF001847);
  static const Color lightSecondary = Color(0xFF3F5AA9);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightSecondaryContainer = Color(0xFFDBE1FF);
  static const Color lightOnSecondaryContainer = Color(0xFF00174C);
  static const Color lightTertiary = Color(0xFFB22A26);
  static const Color lightOnTertiary = Color(0xFFFFFFFF);
  static const Color lightTertiaryContainer = Color(0xFFFFDAD6);
  static const Color lightOnTertiaryContainer = Color(0xFF410002);
  static const Color lightError = Color(0xFFBA1A1A);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightOnErrorContainer = Color(0xFF410002);
  static const Color lightBackground = Color(0xFFFDFBFF);
  static const Color lightOnBackground = Color(0xFF001B3F);
  static const Color lightSurface = Color(0xFFFDFBFF);
  static const Color lightOnSurface = Color(0xFF001B3F);
  static const Color lightSurfaceVariant = Color(0xFFE1E2EC);
  static const Color lightOnSurfaceVariant = Color(0xFF45464F);
  static const Color lightOutline = Color(0xFF757780);
  static const Color lightOnInverseSurface = Color(0xFFECF0FF);
  static const Color lightInverseSurface = Color(0xFF002F65);
  static const Color lightInversePrimary = Color(0xFFB2C5FF);
  static const Color lightShadow = Color(0xFF000000);
  static const Color lightSurfaceTint = Color(0xFF345AB0);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightPrimary,
    onPrimary: lightOnPrimary,
    primaryContainer: lightPrimaryContainer,
    onPrimaryContainer: lightOnPrimaryContainer,
    secondary: lightSecondary,
    onSecondary: lightOnSecondary,
    secondaryContainer: lightSecondaryContainer,
    onSecondaryContainer: lightOnSecondaryContainer,
    tertiary: lightTertiary,
    onTertiary: lightOnTertiary,
    tertiaryContainer: lightTertiaryContainer,
    onTertiaryContainer: lightOnTertiaryContainer,
    error: lightError,
    errorContainer: lightErrorContainer,
    onError: lightOnError,
    onErrorContainer: lightOnErrorContainer,
    background: lightBackground,
    onBackground: lightOnBackground,
    surface: lightSurface,
    onSurface: lightOnSurface,
    surfaceVariant: lightSurfaceVariant,
    onSurfaceVariant: lightOnSurfaceVariant,
    outline: lightOutline,
    onInverseSurface: lightOnInverseSurface,
    inverseSurface: lightInverseSurface,
    inversePrimary: lightInversePrimary,
    shadow: lightShadow,
    surfaceTint: lightSurfaceTint
  );

  // Dark Colors
  static const Color darkPrimary = Color(0xFFB2C5FF);
  static const Color darkOnPrimary = Color(0xFF002C72);
  static const Color darkPrimaryContainer = Color(0xFF154297);
  static const Color darkOnPrimaryContainer = Color(0xFFDAE2FF);
  static const Color darkSecondary = Color(0xFFB4C5FF);
  static const Color darkOnSecondary = Color(0xFF022978);
  static const Color darkSecondaryContainer = Color(0xFF244290);
  static const Color darkOnSecondaryContainer = Color(0xFFDBE1FF);
  static const Color darkTertiary = Color(0xFFFFB4AB);
  static const Color darkOnTertiary = Color(0xFF690006);
  static const Color darkTertiaryContainer = Color(0xFF900E11);
  static const Color darkOnTertiaryContainer = Color(0xFFFFDAD6);
  static const Color darkError = Color(0xFFFFB4AB);
  static const Color darkErrorContainer = Color(0xFF93000A);
  static const Color darkOnError = Color(0xFF690005);
  static const Color darkOnErrorContainer = Color(0xFFFFDAD6);
  static const Color darkBackground = Color(0xFF001B3F);
  static const Color darkOnBackground = Color(0xFFD7E3FF);
  static const Color darkSurface = Color(0xFF001B3F);
  static const Color darkOnSurface = Color(0xFFD7E3FF);
  static const Color darkSurfaceVariant = Color(0xFF45464F);
  static const Color darkOnSurfaceVariant = Color(0xFFC5C6D0);
  static const Color darkOutline = Color(0xFF8F909A);
  static const Color darkOnInverseSurface = Color(0xFF001B3F);
  static const Color darkInverseSurface = Color(0xFFD7E3FF);
  static const Color darkInversePrimary = Color(0xFF345AB0);
  static const Color darkShadow = Color(0xFF000000);
  static const Color darkSurfaceTint = Color(0xFFB2C5FF);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    primaryContainer: darkPrimaryContainer,
    onPrimaryContainer: darkOnPrimaryContainer,
    secondary: darkSecondary,
    onSecondary: darkOnSecondary,
    secondaryContainer: darkSecondaryContainer,
    onSecondaryContainer: darkOnSecondaryContainer,
    tertiary: darkTertiary,
    onTertiary: darkOnTertiary,
    tertiaryContainer: darkTertiaryContainer,
    onTertiaryContainer: darkOnTertiaryContainer,
    error: darkError,
    errorContainer: darkErrorContainer,
    onError: darkOnError,
    onErrorContainer: darkOnErrorContainer,
    background: darkBackground,
    onBackground: darkOnBackground,
    surface: darkSurface,
    onSurface: darkOnSurface,
    surfaceVariant: darkSurfaceVariant,
    onSurfaceVariant: darkOnSurfaceVariant,
    outline: darkOutline,
    onInverseSurface: darkOnInverseSurface,
    inverseSurface: darkInverseSurface,
    inversePrimary: darkInversePrimary,
    shadow: darkShadow,
    surfaceTint: darkSurfaceTint,
  );

  static const Color error = Colors.red;
  static const Color favoriteButton = error;
  static final Color imageGalleryOverlayBackground = Colors.black.withAlpha(50);
  static const Color imageGalleryOverlayText = Colors.white;
}