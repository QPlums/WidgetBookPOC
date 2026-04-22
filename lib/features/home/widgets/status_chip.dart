import 'package:flutter/material.dart';

import '../../../models/poc_item.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.status,
  });

  final PocStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (background, foreground) = switch (status) {
      PocStatus.draft => (scheme.surfaceContainerHighest, scheme.onSurface),
      PocStatus.inProgress => (scheme.primaryContainer, scheme.onPrimaryContainer),
      PocStatus.done => (scheme.tertiaryContainer, scheme.onTertiaryContainer),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: foreground,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}