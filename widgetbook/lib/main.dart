import 'package:flutter/material.dart';
import 'package:poc_widgetbook_app/features/detail/detail_page.dart';
import 'package:poc_widgetbook_app/features/home/home_page.dart';
import 'package:poc_widgetbook_app/features/home/widgets/poc_card.dart';
import 'package:poc_widgetbook_app/features/home/widgets/status_chip.dart';
import 'package:poc_widgetbook_app/models/poc_item.dart';
import 'package:poc_widgetbook_app/theme/app_theme.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const PocWidgetbook());
}

class PocWidgetbook extends StatelessWidget {
  const PocWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookCategory(
          name: 'Foundations',
          children: [
            WidgetbookComponent(
              name: 'Status Chip',
              useCases: [
                WidgetbookUseCase(
                  name: 'Draft',
                  builder: (_) => const Center(
                    child: StatusChip(status: PocStatus.draft),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'In progress',
                  builder: (_) => const Center(
                    child: StatusChip(status: PocStatus.inProgress),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Done',
                  builder: (_) => const Center(
                    child: StatusChip(status: PocStatus.done),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'Poc Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Interactive',
                  builder: (context) {
                    final selectedStatus = context.knobs.list<PocStatus>(
                      label: 'Status',
                      options: PocStatus.values,
                      labelBuilder: (status) => status.label,
                      initialOption: PocStatus.inProgress,
                    );

                    final progress = context.knobs.double.slider(
                      label: 'Progress',
                      min: 0,
                      max: 1,
                      initialValue: 0.6,
                      divisions: 10,
                    );

                    final owner = context.knobs.string(
                      label: 'Owner',
                      initialValue: 'Camille',
                    );

                    final item = PocItem(
                      id: 'POC-101',
                      title: context.knobs.string(
                        label: 'Title',
                        initialValue: 'Tumor board summary',
                      ),
                      subtitle: context.knobs.string(
                        label: 'Subtitle',
                        initialValue: 'Fast review card',
                      ),
                      description: context.knobs.string(
                        label: 'Description',
                        initialValue:
                            'Carte de synthèse pour visualiser rapidement le statut, le responsable et l’avancement.',
                      ),
                      owner: owner,
                      progress: progress,
                      status: selectedStatus,
                      priority: context.knobs.int.slider(
                        label: 'Priority',
                        min: 1,
                        max: 4,
                        initialValue: 2,
                      ),
                    );

                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: PocCard(item: item),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Screens',
          children: [
            WidgetbookComponent(
              name: 'Home Page',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (_) => const HomePage(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Detail Page',
              useCases: [
                WidgetbookUseCase(
                  name: 'Selected item',
                  builder: (_) => const DetailPage(item: pocItems[1]),
                ),
              ],
            ),
          ],
        ),
      ],
      addons: [
        ViewportAddon([
          IosViewports.iPhone13,
          IosViewports.iPad,
          AndroidViewports.smallPhone,
          AndroidViewports.tablet,
        ]),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: AppTheme.light()),
            WidgetbookTheme(name: 'Dark', data: AppTheme.dark()),
          ],
        ),
        TextScaleAddon(
          scales: const [1, 1.2, 1.5],
        ),
      ],
    );
  }
}