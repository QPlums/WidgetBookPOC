import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_widgetbook_app/features/home/widgets/poc_card.dart';
import 'package:poc_widgetbook_app/features/home/widgets/status_chip.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';
import 'package:poc_widgetbook_app/theme/app_theme.dart';

const _item = PocItem(
  id: 'POC-001',
  title: 'Patient timeline',
  subtitle: 'Unified visit summary',
  description: 'A short description for the card.',
  owner: 'Alice',
  progress: 0.35,
  status: PocStatus.draft,
  priority: 1,
);

Widget _wrap(Widget child) => MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: child),
    );

void main() {
  group('PocCard', () {
    testWidgets('renders item id', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('POC-001'), findsOneWidget);
    });

    testWidgets('renders item title', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('Patient timeline'), findsOneWidget);
    });

    testWidgets('renders item subtitle', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('Unified visit summary'), findsOneWidget);
    });

    testWidgets('renders owner name', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('Alice'), findsOneWidget);
    });

    testWidgets('renders priority label', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('Priority P1'), findsOneWidget);
    });

    testWidgets('renders progress as rounded percentage', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.text('35%'), findsOneWidget);
    });

    testWidgets('progress indicator has correct value', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      final indicator = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(indicator.value, closeTo(0.35, 0.001));
    });

    testWidgets('contains a StatusChip', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      expect(find.byType(StatusChip), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(_wrap(PocCard(item: _item, onTap: () => tapped = true)));
      await tester.tap(find.byType(InkWell));
      expect(tapped, isTrue);
    });

    testWidgets('does not throw when onTap is null', (tester) async {
      await tester.pumpWidget(_wrap(PocCard(item: _item)));
      await tester.tap(find.byType(InkWell));
      // no exception expected
    });

    testWidgets('progress of 100% renders as "100%"', (tester) async {
      const doneItem = PocItem(
        id: 'POC-003',
        title: 'Export workflow',
        subtitle: 'One-click handoff',
        description: 'Done item.',
        owner: 'Chloé',
        progress: 1.0,
        status: PocStatus.done,
        priority: 3,
      );
      await tester.pumpWidget(_wrap(PocCard(item: doneItem)));
      expect(find.text('100%'), findsOneWidget);
    });
  });
}
