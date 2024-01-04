import 'package:flutter/material.dart';
import 'package:sql/helper/theme_type.dart';

ThemeData get theme => AppTheme.theme;

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static ThemeData theme = getTheme();

  static ThemeData getTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }

  static final ThemeData lightTheme = ThemeData();

  static final ThemeData darkTheme = ThemeData();
}
