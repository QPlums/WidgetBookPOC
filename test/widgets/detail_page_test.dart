import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_widgetbook_app/features/detail/detail_page.dart';
import 'package:poc_widgetbook_app/features/home/widgets/status_chip.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';
import 'package:poc_widgetbook_app/theme/app_theme.dart';

const _item = PocItem(
  id: 'POC-002',
  title: 'Imaging review',
  subtitle: 'Annotation side panel',
  description: 'Detail description for the imaging review POC.',
  owner: 'Benoît',
  progress: 0.6,
  status: PocStatus.inProgress,
  priority: 2,
);

Widget _wrap() => MaterialApp(
      theme: AppTheme.light(),
      home: const DetailPage(item: _item),
    );

void main() {
  group('DetailPage', () {
    testWidgets('shows item title in AppBar', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Imaging review'), findsWidgets);
    });

    testWidgets('shows item id', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('POC-002'), findsOneWidget);
    });

    testWidgets('shows item subtitle', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Annotation side panel'), findsOneWidget);
    });

    testWidgets('shows item description', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Detail description for the imaging review POC.'), findsOneWidget);
    });

    testWidgets('shows owner in meta card', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Benoît'), findsOneWidget);
    });

    testWidgets('shows progress as rounded percentage in meta card', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('60%'), findsOneWidget);
    });

    testWidgets('shows priority in meta card', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('P2'), findsOneWidget);
    });

    testWidgets('contains a StatusChip', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.byType(StatusChip), findsOneWidget);
    });

    testWidgets('has "Validate POC action" button', (tester) async {
      await tester.pumpWidget(_wrap());
      expect(find.text('Validate POC action'), findsOneWidget);
    });

    testWidgets('has a back button from AppBar', (tester) async {
      // Wrap in a Navigator with a previous route so the back button appears.
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.light(),
        home: const Scaffold(body: Text('previous')),
        routes: {'/detail': (_) => const DetailPage(item: _item)},
      ));
      // Navigate to detail page to get the back arrow.
      final nav = tester.state<NavigatorState>(find.byType(Navigator));
      nav.pushNamed('/detail');
      await tester.pumpAndSettle();
      expect(find.byType(BackButton), findsOneWidget);
    });
  });
}
