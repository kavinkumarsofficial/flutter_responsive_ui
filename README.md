# Flutter Responsive UI

`flutter_responsive_ui` is a Flutter package for bounded responsive scaling and layout adaptation across mobile, tablet, web, and desktop.

## Features

- Automatic initialization: `ResponsiveInit(child: const MyApp())`
- Responsive scaling for width, height, font size, radius, icon size, and general dimensions
- Responsive layout helpers for mobile, tablet, and desktop
- Width-based device classification with configurable breakpoints
- Web and desktop resize support
- Safe-area aware sizing
- `ResponsiveBuilder`, `ResponsiveContainer`, `ResponsiveGrid`, `ResponsiveValue`, `ResponsiveTokens`, and `ResponsiveCircle`

## Supported platforms

- Android
- iOS
- Web
- Windows
- macOS
- Linux

## Installation

```yaml
dependencies:
  flutter_responsive_ui: ^0.1.0
```

## Basic initialization

```dart
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';

void main() {
  runApp(
    ResponsiveInit(
      child: const MyApp(),
    ),
  );
}
```

No `designWidth`, `designHeight`, or fixed 375 x 812 setup is required.

## Scaling vs layout

Scaling changes dimensions:

- `16.sp`
- `20.w`
- `20.h`
- `12.r`
- `24.i`

Layout adaptation changes structure:

- `ResponsiveBuilder`
- `Responsive.value`
- `ResponsiveGrid`
- `ResponsiveContainer`

## Responsive extensions

```dart
Container(
  width: 200.w,
  height: 100.h,
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
  ),
  child: Text(
    'Dashboard',
    style: TextStyle(fontSize: 18.sp),
  ),
);
```

## Direct API

```dart
final width = Responsive.width(200);
final height = Responsive.height(100);
final font = Responsive.fontSize(18);
final radius = Responsive.radius(12);
final icon = Responsive.iconSize(24);
final general = Responsive.scale(20);
final moderate = Responsive.moderateScale(20);
```

## Device detection

```dart
if (Responsive.isMobile) {
  // mobile
}

if (Responsive.isTablet) {
  // tablet
}

if (Responsive.isDesktop) {
  // desktop
}
```

Current classification is based primarily on available width:

- Mobile: `< 600`
- Tablet: `600 - 1023`
- Desktop: `>= 1024`

## Breakpoints

Override breakpoints with `ResponsiveConfig`:

```dart
ResponsiveInit(
  config: const ResponsiveConfig(
    breakpoints: ResponsiveBreakpoints(mobile: 560, tablet: 960),
  ),
  child: const MyApp(),
)
```

## ResponsiveBuilder

```dart
ResponsiveBuilder(
  builder: (context, info) {
    if (info.isMobile) {
      return const MobileLayout();
    }
    if (info.isTablet) {
      return const TabletLayout();
    }
    return const DesktopLayout();
  },
)
```

`info.width` and `info.height` refer to the current available layout size.

## Screen size vs available size

- `Responsive.screenWidth` / `Responsive.screenHeight`: the full logical window or viewport size.
- `Responsive.availableWidth` / `Responsive.availableHeight`: the usable layout size after constraints and safe-area insets.
- `Responsive.safeTop` / `Responsive.safeBottom` / `Responsive.safeLeft` / `Responsive.safeRight`: safe-area insets only.

## ResponsiveValue

```dart
final padding = Responsive.value(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
);
```

Or:

```dart
final titleSize = Responsive.when(
  mobile: () => 18.sp,
  tablet: () => 22.sp,
  desktop: () => 26.sp,
);
```

## ResponsiveContainer

```dart
Center(
  child: ResponsiveContainer(
    maxWidth: 1200,
    child: const DashboardScreen(),
  ),
);
```

## ResponsiveGrid

```dart
ResponsiveGrid(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 4,
  children: const [
    Card(child: SizedBox(height: 120)),
    Card(child: SizedBox(height: 120)),
  ],
)
```

## Safe areas

Use:

- `Responsive.safeTop`
- `Responsive.safeBottom`
- `Responsive.safeLeft`
- `Responsive.safeRight`

## Orientation

Use:

- `Responsive.orientation`
- `Responsive.isPortrait`
- `Responsive.isLandscape`

## Web and desktop resizing

The responsive snapshot updates when the browser viewport or desktop window changes size. Nested widgets can use `ResponsiveBuilder` to react to their current constraints instead of only the root window.

## Scaling formulas

The package uses bounded scaling:

1. Width scale = available width / reference width, then clamped.
2. Height scale = available height / reference height, then clamped.
3. General scale = weighted blend of width and height scales, then clamped.
4. Font, radius, and icon scaling are derived from the general scale with conservative sensitivities and separate bounds.

This avoids extreme growth on large monitors and keeps text, icons, and radii sensible on desktop and web.

## Best practices

- Use `.sp` for text.
- Use `.w` and `.h` for spacing and dimensions.
- Use `ResponsiveBuilder` for layout structure changes.
- Use `ResponsiveContainer` to prevent wide desktop layouts from stretching too far.

## Common mistakes

- Do not scale everything with a raw `screenWidth / 375` multiplier.
- Do not treat desktop as a larger mobile screen.
- Do not use global screen width when a nested widget only has a small local width.

## Example app

Run the demo:

```bash
flutter pub get
flutter run -d chrome
```

The example screen shows live responsive metrics, scaling values, safe-area values, and mobile/tablet/desktop layout changes.

## Testing

Run:

```bash
flutter analyze
flutter test
```

## Publishing to pub.dev

Before publishing, verify:

```bash
flutter pub get
flutter analyze
flutter test
dart pub publish --dry-run
dart pub publish
```

Make sure the analyzer is clean, tests pass, the example runs, and the pubspec metadata is ready for pub.dev.
