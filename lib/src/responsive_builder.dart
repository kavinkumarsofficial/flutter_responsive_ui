part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Signature used by [ResponsiveBuilder].
typedef ResponsiveLayoutBuilder = Widget Function(
  BuildContext context,
  ResponsiveInfo info,
);

/// Rebuilds with the current available layout constraints.
class ResponsiveBuilder extends StatelessWidget {
  /// Creates a responsive builder.
  const ResponsiveBuilder({
    super.key,
    required this.builder,
    this.config,
  });

  /// Optional configuration override.
  final ResponsiveConfig? config;

  /// Called with the current responsive snapshot.
  final ResponsiveLayoutBuilder builder;

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = config ?? ResponsiveScope.maybeOf(context)?.config ?? Responsive.config;
    return LayoutBuilder(
      builder: (context, constraints) {
        final info = buildResponsiveInfo(
          context,
          effectiveConfig,
          constraints: constraints,
        );
        return builder(context, info);
      },
    );
  }
}
