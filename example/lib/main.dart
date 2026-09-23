import 'package:flutter/material.dart';
import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

void main() {
  runApp(
    ResponsiveInit(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Responsive UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ResponsiveDiagnosticScreen(),
    );
  }
}

class ResponsiveDiagnosticScreen extends StatelessWidget {
  const ResponsiveDiagnosticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Responsive UI'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ResponsiveSizes.medium),
          child: Center(
            child: ResponsiveContainer(
              maxWidth: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _HeroCard(),
                  SizedBox(height: 24.h),
                  const _MetricsSection(),
                  SizedBox(height: 24.h),
                  const _ScalingSection(),
                  SizedBox(height: 24.h),
                  const _LayoutSection(),
                  SizedBox(height: 24.h),
                  const _GridSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        final title = Responsive.value(
          mobile: 'Mobile layout',
          tablet: 'Tablet layout',
          desktop: 'Desktop layout',
        );

        return Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: EdgeInsets.all(20.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  '${info.availableWidth.toStringAsFixed(0)} × ${info.availableHeight.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _Badge(text: info.deviceType.name),
                    _Badge(text: info.orientation.name),
                    _Badge(text: info.platform.name),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MetricsSection extends StatelessWidget {
  const _MetricsSection();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      mobileColumns: 1,
      tabletColumns: 2,
      desktopColumns: 3,
      shrinkWrap: true,
      scrollable: false,
      children: [
        _MetricCard(label: 'Available Width', value: Responsive.availableWidth.toStringAsFixed(2)),
        _MetricCard(label: 'Available Height', value: Responsive.availableHeight.toStringAsFixed(2)),
        _MetricCard(label: 'Screen Width', value: Responsive.screenWidth.toStringAsFixed(2)),
        _MetricCard(label: 'Screen Height', value: Responsive.screenHeight.toStringAsFixed(2)),
        _MetricCard(label: 'Device Type', value: Responsive.deviceType.name),
        _MetricCard(label: 'Platform', value: Responsive.platform.name),
        _MetricCard(label: 'Orientation', value: Responsive.orientation.name),
        _MetricCard(label: 'Width Scale', value: Responsive.widthScale.toStringAsFixed(3)),
        _MetricCard(label: 'Height Scale', value: Responsive.heightScale.toStringAsFixed(3)),
        _MetricCard(label: 'Font Scale', value: Responsive.fontScale.toStringAsFixed(3)),
        _MetricCard(label: 'Safe Top', value: Responsive.safeTop.toStringAsFixed(2)),
        _MetricCard(label: 'Safe Bottom', value: Responsive.safeBottom.toStringAsFixed(2)),
        _MetricCard(label: 'Safe Left', value: Responsive.safeLeft.toStringAsFixed(2)),
        _MetricCard(label: 'Safe Right', value: Responsive.safeRight.toStringAsFixed(2)),
      ],
    );
  }
}

class _ScalingSection extends StatelessWidget {
  const _ScalingSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.s),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _ScaleChip(label: '100.w', value: 100.w.toStringAsFixed(2)),
            _ScaleChip(label: '100.h', value: 100.h.toStringAsFixed(2)),
            _ScaleChip(label: '16.sp', value: 16.sp.toStringAsFixed(2)),
            _ScaleChip(label: '12.r', value: 12.r.toStringAsFixed(2)),
            _ScaleChip(label: '24.i', value: 24.i.toStringAsFixed(2)),
            _ScaleChip(label: '20.s', value: 20.s.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}

class _LayoutSection extends StatelessWidget {
  const _LayoutSection();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        final content = switch (info.deviceType) {
          DeviceType.mobile => const _LayoutPreview(
              title: 'Mobile layout',
              description: 'Single-column, compact spacing, bottom-navigation friendly.',
            ),
          DeviceType.tablet => const _LayoutPreview(
              title: 'Tablet layout',
              description: 'Two-column layouts, larger spacing, adaptive navigation.',
            ),
          DeviceType.desktop => const _LayoutPreview(
              title: 'Desktop layout',
              description: 'Sidebar-friendly, multi-column, max-width content.',
            ),
        };

        return content;
      },
    );
  }
}

class _GridSection extends StatelessWidget {
  const _GridSection();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      mobileColumns: 1,
      tabletColumns: 2,
      desktopColumns: 4,
      shrinkWrap: true,
      scrollable: false,
      children: List.generate(
        8,
        (index) => Card(
          child: SizedBox(
            height: 120.h,
            child: Center(
              child: Text(
                'Card ${index + 1}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            SizedBox(height: 8.h),
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}

class _ScaleChip extends StatelessWidget {
  const _ScaleChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label = $value'),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(text));
  }
}

class _LayoutPreview extends StatelessWidget {
  const _LayoutPreview({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8.h),
            Text(description),
          ],
        ),
      ),
    );
  }
}
