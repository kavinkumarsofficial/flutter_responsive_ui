import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

import 'test_utils.dart';

void main() {
  testWidgets('resolves device-specific values', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(500, 800),
      home: const SizedBox(),
    );

    expect(
      Responsive.value<double>(mobile: 1, tablet: 2, desktop: 3),
      1,
    );
    expect(
      Responsive.when<int>(
        mobile: () => 10,
        tablet: () => 20,
        desktop: () => 30,
      ),
      10,
    );

    await tester.binding.setSurfaceSize(const Size(800, 600));
    await tester.pump();
    expect(
      Responsive.value<double>(mobile: 1, tablet: 2, desktop: 3),
      2,
    );

    await tester.binding.setSurfaceSize(const Size(1300, 800));
    await tester.pump();
    expect(
      Responsive.value<double>(mobile: 1, tablet: 2, desktop: 3),
      3,
    );
  });

  testWidgets('constrains content and adapts grid columns', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(1200, 800),
      home: Column(
        children: [
          ResponsiveContainer(
            maxWidth: 320,
            child: const SizedBox(width: 1000, height: 20),
          ),
          ResponsiveGrid(
            mobileColumns: 1,
            tabletColumns: 2,
            desktopColumns: 4,
            shrinkWrap: true,
            scrollable: false,
            children: const [
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );

    final rendered = tester.getSize(find.byType(SizedBox).first);
    expect(rendered.width, 320);

    final grid = tester.widget<GridView>(find.byType(GridView));
    expect((grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount).crossAxisCount, 4);
  });
}
