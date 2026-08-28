part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Num extensions for the primary responsive API.
extension ResponsiveNumExtension on num {
  /// Responsive width.
  double get w => Responsive.width(this);

  /// Responsive height.
  double get h => Responsive.height(this);

  /// Responsive font size.
  double get sp => Responsive.fontSize(this);

  /// Responsive border radius.
  double get r => Responsive.radius(this);

  /// Responsive icon size.
  double get i => Responsive.iconSize(this);

  /// Responsive general scale.
  double get s => Responsive.scale(this);
}
