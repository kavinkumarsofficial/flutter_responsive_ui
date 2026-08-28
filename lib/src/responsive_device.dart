part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// The coarse layout class derived from the current available width.
enum DeviceType {
  /// Compact layouts for phones and narrow viewports.
  mobile,

  /// Mid-sized layouts for tablets and large portrait phones.
  tablet,

  /// Expanded layouts for desktop and wide web viewports.
  desktop,
}

/// Platform information that is safe to use on all Flutter targets.
enum ResponsivePlatform {
  android,
  ios,
  web,
  windows,
  macos,
  linux,
  unknown,
}
