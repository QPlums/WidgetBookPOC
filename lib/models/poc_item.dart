enum PocStatus {
  draft(label: 'Draft'),
  inProgress(label: 'In progress'),
  done(label: 'Done');

  const PocStatus({required this.label});

  final String label;
}

class PocItem {
  const PocItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.owner,
    required this.progress,
    required this.status,
    required this.priority,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String owner;
  final double progress;
  final PocStatus status;
  final int priority;
}

const pocItems = [
  PocItem(
    id: 'POC-001',
    title: 'Patient timeline',
    subtitle: 'Unified visit summary',
    description:
        'Prototype d’écran listant les événements importants pour une consultation rapide.',
    owner: 'Alice',
    progress: 0.35,
    status: PocStatus.draft,
    priority: 1,
  ),
  PocItem(
    id: 'POC-002',
    title: 'Imaging review',
    subtitle: 'Annotation side panel',
    description:
        'POC d’un panneau latéral pour afficher résultats, commentaires et statut de validation.',
    owner: 'Benoît',
    progress: 0.6,
    status: PocStatus.inProgress,
    priority: 2,
  ),
  PocItem(
    id: 'POC-003',
    title: 'Export workflow',
    subtitle: 'One-click handoff',
    description:
        'Validation d’un flux d’export avec feedback immédiat et traçabilité simplifiée.',
    owner: 'Chloé',
    progress: 1,
    status: PocStatus.done,
    priority: 3,
  ),
];