import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_widgetbook_app/features/detail/detail_page.dart';
import 'package:poc_widgetbook_app/features/home/home_page.dart';
import 'package:poc_widgetbook_app/features/home/widgets/poc_card.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';
import 'package:poc_widgetbook_app/theme/app_theme.dart';

Widget _wrap() => MaterialApp(
      theme: AppTheme.light(),
      home: const HomePage(),
    );

void main() {
  group('HomePage', () {
    testWidgets('renders AppBar with "POC Dashboard" title', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('POC Dashboard'), findsOneWidget);
    });

    testWidgets('renders a PocCard for each poc item', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.byType(PocCard), findsNWidgets(pocItems.length));
    });

    testWidgets('renders "Use cases" section title', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Use cases'), findsOneWidget);
    });

    testWidgets('renders FAB with "New POC" label', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('New POC'), findsOneWidget);
    });

    testWidgets('renders notification icon button in AppBar', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.byIcon(Icons.notifications_none_rounded), findsOneWidget);
    });

    testWidgets('navigates to DetailPage when a card is tapped', (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.tap(find.byType(PocCard).first);
      await tester.pumpAndSettle();
      expect(find.byType(DetailPage), findsOneWidget);
    });

    testWidgets('DetailPage shows the tapped item title after navigation',
        (tester) async {
      await tester.pumpWidget(_wrap());
      await tester.tap(find.byType(PocCard).first);
      await tester.pumpAndSettle();
      expect(find.text(pocItems.first.title), findsWidgets);
    });
  });
}
