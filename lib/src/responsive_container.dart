part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Centers content and constrains the maximum width.
class ResponsiveContainer extends StatelessWidget {
  /// Creates a responsive container.
  const ResponsiveContainer({
    super.key,
    required this.maxWidth,
    required this.child,
    this.alignment = Alignment.center,
    this.padding,
  });

  /// Maximum content width.
  final double maxWidth;

  /// Child content.
  final Widget child;

  /// Alignment inside the constrained area.
  final AlignmentGeometry alignment;

  /// Optional outer padding.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget content = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Align(alignment: alignment, child: child),
    );

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    return Center(child: content);
  }
}
