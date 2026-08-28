part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Breakpoints used to classify the current available width.
@immutable
class ResponsiveBreakpoints {
  /// Creates a breakpoint set.
  const ResponsiveBreakpoints({
    this.mobile = 600,
    this.tablet = 1024,
  })  : assert(mobile > 0),
        assert(tablet >= mobile);

  /// Maximum width for the mobile layout.
  final double mobile;

  /// Maximum width for the tablet layout.
  final double tablet;

  /// Returns the device type for [width].
  DeviceType deviceTypeForWidth(double width) {
    if (width < mobile) {
      return DeviceType.mobile;
    }
    if (width < tablet) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }

  /// Returns whether [width] should use a mobile layout.
  bool isMobileWidth(double width) => width < mobile;

  /// Returns whether [width] should use a tablet layout.
  bool isTabletWidth(double width) => width >= mobile && width < tablet;

  /// Returns whether [width] should use a desktop layout.
  bool isDesktopWidth(double width) => width >= tablet;

  /// Creates a copy with overridden values.
  ResponsiveBreakpoints copyWith({
    double? mobile,
    double? tablet,
  }) {
    return ResponsiveBreakpoints(
      mobile: mobile ?? this.mobile,
      tablet: tablet ?? this.tablet,
    );
  }

  @override
  int get hashCode => Object.hash(mobile, tablet);

  @override
  bool operator ==(Object other) {
    return other is ResponsiveBreakpoints &&
        other.mobile == mobile &&
        other.tablet == tablet;
  }
}
