import 'package:flutter/material.dart';

import '../../../view/_product/constants/app_constants.dart';
import 'app_theme.dart';
// ignore: unused_import
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  // @override
  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        scaffoldBackgroundColor: _appColorScheme.primary, //xx
      );

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight!.white, //xx
      secondary: colorSchemeLight!.black, //xx
      background: const Color(0xffF6ECDD), //xx
      surface: const Color(0xffEDEEED), //xx
      onSurface: const Color(0xff9DA1A0), //xx
      onPrimary: const Color(0xffE7F1EE), //xx
      onSecondary: const Color(0xff1A2321), //xx
      brightness: Brightness.light,
      error: Colors.red.shade900,
      onBackground: const Color(0xff004834), //xx
      onError: const Color(0xffffc93c),
      primaryContainer: colorSchemeLight!.burgundy, //xx
      onPrimaryContainer: const Color(0xff0BCE63),
      secondaryContainer: const Color(0xffF9F9F9), //xx
      shadow: const Color(0xffF4EBED),
    );
  }
}
