import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_flutter_ui_example/main.dart';

void main() {
  testWidgets('builds the responsive demo app', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Flutter Responsive UI'), findsWidgets);
  });
}
