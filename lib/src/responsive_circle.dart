part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Responsive circle dimensions.
@immutable
class ResponsiveCircle {
  /// Creates a circle descriptor.
  const ResponsiveCircle({
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  /// Circle width.
  final double width;

  /// Circle height.
  final double height;

  /// Circle border radius.
  final double borderRadius;

  /// Creates a copy with overridden values.
  ResponsiveCircle copyWith({
    double? width,
    double? height,
    double? borderRadius,
  }) {
    return ResponsiveCircle(
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
