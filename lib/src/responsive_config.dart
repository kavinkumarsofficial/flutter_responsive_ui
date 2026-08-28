part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Inclusive lower and upper bounds used to clamp a scale factor.
@immutable
class ResponsiveScaleBounds {
  /// Creates scale bounds.
  const ResponsiveScaleBounds({
    required this.min,
    required this.max,
  }) : assert(min > 0), assert(max >= min);

  /// Minimum allowed scale.
  final double min;

  /// Maximum allowed scale.
  final double max;

  /// Clamps [value] to this range.
  double clamp(double value) => value.clamp(min, max).toDouble();

  /// Creates a copy with overridden values.
  ResponsiveScaleBounds copyWith({
    double? min,
    double? max,
  }) {
    return ResponsiveScaleBounds(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  @override
  int get hashCode => Object.hash(min, max);

  @override
  bool operator ==(Object other) {
    return other is ResponsiveScaleBounds &&
        other.min == min &&
        other.max == max;
  }
}

/// Optional configuration for the responsive engine.
@immutable
class ResponsiveConfig {
  /// Creates a configuration with sensible defaults.
  const ResponsiveConfig({
    this.breakpoints = const ResponsiveBreakpoints(),
    this.referenceWidth = 375,
    this.referenceHeight = 812,
    this.widthScaleBounds = const ResponsiveScaleBounds(min: 0.72, max: 1.35),
    this.heightScaleBounds = const ResponsiveScaleBounds(min: 0.72, max: 1.25),
    this.fontScaleBounds = const ResponsiveScaleBounds(min: 0.90, max: 1.15),
    this.radiusScaleBounds = const ResponsiveScaleBounds(min: 0.85, max: 1.15),
    this.iconScaleBounds = const ResponsiveScaleBounds(min: 0.85, max: 1.20),
    this.generalScaleBounds = const ResponsiveScaleBounds(min: 0.85, max: 1.20),
    this.generalWidthWeight = 0.55,
    this.fontSensitivity = 0.65,
    this.radiusSensitivity = 0.45,
    this.iconSensitivity = 0.50,
  })  : assert(referenceWidth > 0),
        assert(referenceHeight > 0),
        assert(generalWidthWeight >= 0 && generalWidthWeight <= 1),
        assert(fontSensitivity >= 0 && fontSensitivity <= 1),
        assert(radiusSensitivity >= 0 && radiusSensitivity <= 1),
        assert(iconSensitivity >= 0 && iconSensitivity <= 1);

  /// Breakpoints used to classify width-based layouts.
  final ResponsiveBreakpoints breakpoints;

  /// Reference width used to derive bounded width scaling.
  final double referenceWidth;

  /// Reference height used to derive bounded height scaling.
  final double referenceHeight;

  /// Scale limits for width-based dimensions.
  final ResponsiveScaleBounds widthScaleBounds;

  /// Scale limits for height-based dimensions.
  final ResponsiveScaleBounds heightScaleBounds;

  /// Scale limits for fonts.
  final ResponsiveScaleBounds fontScaleBounds;

  /// Scale limits for border radii.
  final ResponsiveScaleBounds radiusScaleBounds;

  /// Scale limits for icons.
  final ResponsiveScaleBounds iconScaleBounds;

  /// Scale limits for the general balanced scale.
  final ResponsiveScaleBounds generalScaleBounds;

  /// Width weight used when blending width and height into a general scale.
  final double generalWidthWeight;

  /// Sensitivity used when deriving font scaling from the general scale.
  final double fontSensitivity;

  /// Sensitivity used when deriving radius scaling from the general scale.
  final double radiusSensitivity;

  /// Sensitivity used when deriving icon scaling from the general scale.
  final double iconSensitivity;

  /// Creates a copy with overridden values.
  ResponsiveConfig copyWith({
    ResponsiveBreakpoints? breakpoints,
    double? referenceWidth,
    double? referenceHeight,
    ResponsiveScaleBounds? widthScaleBounds,
    ResponsiveScaleBounds? heightScaleBounds,
    ResponsiveScaleBounds? fontScaleBounds,
    ResponsiveScaleBounds? radiusScaleBounds,
    ResponsiveScaleBounds? iconScaleBounds,
    ResponsiveScaleBounds? generalScaleBounds,
    double? generalWidthWeight,
    double? fontSensitivity,
    double? radiusSensitivity,
    double? iconSensitivity,
  }) {
    return ResponsiveConfig(
      breakpoints: breakpoints ?? this.breakpoints,
      referenceWidth: referenceWidth ?? this.referenceWidth,
      referenceHeight: referenceHeight ?? this.referenceHeight,
      widthScaleBounds: widthScaleBounds ?? this.widthScaleBounds,
      heightScaleBounds: heightScaleBounds ?? this.heightScaleBounds,
      fontScaleBounds: fontScaleBounds ?? this.fontScaleBounds,
      radiusScaleBounds: radiusScaleBounds ?? this.radiusScaleBounds,
      iconScaleBounds: iconScaleBounds ?? this.iconScaleBounds,
      generalScaleBounds: generalScaleBounds ?? this.generalScaleBounds,
      generalWidthWeight: generalWidthWeight ?? this.generalWidthWeight,
      fontSensitivity: fontSensitivity ?? this.fontSensitivity,
      radiusSensitivity: radiusSensitivity ?? this.radiusSensitivity,
      iconSensitivity: iconSensitivity ?? this.iconSensitivity,
    );
  }

  @override
  int get hashCode => Object.hash(
        breakpoints,
        referenceWidth,
        referenceHeight,
        widthScaleBounds,
        heightScaleBounds,
        fontScaleBounds,
        radiusScaleBounds,
        iconScaleBounds,
        generalScaleBounds,
        generalWidthWeight,
        fontSensitivity,
        radiusSensitivity,
        iconSensitivity,
      );

  @override
  bool operator ==(Object other) {
    return other is ResponsiveConfig &&
        other.breakpoints == breakpoints &&
        other.referenceWidth == referenceWidth &&
        other.referenceHeight == referenceHeight &&
        other.widthScaleBounds == widthScaleBounds &&
        other.heightScaleBounds == heightScaleBounds &&
        other.fontScaleBounds == fontScaleBounds &&
        other.radiusScaleBounds == radiusScaleBounds &&
        other.iconScaleBounds == iconScaleBounds &&
        other.generalScaleBounds == generalScaleBounds &&
        other.generalWidthWeight == generalWidthWeight &&
        other.fontSensitivity == fontSensitivity &&
        other.radiusSensitivity == radiusSensitivity &&
        other.iconSensitivity == iconSensitivity;
  }
}
