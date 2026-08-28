import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

import 'test_utils.dart';

void main() {
  testWidgets('supports decimal responsive extensions', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(375, 812),
      home: const SizedBox(),
    );

    expect(16.5.sp, 16.5);
    expect(200.5.w, 200.5);
    expect(42.7.h, 42.7);
    expect(12.5.r, 12.5);
    expect(24.i, 24);
    expect(20.s, 20);
  });
}
