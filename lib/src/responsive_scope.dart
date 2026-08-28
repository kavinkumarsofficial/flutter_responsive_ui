part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Provides the current responsive snapshot to descendants.
@immutable
class ResponsiveScope extends InheritedWidget {
  /// Creates a scope for [info].
  const ResponsiveScope({
    super.key,
    required this.info,
    required super.child,
  });

  /// The current responsive snapshot.
  final ResponsiveInfo info;

  /// Returns the nearest responsive snapshot.
  static ResponsiveInfo of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ResponsiveScope>();
    assert(scope != null, 'No ResponsiveScope found in context.');
    return scope!.info;
  }

  /// Returns the nearest responsive snapshot, if any.
  static ResponsiveInfo? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveScope>()?.info;
  }

  @override
  bool updateShouldNotify(ResponsiveScope oldWidget) => oldWidget.info != info;
}
