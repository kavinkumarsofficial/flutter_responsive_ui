import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui/responsive_flutter_ui.dart';

import 'test_utils.dart';

void main() {
  testWidgets('classifies widths with default breakpoints', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await pumpResponsiveApp(
      tester,
      surfaceSize: const Size(500, 800),
      home: const SizedBox(),
    );
    expect(Responsive.deviceType, DeviceType.mobile);
    expect(Responsive.isMobile, isTrue);

    await tester.binding.setSurfaceSize(const Size(800, 600));
    await tester.pump();
    expect(Responsive.deviceType, DeviceType.tablet);
    expect(Responsive.isTablet, isTrue);

    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pump();
    expect(Responsive.deviceType, DeviceType.desktop);
    expect(Responsive.isDesktop, isTrue);
  });

  testWidgets('supports custom breakpoints', (tester) async {
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await tester.binding.setSurfaceSize(const Size(650, 800));
    await tester.pumpWidget(
      ResponsiveInit(
        config: const ResponsiveConfig(
          breakpoints: ResponsiveBreakpoints(mobile: 500, tablet: 700),
        ),
        child: const MaterialApp(home: SizedBox()),
      ),
    );
    await tester.pump();

    expect(Responsive.deviceType, DeviceType.tablet);
    expect(Responsive.mobileBreakpoint, 500);
    expect(Responsive.tabletBreakpoint, 700);
  });
}
