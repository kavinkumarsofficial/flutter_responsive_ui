part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

ResponsivePlatform _resolvePlatform() {
  if (kIsWeb) {
    return ResponsivePlatform.web;
  }

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return ResponsivePlatform.android;
    case TargetPlatform.iOS:
      return ResponsivePlatform.ios;
    case TargetPlatform.macOS:
      return ResponsivePlatform.macos;
    case TargetPlatform.windows:
      return ResponsivePlatform.windows;
    case TargetPlatform.linux:
      return ResponsivePlatform.linux;
    case TargetPlatform.fuchsia:
      return ResponsivePlatform.unknown;
  }
}

FlutterView _viewOf(BuildContext context) {
  return View.maybeOf(context) ??
      WidgetsBinding.instance.platformDispatcher.views.first;
}

MediaQueryData _mediaQueryOf(BuildContext context) {
  return MediaQuery.maybeOf(context) ?? MediaQueryData.fromView(_viewOf(context));
}

double _scaleFrom(
  double value,
  double reference,
  ResponsiveScaleBounds bounds,
) {
  if (reference <= 0) {
    return 1.0;
  }
  return bounds.clamp(value / reference);
}

double _blend(double widthScale, double heightScale, double widthWeight) {
  return widthScale * widthWeight + heightScale * (1 - widthWeight);
}

double _derivedScale({
  required double baseScale,
  required double sensitivity,
  required ResponsiveScaleBounds bounds,
}) {
  return bounds.clamp(1 + (baseScale - 1) * sensitivity);
}

ResponsiveInfo buildResponsiveInfo(
  BuildContext context,
  ResponsiveConfig config, {
  BoxConstraints? constraints,
}) {
  final media = _mediaQueryOf(context);
  final safe = media.padding;
  final screenSize = Size(
    constraints != null && constraints.hasBoundedWidth
        ? constraints.maxWidth
        : media.size.width,
    constraints != null && constraints.hasBoundedHeight
        ? constraints.maxHeight
        : media.size.height,
  );
  final width = (constraints != null && constraints.hasBoundedWidth
          ? constraints.maxWidth
          : math.max(1, screenSize.width - safe.left - safe.right))
      .toDouble();
  final height = (constraints != null && constraints.hasBoundedHeight
          ? constraints.maxHeight
          : math.max(1, screenSize.height - safe.top - safe.bottom))
      .toDouble();
  final availableSize = Size(width, height);
  final widthScale =
      _scaleFrom(width, config.referenceWidth, config.widthScaleBounds);
  final heightScale =
      _scaleFrom(height, config.referenceHeight, config.heightScaleBounds);
  final generalScale = config.generalScaleBounds.clamp(
    _blend(widthScale, heightScale, config.generalWidthWeight),
  );
  final fontScale = _derivedScale(
    baseScale: generalScale,
    sensitivity: config.fontSensitivity,
    bounds: config.fontScaleBounds,
  );
  final radiusScale = _derivedScale(
    baseScale: generalScale,
    sensitivity: config.radiusSensitivity,
    bounds: config.radiusScaleBounds,
  );
  final iconScale = _derivedScale(
    baseScale: generalScale,
    sensitivity: config.iconSensitivity,
    bounds: config.iconScaleBounds,
  );

  return ResponsiveInfo(
    screenSize: screenSize,
    availableSize: availableSize,
    safeTop: safe.top,
    safeBottom: safe.bottom,
    safeLeft: safe.left,
    safeRight: safe.right,
    deviceType: config.breakpoints.deviceTypeForWidth(width),
    platform: _resolvePlatform(),
    orientation: width >= height ? Orientation.landscape : Orientation.portrait,
    config: config,
    widthScale: widthScale,
    heightScale: heightScale,
    fontScale: fontScale,
    radiusScale: radiusScale,
    iconScale: iconScale,
    generalScale: generalScale,
  );
}

ResponsiveInfo buildFallbackResponsiveInfo([
  ResponsiveConfig config = const ResponsiveConfig(),
]) {
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  final media = MediaQueryData.fromView(view);
  final safe = media.padding;
  final screenSize = media.size;
  final width = math.max(1, screenSize.width - safe.left - safe.right).toDouble();
  final height = math.max(1, screenSize.height - safe.top - safe.bottom).toDouble();
  final availableSize = Size(width, height);
  final widthScale =
      _scaleFrom(width, config.referenceWidth, config.widthScaleBounds);
  final heightScale =
      _scaleFrom(height, config.referenceHeight, config.heightScaleBounds);
  final generalScale = config.generalScaleBounds.clamp(
    _blend(widthScale, heightScale, config.generalWidthWeight),
  );

  return ResponsiveInfo(
    screenSize: screenSize,
    availableSize: availableSize,
    safeTop: safe.top,
    safeBottom: safe.bottom,
    safeLeft: safe.left,
    safeRight: safe.right,
    deviceType: config.breakpoints.deviceTypeForWidth(width),
    platform: _resolvePlatform(),
    orientation: width >= height ? Orientation.landscape : Orientation.portrait,
    config: config,
    widthScale: widthScale,
    heightScale: heightScale,
    fontScale: _derivedScale(
      baseScale: generalScale,
      sensitivity: config.fontSensitivity,
      bounds: config.fontScaleBounds,
    ),
    radiusScale: _derivedScale(
      baseScale: generalScale,
      sensitivity: config.radiusSensitivity,
      bounds: config.radiusScaleBounds,
    ),
    iconScale: _derivedScale(
      baseScale: generalScale,
      sensitivity: config.iconSensitivity,
      bounds: config.iconScaleBounds,
    ),
    generalScale: generalScale,
  );
}
