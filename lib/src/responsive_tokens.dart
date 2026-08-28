part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Optional spacing, typography, and radius tokens.
class ResponsiveTokens {
  ResponsiveTokens._();

  /// Extra-small spacing.
  static double get xs => 4.w;

  /// Small spacing.
  static double get sm => 8.w;

  /// Medium spacing.
  static double get md => 16.w;

  /// Large spacing.
  static double get lg => 24.w;

  /// Extra-large spacing.
  static double get xl => 32.w;

  /// Title text size.
  static double get title => 24.sp;

  /// Body text size.
  static double get body => 16.sp;

  /// Small radius.
  static double get radiusSmall => 8.r;

  /// Medium radius.
  static double get radiusMedium => 12.r;

  /// Small icon.
  static double get iconSmall => 16.i;

  /// Medium icon.
  static double get iconMedium => 24.i;
}
