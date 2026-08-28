part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// A typed device-specific value container.
@immutable
class ResponsiveValue<T> {
  /// Creates a value with mobile, tablet, and desktop branches.
  const ResponsiveValue({
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  /// Mobile value.
  final T mobile;

  /// Tablet value. Falls back to [desktop] when omitted.
  final T? tablet;

  /// Desktop value.
  final T desktop;

  /// Resolves the active value using the current device type.
  T resolve() => Responsive.value(
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
      );
}
