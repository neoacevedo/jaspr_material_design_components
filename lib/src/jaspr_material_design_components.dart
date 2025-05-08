import 'dart:math';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_material_design_components/src/styles/shared.dart';

///{@template jaspr_materia_design_components}
/// Checks if you are awesome. Spoiler: you are.
/// {@endtemplate}
class JasprMaterialDesignComponents {
  /// {@macro jaspr_material_design_components}
  /// Material Design Web Components para Jaspr.
  const JasprMaterialDesignComponents();

  /// Genera los scripts usados desde el CDN.
  ///
  /// Agregue este método a la lista de `yields` de su componente [App] de esta manera:
  /// ```dart
  /// for (var element in JasprMaterialDesignComponents().materialScript()) {
  ///    yield element;
  /// }
  /// ```
  List<Component> materialScript() {
    return [
      DomComponent(
        tag: 'script',
        attributes: {'type': 'importmap'},
        children: [
          RawText(
            '{"imports": {"@material/web/": "https://esm.run/@material/web/"}}',
          ),
        ],
      ),
      DomComponent(
        tag: 'script',
        attributes: {'type': 'module'},
        children: [
          RawText(
            'import \'@material/web/all.js\';\n'
            'import {styles as typescaleStyles} from \'@material/web/typography/md-typescale-styles.js\';\n',
          ),
        ],
      ),
    ];
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
    ),
  );

  @css
  static final styles = [...sharedStyles];
}
