import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petperfect_exercise/app/app.dart';
import 'package:petperfect_exercise/data/injection/injectable.dart';
import 'package:petperfect_exercise/ui/home/home.dart';

void main() {
  setUp(() {
    configureDependencies();
  });

  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(TickerMode(child: const App(), enabled: false));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
