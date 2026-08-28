import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

import 'test_utils.dart';

void main() {
  testWidgets('reports the root viewport and bounded scales', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(375, 812),
      home: const SizedBox(),
    );

    expect(Responsive.screenWidth, 375);
    expect(Responsive.screenHeight, 812);
    expect(Responsive.availableWidth, 375);
    expect(Responsive.availableHeight, 812);
    expect(Responsive.widthScale, 1);
    expect(Responsive.heightScale, 1);
    expect(Responsive.fontScale, 1);
    expect(Responsive.radiusScale, 1);
    expect(Responsive.iconScale, 1);
    expect(Responsive.generalScale, 1);
    expect(Responsive.safeTop, 0);
    expect(Responsive.safeBottom, 0);
    expect(Responsive.safeLeft, 0);
    expect(Responsive.safeRight, 0);
    expect(Responsive.circle(50).width, Responsive.circle(50).height);
    expect(Responsive.circle(50).borderRadius, Responsive.circle(50).width / 2);
  });

  testWidgets('scales large viewports without exploding', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(3840, 2160),
      home: const SizedBox(),
    );

    expect(Responsive.isDesktop, isTrue);
    expect(Responsive.widthScale, 1.35);
    expect(Responsive.heightScale, 1.25);
    expect(Responsive.generalScale, 1.2);
    expect(Responsive.width(200), 270);
    expect(Responsive.height(100), 125);
    expect(Responsive.fontSize(16), closeTo(18.08, 0.0001));
    expect(Responsive.radius(12), closeTo(13.08, 0.0001));
    expect(Responsive.iconSize(24), closeTo(26.4, 0.0001));
  });
}
