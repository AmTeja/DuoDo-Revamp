import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodySmallBold =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get bodyMediumBold => Theme.of(this)
      .textTheme
      .bodyMedium
      ?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get bodyLargeBold =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  ThemeData get theme => Theme.of(this);
  ColorScheme get scheme => theme.colorScheme;
}
