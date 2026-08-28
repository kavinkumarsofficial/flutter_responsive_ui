import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

import 'test_utils.dart';

void main() {
  testWidgets('updates orientation and layout class on resize', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(500, 800),
      home: ResponsiveBuilder(
        builder: (context, info) {
          return Text(
            '${info.deviceType.name}:${info.orientation.name}',
            textDirection: TextDirection.ltr,
          );
        },
      ),
    );

    expect(find.text('mobile:portrait'), findsOneWidget);

    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pump();

    expect(find.text('desktop:landscape'), findsOneWidget);
  });
}
