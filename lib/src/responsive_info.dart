part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Immutable snapshot of the current responsive state.
@immutable
class ResponsiveInfo {
  /// Creates a responsive snapshot.
  const ResponsiveInfo({
    required this.screenSize,
    required this.availableSize,
    required this.safeTop,
    required this.safeBottom,
    required this.safeLeft,
    required this.safeRight,
    required this.deviceType,
    required this.platform,
    required this.orientation,
    required this.config,
    required this.widthScale,
    required this.heightScale,
    required this.fontScale,
    required this.radiusScale,
    required this.iconScale,
    required this.generalScale,
  });

  /// Full logical screen/window size.
  final Size screenSize;

  /// Available layout size after constraints and safe-area insets.
  final Size availableSize;

  /// Safe-area inset on the top edge.
  final double safeTop;

  /// Safe-area inset on the bottom edge.
  final double safeBottom;

  /// Safe-area inset on the left edge.
  final double safeLeft;

  /// Safe-area inset on the right edge.
  final double safeRight;

  /// The current layout class.
  final DeviceType deviceType;

  /// The current platform.
  final ResponsivePlatform platform;

  /// The current orientation.
  final Orientation orientation;

  /// The active configuration.
  final ResponsiveConfig config;

  /// The bounded width scale.
  final double widthScale;

  /// The bounded height scale.
  final double heightScale;

  /// The conservative font scale.
  final double fontScale;

  /// The moderate radius scale.
  final double radiusScale;

  /// The conservative icon scale.
  final double iconScale;

  /// The balanced general scale.
  final double generalScale;

  /// Logical screen width.
  double get screenWidth => screenSize.width;

  /// Logical screen height.
  double get screenHeight => screenSize.height;

  /// Available layout width.
  double get availableWidth => availableSize.width;

  /// Available layout height.
  double get availableHeight => availableSize.height;

  /// Alias for [availableWidth].
  double get width => availableWidth;

  /// Alias for [availableHeight].
  double get height => availableHeight;

  /// Returns the mobile breakpoint.
  double get mobileBreakpoint => config.breakpoints.mobile;

  /// Returns the tablet breakpoint.
  double get tabletBreakpoint => config.breakpoints.tablet;

  /// Whether the current layout is mobile.
  bool get isMobile => deviceType == DeviceType.mobile;

  /// Whether the current layout is tablet.
  bool get isTablet => deviceType == DeviceType.tablet;

  /// Whether the current layout is desktop.
  bool get isDesktop => deviceType == DeviceType.desktop;

  /// Whether the current platform is web.
  bool get isWeb => platform == ResponsivePlatform.web;

  /// Whether the current orientation is portrait.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Whether the current orientation is landscape.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns a copy with overridden values.
  ResponsiveInfo copyWith({
    Size? screenSize,
    Size? availableSize,
    double? safeTop,
    double? safeBottom,
    double? safeLeft,
    double? safeRight,
    DeviceType? deviceType,
    ResponsivePlatform? platform,
    Orientation? orientation,
    ResponsiveConfig? config,
    double? widthScale,
    double? heightScale,
    double? fontScale,
    double? radiusScale,
    double? iconScale,
    double? generalScale,
  }) {
    return ResponsiveInfo(
      screenSize: screenSize ?? this.screenSize,
      availableSize: availableSize ?? this.availableSize,
      safeTop: safeTop ?? this.safeTop,
      safeBottom: safeBottom ?? this.safeBottom,
      safeLeft: safeLeft ?? this.safeLeft,
      safeRight: safeRight ?? this.safeRight,
      deviceType: deviceType ?? this.deviceType,
      platform: platform ?? this.platform,
      orientation: orientation ?? this.orientation,
      config: config ?? this.config,
      widthScale: widthScale ?? this.widthScale,
      heightScale: heightScale ?? this.heightScale,
      fontScale: fontScale ?? this.fontScale,
      radiusScale: radiusScale ?? this.radiusScale,
      iconScale: iconScale ?? this.iconScale,
      generalScale: generalScale ?? this.generalScale,
    );
  }

  @override
  int get hashCode => Object.hash(
        screenSize,
        availableSize,
        safeTop,
        safeBottom,
        safeLeft,
        safeRight,
        deviceType,
        platform,
        orientation,
        config,
        widthScale,
        heightScale,
        fontScale,
        radiusScale,
        iconScale,
        generalScale,
      );

  @override
  bool operator ==(Object other) {
    return other is ResponsiveInfo &&
        other.screenSize == screenSize &&
        other.availableSize == availableSize &&
        other.safeTop == safeTop &&
        other.safeBottom == safeBottom &&
        other.safeLeft == safeLeft &&
        other.safeRight == safeRight &&
        other.deviceType == deviceType &&
        other.platform == platform &&
        other.orientation == orientation &&
        other.config == config &&
        other.widthScale == widthScale &&
        other.heightScale == heightScale &&
        other.fontScale == fontScale &&
        other.radiusScale == radiusScale &&
        other.iconScale == iconScale &&
        other.generalScale == generalScale;
  }
}
