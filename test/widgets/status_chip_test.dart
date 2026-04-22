import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_widgetbook_app/features/home/widgets/status_chip.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';
import 'package:poc_widgetbook_app/theme/app_theme.dart';

Widget _wrap(Widget child) => MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );

void main() {
  group('StatusChip', () {
    testWidgets('shows "Draft" label for draft status', (tester) async {
      await tester.pumpWidget(_wrap(const StatusChip(status: PocStatus.draft)));
      expect(find.text('Draft'), findsOneWidget);
    });

    testWidgets('shows "In progress" label for inProgress status', (tester) async {
      await tester.pumpWidget(_wrap(const StatusChip(status: PocStatus.inProgress)));
      expect(find.text('In progress'), findsOneWidget);
    });

    testWidgets('shows "Done" label for done status', (tester) async {
      await tester.pumpWidget(_wrap(const StatusChip(status: PocStatus.done)));
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('renders exactly one Text widget', (tester) async {
      await tester.pumpWidget(_wrap(const StatusChip(status: PocStatus.inProgress)));
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('text has bold font weight', (tester) async {
      await tester.pumpWidget(_wrap(const StatusChip(status: PocStatus.done)));
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, FontWeight.w700);
    });
  });
}
