import 'package:flutter_test/flutter_test.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';

void main() {
  group('PocStatus', () {
    test('has 3 values', () {
      expect(PocStatus.values.length, 3);
    });

    test('draft has correct label', () {
      expect(PocStatus.draft.label, 'Draft');
    });

    test('inProgress has correct label', () {
      expect(PocStatus.inProgress.label, 'In progress');
    });

    test('done has correct label', () {
      expect(PocStatus.done.label, 'Done');
    });
  });

  group('PocItem', () {
    const item = PocItem(
      id: 'POC-TEST',
      title: 'Test title',
      subtitle: 'Test subtitle',
      description: 'Test description',
      owner: 'Alice',
      progress: 0.5,
      status: PocStatus.inProgress,
      priority: 2,
    );

    test('stores id correctly', () => expect(item.id, 'POC-TEST'));
    test('stores title correctly', () => expect(item.title, 'Test title'));
    test('stores subtitle correctly', () => expect(item.subtitle, 'Test subtitle'));
    test('stores description correctly', () => expect(item.description, 'Test description'));
    test('stores owner correctly', () => expect(item.owner, 'Alice'));
    test('stores progress correctly', () => expect(item.progress, 0.5));
    test('stores status correctly', () => expect(item.status, PocStatus.inProgress));
    test('stores priority correctly', () => expect(item.priority, 2));
  });

  group('pocItems fixture', () {
    test('contains exactly 3 items', () {
      expect(pocItems.length, 3);
    });

    test('all items have non-empty ids and titles', () {
      for (final item in pocItems) {
        expect(item.id, isNotEmpty);
        expect(item.title, isNotEmpty);
      }
    });

    test('first item is draft with partial progress', () {
      final first = pocItems[0];
      expect(first.status, PocStatus.draft);
      expect(first.progress, lessThan(1.0));
    });

    test('second item is inProgress', () {
      expect(pocItems[1].status, PocStatus.inProgress);
    });

    test('third item is done with 100% progress', () {
      final last = pocItems[2];
      expect(last.status, PocStatus.done);
      expect(last.progress, 1.0);
    });

    test('priorities are distinct positive integers', () {
      final priorities = pocItems.map((e) => e.priority).toList();
      expect(priorities.toSet().length, pocItems.length);
      expect(priorities.every((p) => p > 0), isTrue);
    });

    test('progress values are between 0 and 1 inclusive', () {
      for (final item in pocItems) {
        expect(item.progress, inInclusiveRange(0.0, 1.0));
      }
    });
  });
}
