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
        // Example-only project threshold; this is not a Material breakpoint token.
        final wideLayout = constraints.maxWidth >= 720;
        final destinations = const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Overview',
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
                      icon: Icon(Icons.tune),
                      label: Text('Settings'),
                    ),
                  ],
                ),
              Expanded(
                child: _selectedIndex == 0
                    ? const _OverviewContent()
                    : const _SettingsContent(),
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

  void _selectDestination(int index) {
    setState(() => _selectedIndex = index);
  }
}

class _OverviewContent extends StatelessWidget {
  const _OverviewContent();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Overview', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Card(
          color: colorScheme.surfaceContainerLow,
          child: const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Material 3 Flutter example'),
            subtitle: Text(
              'This sample demonstrates standard theming and adaptive navigation.',
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Example action selected')),
            );
          },
          icon: const Icon(Icons.check),
          label: const Text('Example action'),
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
        SwitchListTile(
          value: _examplePreference,
          onChanged: (value) => setState(() => _examplePreference = value),
          title: const Text('Example preference'),
          subtitle: const Text('A sample interactive setting'),
        ),
      ],
    );
  }
}
