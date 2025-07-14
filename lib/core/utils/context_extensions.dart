import 'package:flutter/material.dart';
import 'package:pokemon_app/theme/theme.dart';

extension ContextThemeX on BuildContext {
  // Base theme data
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textStyles => theme.textTheme;

  // Custom AppColors
  Color get seed => AppColors.seed;
  Color get primaryBlue => AppColors.primaryBlue;
  Color get primaryYellow => AppColors.primaryYellow;
  Color get darkText => AppColors.darkText;
  Color get lightGray => AppColors.lightGray;

  // Frequently used text styles
  TextStyle get displayLarge => textStyles.displayLarge!;
  TextStyle get headlineSmall => textStyles.headlineSmall!;
  TextStyle get titleLarge => textStyles.titleLarge!;
  TextStyle get titleMedium => textStyles.titleMedium!;
  TextStyle get bodyLarge => textStyles.bodyLarge!;
  TextStyle get bodyMedium => textStyles.bodyMedium!;
  TextStyle get bodySmall => textStyles.bodySmall!;
  TextStyle get labelLarge => textStyles.labelLarge!;
  TextStyle get labelSmall => textStyles.labelSmall!;
}
