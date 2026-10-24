import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:m3_expressive_reference_app/m3e/m3e.dart';

void main() {
  group('M3E Visual Fidelity & Component Screenshot Tests', () {
    goldenTest(
      'M3E button groups across density states',
      fileName: 'm3e_button_groups_density',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 420),
        children: [
          GoldenTestScenario(
            name: 'compact density',
            child: SizedBox(
              height: 80,
              child: Center(
                child: M3EConnectedButtonGroup<String>(
                  density: M3EDensity.compact,
                  items: const [
                    M3EButtonItem(value: 'day', label: Text('Day')),
                    M3EButtonItem(value: 'week', label: Text('Week')),
                    M3EButtonItem(value: 'month', label: Text('Month')),
                  ],
                  selected: const {'week'},
                  onSelectionChanged: (_) {},
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'standard density',
            child: SizedBox(
              height: 80,
              child: Center(
                child: M3EConnectedButtonGroup<String>(
                  density: M3EDensity.standard,
                  items: const [
                    M3EButtonItem(value: 'day', label: Text('Day')),
                    M3EButtonItem(value: 'week', label: Text('Week')),
                    M3EButtonItem(value: 'month', label: Text('Month')),
                  ],
                  selected: const {'week'},
                  onSelectionChanged: (_) {},
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'comfortable density',
            child: SizedBox(
              height: 80,
              child: Center(
                child: M3EConnectedButtonGroup<String>(
                  density: M3EDensity.comfortable,
                  items: const [
                    M3EButtonItem(value: 'day', label: Text('Day')),
                    M3EButtonItem(value: 'week', label: Text('Week')),
                    M3EButtonItem(value: 'month', label: Text('Month')),
                  ],
                  selected: const {'week'},
                  onSelectionChanged: (_) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'M3E split buttons and segmented list',
      fileName: 'm3e_split_button_and_list',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 480),
        children: [
          GoldenTestScenario(
            name: 'split button primary and tonal',
            child: SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    M3ESplitButton(
                      onPressed: () {},
                      label: const Text('Publish'),
                      icon: const Icon(Icons.send_rounded),
                      menuChildren: [
                        MenuItemButton(
                          onPressed: () {},
                          child: const Text('Schedule'),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    M3ESplitButton(
                      isTonal: true,
                      onPressed: () {},
                      label: const Text('Draft'),
                      menuChildren: [
                        MenuItemButton(
                          onPressed: () {},
                          child: const Text('Discard'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'segmented list items',
            child: SizedBox(
              height: 260,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: M3ESegmentedList(
                  items: [
                    M3ESegmentedListItem(
                      id: 'item-1',
                      leading: const Icon(Icons.star_rounded),
                      title: const Text('Item One'),
                      subtitle: const Text('M3E spring physics enabled'),
                    ),
                    M3ESegmentedListItem(
                      id: 'item-2',
                      leading: const Icon(Icons.check_circle_rounded),
                      title: const Text('Item Two'),
                      subtitle: const Text('Tonal container hierarchy'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
