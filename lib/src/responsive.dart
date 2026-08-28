part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Global accessors and scaling helpers for the current responsive state.
class Responsive {
  Responsive._();

  static ResponsiveInfo? _currentInfo;

  static ResponsiveConfig _currentConfig = const ResponsiveConfig();

  static void _setCurrentInfo(ResponsiveInfo info) {
    _currentInfo = info;
    _currentConfig = info.config;
  }

  static void _clearCurrentInfo() {
    _currentInfo = null;
    _currentConfig = const ResponsiveConfig();
  }

  static ResponsiveInfo get _info =>
      _currentInfo ?? buildFallbackResponsiveInfo(_currentConfig);

  /// Returns the active configuration.
  static ResponsiveConfig get config => _info.config;

  /// Returns the full logical screen width.
  static double get screenWidth => _info.screenWidth;

  /// Returns the full logical screen height.
  static double get screenHeight => _info.screenHeight;

  /// Returns the current available width for layout calculations.
  static double get availableWidth => _info.availableWidth;

  /// Returns the current available height for layout calculations.
  static double get availableHeight => _info.availableHeight;

  /// Returns the safe-area inset at the top.
  static double get safeTop => _info.safeTop;

  /// Returns the safe-area inset at the bottom.
  static double get safeBottom => _info.safeBottom;

  /// Returns the safe-area inset at the left.
  static double get safeLeft => _info.safeLeft;

  /// Returns the safe-area inset at the right.
  static double get safeRight => _info.safeRight;

  /// Returns the current orientation.
  static Orientation get orientation => _info.orientation;

  /// Returns whether the current layout is portrait.
  static bool get isPortrait => _info.isPortrait;

  /// Returns whether the current layout is landscape.
  static bool get isLandscape => _info.isLandscape;

  /// Returns the current device classification.
  static DeviceType get deviceType => _info.deviceType;

  /// Returns whether the current layout is mobile.
  static bool get isMobile => _info.isMobile;

  /// Returns whether the current layout is tablet.
  static bool get isTablet => _info.isTablet;

  /// Returns whether the current layout is desktop.
  static bool get isDesktop => _info.isDesktop;

  /// Returns whether the current platform is web.
  static bool get isWeb => _info.isWeb;

  /// Returns the current platform.
  static ResponsivePlatform get platform => _info.platform;

  /// Returns the mobile breakpoint.
  static double get mobileBreakpoint => _info.mobileBreakpoint;

  /// Returns the tablet breakpoint.
  static double get tabletBreakpoint => _info.tabletBreakpoint;

  /// Returns the current width scale.
  static double get widthScale => _info.widthScale;

  /// Returns the current height scale.
  static double get heightScale => _info.heightScale;

  /// Returns the current font scale.
  static double get fontScale => _info.fontScale;

  /// Returns the current radius scale.
  static double get radiusScale => _info.radiusScale;

  /// Returns the current icon scale.
  static double get iconScale => _info.iconScale;

  /// Returns the current general scale.
  static double get generalScale => _info.generalScale;

  /// Returns the nearest responsive snapshot for [context].
  static ResponsiveInfo of(BuildContext context) => ResponsiveScope.of(context);

  /// Returns the nearest responsive snapshot for [context], if any.
  static ResponsiveInfo? maybeOf(BuildContext context) {
    return ResponsiveScope.maybeOf(context);
  }

  /// Scales a width-sensitive value.
  static double width(num value) => value.toDouble() * _info.widthScale;

  /// Scales a height-sensitive value.
  static double height(num value) => value.toDouble() * _info.heightScale;

  /// Scales a font size conservatively.
  static double fontSize(num value) => value.toDouble() * _info.fontScale;

  /// Scales a border radius moderately.
  static double radius(num value) => value.toDouble() * _info.radiusScale;

  /// Scales an icon size conservatively.
  static double iconSize(num value) => value.toDouble() * _info.iconScale;

  /// Scales a balanced dimension.
  static double scale(num value) => value.toDouble() * _info.generalScale;

  /// Applies moderate scaling around the original [value].
  static double moderateScale(
    num value, {
    double factor = 0.5,
  }) {
    final base = value.toDouble();
    final scaled = scale(base);
    return base + (scaled - base) * factor;
  }

  /// Selects a value by current device type.
  static T value<T>({
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    switch (_info.deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? desktop;
      case DeviceType.desktop:
        return desktop;
    }
  }

  /// Selects a value by current device type using callbacks.
  static T when<T>({
    required T Function() mobile,
    T Function()? tablet,
    required T Function() desktop,
  }) {
    switch (_info.deviceType) {
      case DeviceType.mobile:
        return mobile();
      case DeviceType.tablet:
        return (tablet ?? desktop)();
      case DeviceType.desktop:
        return desktop();
    }
  }

  /// Returns a scaled circle descriptor.
  static ResponsiveCircle circle(num size) {
    final scaled = scale(size);
    return ResponsiveCircle(
      width: scaled,
      height: scaled,
      borderRadius: scaled / 2,
    );
  }
}
