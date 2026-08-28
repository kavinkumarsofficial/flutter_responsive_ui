part of 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

/// Initializes responsive state for the current app subtree.
class ResponsiveInit extends StatefulWidget {
  /// Creates an initializer for the package.
  const ResponsiveInit({
    super.key,
    required this.child,
    this.config = const ResponsiveConfig(),
  });

  /// Optional configuration.
  final ResponsiveConfig config;

  /// The application child.
  final Widget child;

  @override
  State<ResponsiveInit> createState() => _ResponsiveInitState();
}

class _ResponsiveInitState extends State<ResponsiveInit>
    with WidgetsBindingObserver {
  ResponsiveInfo? _info;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant ResponsiveInit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config != widget.config && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (identical(Responsive._currentInfo, _info)) {
      Responsive._clearCurrentInfo();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final info = buildResponsiveInfo(
          context,
          widget.config,
          constraints: constraints,
        );
        _info = info;
        Responsive._setCurrentInfo(info);
        return ResponsiveScope(
          info: info,
          child: widget.child,
        );
      },
    );
  }
}
