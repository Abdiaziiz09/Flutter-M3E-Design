import 'package:flutter/material.dart';

void main() {
  runApp(const ReferenceApp());
}

class ReferenceApp extends StatelessWidget {
  const ReferenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M3 Flutter reference',
      theme: _theme(Brightness.light),
      darkTheme: _theme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const ReferenceHomePage(),
    );
  }

  ThemeData _theme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class ReferenceHomePage extends StatefulWidget {
  const ReferenceHomePage({super.key});

  @override
  State<ReferenceHomePage> createState() => _ReferenceHomePageState();
}

class _ReferenceHomePageState extends State<ReferenceHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wideLayout = constraints.maxWidth >= 720;
        final destinations = const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Overview',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune),
            label: 'Settings',
          ),
        ];

        return Scaffold(
          appBar: AppBar(title: const Text('Reference interface')),
          body: Row(
            children: [
              if (wideLayout)
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _selectDestination,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard_outlined),
                      selectedIcon: Icon(Icons.dashboard),
                      label: Text('Overview'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.search_outlined),
                      selectedIcon: Icon(Icons.search),
                      label: Text('Search'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Profile'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.tune),
                      label: Text('Settings'),
                    ),
                  ],
                ),
              Expanded(
                child: _buildScreen(_selectedIndex),
              ),
            ],
          ),
          bottomNavigationBar: wideLayout
              ? null
              : NavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _selectDestination,
                  destinations: destinations,
                ),
        );
      },
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 1:
        return const _SearchContent();
      case 2:
        return const _ProfileContent();
      case 3:
        return const _SettingsContent();
      case 0:
      default:
        return const _OverviewContent();
    }
  }

  void _selectDestination(int index) {
    setState(() => _selectedIndex = index);
  }
}

class _OverviewContent extends StatefulWidget {
  const _OverviewContent();

  @override
  State<_OverviewContent> createState() => _OverviewContentState();
}

class _OverviewContentState extends State<_OverviewContent> {
  final _segments = <String>['Today', 'Week', 'Month'];
  String _selectedSegment = 'Week';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Overview', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        SegmentedButton<String>(
          segments: _segments
              .map(
                (label) => ButtonSegment<String>(
                  value: label,
                  label: Text(label),
                ),
              )
              .toList(),
          selected: {_selectedSegment},
          onSelectionChanged: (selection) {
            setState(() => _selectedSegment = selection.first);
          },
        ),
        const SizedBox(height: 16),
        Card(
          color: colorScheme.surfaceContainerLow,
          child: const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Material 3 Flutter example'),
            subtitle: Text(
              'This sample demonstrates standard theming, adaptive navigation, and component grouping.',
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Example action selected')),
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Example action'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              label: const Text('Secondary'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _MetricCard(title: 'Active users', value: '24.8K'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MetricCard(title: 'Conversion', value: '8.4%'),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}

class _SearchContent extends StatelessWidget {
  const _SearchContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Search', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        SearchBar(
          hintText: 'Search design components',
          leading: const Icon(Icons.search),
          onSubmitted: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Search submitted')),
            );
          },
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilterChip(
              label: const Text('Buttons'),
              selected: true,
              onSelected: (_) {},
            ),
            FilterChip(
              label: const Text('Cards'),
              selected: false,
              onSelected: (_) {},
            ),
            FilterChip(
              label: const Text('Forms'),
              selected: false,
              onSelected: (_) {},
            ),
            FilterChip(
              label: const Text('Navigation'),
              selected: true,
              onSelected: (_) {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.widgets_outlined),
            title: Text('Button groups'),
            subtitle: Text('Usage guidance and selection behavior'),
          ),
        ),
        const SizedBox(height: 8),
        const Card(
          child: ListTile(
            leading: Icon(Icons.layers_outlined),
            title: Text('Navigation rails'),
            subtitle: Text('Adaptive desktop and tablet layout patterns'),
          ),
        ),
      ],
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 34,
                  child: Icon(Icons.person, size: 34),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amina Hassan',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Product designer',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                FilledButton.tonal(onPressed: () {}, child: const Text('Follow')),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ChoiceChip(label: const Text('UX'), selected: true, onSelected: (_) {}),
            ChoiceChip(
              label: const Text('Flutter'),
              selected: true,
              onSelected: (_) {},
            ),
            ChoiceChip(label: const Text('AI'), selected: false, onSelected: (_) {}),
            ChoiceChip(
              label: const Text('Research'),
              selected: false,
              onSelected: (_) {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text('Email'),
          subtitle: Text('amina@example.com'),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.calendar_month_outlined),
          title: Text('Availability'),
          subtitle: Text('Available for design review'),
        ),
      ],
    );
  }
}

class _SettingsContent extends StatefulWidget {
  const _SettingsContent();

  @override
  State<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<_SettingsContent> {
  bool _examplePreference = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        SwitchListTile(
          key: const ValueKey('example-preference-switch'),
          value: _examplePreference,
          onChanged: (value) => setState(() => _examplePreference = value),
          title: const Text('Example preference'),
          subtitle: const Text('A sample interactive setting'),
        ),
        SwitchListTile(
          value: _notificationsEnabled,
          onChanged: (value) => setState(() => _notificationsEnabled = value),
          title: const Text('Notifications'),
          subtitle: const Text('Enable in-app alerts'),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings saved')),
            );
          },
          icon: const Icon(Icons.save_outlined),
          label: const Text('Save changes'),
        ),
      ],
    );
  }
}
