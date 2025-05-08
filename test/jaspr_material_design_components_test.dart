import 'package:jaspr/jaspr.dart';
import 'package:jaspr_material_design_components/jaspr_material_design_components.dart';

import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final button = Button.elevated(children: [Text('Text')]);
    final icon = Icon('home');
    final chip = Chip.assist('Assist');
    final menu = Menu([
      MenuItem([
        div([text('Apple')], attributes: {'slot': 'headline'}),
      ]),
    ]);

    setUp(() {
      // Additional setup goes here.
    });

    test('Button Test', () {
      expect(button, isNotNull);
    });
    test('Icon Test', () {
      expect(icon, isNotNull);
    });

    test('Chip Test', () {
      expect(chip, isNotNull);
    });

    test('Menu Test', () {
      expect(menu, isNotNull);
    });
  });
}
