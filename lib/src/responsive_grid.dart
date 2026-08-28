part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Responsive grid that adapts column count by device type.
class ResponsiveGrid extends StatelessWidget {
  /// Creates a responsive grid.
  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.mobileColumns,
    required this.tabletColumns,
    required this.desktopColumns,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.padding = EdgeInsets.zero,
    this.childAspectRatio = 1,
    this.scrollable = false,
    this.physics,
    this.shrinkWrap = false,
  });

  /// Grid children.
  final List<Widget> children;

  /// Columns for mobile layouts.
  final int mobileColumns;

  /// Columns for tablet layouts.
  final int tabletColumns;

  /// Columns for desktop layouts.
  final int desktopColumns;

  /// Space between columns.
  final double crossAxisSpacing;

  /// Space between rows.
  final double mainAxisSpacing;

  /// Grid padding.
  final EdgeInsetsGeometry padding;

  /// Child aspect ratio.
  final double childAspectRatio;

  /// Whether the grid should scroll.
  final bool scrollable;

  /// Optional custom scroll physics.
  final ScrollPhysics? physics;

  /// Whether the grid should shrink-wrap its contents.
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final effectiveConfig =
        ResponsiveScope.maybeOf(context)?.config ?? Responsive.config;

    return ResponsiveBuilder(
      config: effectiveConfig,
      builder: (context, info) {
        final columns = switch (info.deviceType) {
          DeviceType.mobile => mobileColumns,
          DeviceType.tablet => tabletColumns,
          DeviceType.desktop => desktopColumns,
        }.clamp(1, 100).toInt();

        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
          padding: padding,
          physics: physics ??
              (scrollable ? null : const NeverScrollableScrollPhysics()),
          shrinkWrap: shrinkWrap,
          children: children,
        );
      },
    );
  }
}
