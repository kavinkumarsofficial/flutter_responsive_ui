import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

Future<void> pumpResponsiveApp(
  WidgetTester tester, {
  required Size surfaceSize,
  required Widget home,
}) async {
  await tester.binding.setSurfaceSize(surfaceSize);
  await tester.pumpWidget(
    ResponsiveInit(
      child: MaterialApp(
        home: Scaffold(
          body: home,
        ),
      ),
    ),
  );
  await tester.pump();
}
