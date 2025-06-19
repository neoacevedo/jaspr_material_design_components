import 'dart:math';

import 'package:jaspr/jaspr.dart';
// import 'package:jaspr_material_design_components/src/styles/shared.dart';

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
      DomComponent(tag: 'script', child: RawText(r'''
        /**
         * @copyright Copyright (c) 2024 neoacevedo
         * 
         * This program is free software: you can redistribute it and/or modify
         * it under the terms of the GNU General Public License as published by
         * the Free Software Foundation, either version 3 of the License, or
         * (at your option) any later version.
         *
         * This program is distributed in the hope that it will be useful,
         * but WITHOUT ANY WARRANTY; without even the implied warranty of
         * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
         * GNU General Public License for more details.
         *
         * You should have received a copy of the GNU General Public License
         * along with this program.  If not, see <http://www.gnu.org/licenses/>.
         */
        let sharedStyles="\n:host{border-radius:var(--_container-shape);box-sizing:border-box;display:flex;flex-direction:column;position:relative;z-index:0;}\n\nmd-elevation,.background,.outline{border-radius:inherit;inset:0;pointer-events:none;position:absolute}.background{background:var(--_container-color);z-index:-1}.outline{border:1px solid rgba(0,0,0,0);z-index:1}md-elevation{z-index:-1;--md-elevation-level: var(--_container-elevation);--md-elevation-shadow-color: var(--_container-shadow-color)}slot{border-radius:inherit}\n",elevatedStyles=":host{--_container-color: var(--md-elevated-card-container-color, var(--md-sys-color-surface-container-low, #f7f2fa));--_container-elevation: var(--md-elevated-card-container-elevation, 1);--_container-shadow-color: var(--md-elevated-card-container-shadow-color, var(--md-sys-color-shadow, #000));--_container-shape: var(--md-elevated-card-container-shape, var(--md-sys-shape-corner-medium, 12px))}",filledStyles=":host{--_container-color: var(--md-filled-card-container-color, var(--md-sys-color-surface-container-highest, #e6e0e9));--_container-elevation: var(--md-filled-card-container-elevation, 0);--_container-shadow-color: var(--md-filled-card-container-shadow-color, var(--md-sys-color-shadow, #000));--_container-shape: var(--md-filled-card-container-shape, var(--md-sys-shape-corner-medium, 12px))}",outlinedStyles=":host{--_container-color: var(--md-outlined-card-container-color, var(--md-sys-color-surface, #fef7ff));--_container-elevation: var(--md-outlined-card-container-elevation, 0);--_container-shadow-color: var(--md-outlined-card-container-shadow-color, var(--md-sys-color-shadow, #000));--_container-shape: var(--md-outlined-card-container-shape, var(--md-sys-shape-corner-medium, 12px));--_outline-color: var(--md-outlined-card-outline-color, var(--md-sys-color-outline-variant, #cac4d0));--_outline-width: var(--md-outlined-card-outline-width, 1px)}.outline{border-color:var(--_outline-color);border-width:var(--_outline-width)}";class MdOutlinedCard extends HTMLElement{constructor(){super(),this.attachShadow({mode:"open"}),this.shadowRoot.innerHTML=`\n            <style>\n                ${sharedStyles}\n                ${outlinedStyles}\n\n                ::slotted(div[slot="actions"]) {\n                    display: flex;\n                    flex-direction: row;\n                    align-items: end;\n                    justify-content: end;\n                }\n            </style>\n            <md-elevation part="elevation"></md-elevation>\n            <div class="background"></div>\n            <slot></slot>\n                        <div class="outline"></div>\n        `}}class MdFilledCard extends HTMLElement{constructor(){super(),this.attachShadow({mode:"open"}),this.shadowRoot.innerHTML=`\n            <style>\n                ${sharedStyles}\n                ${filledStyles}\n\n                ::slotted(div[slot="actions"]) {\n                    display: flex;\n                    flex-direction: row;\n                    align-items: end;\n                    justify-content: end;\n                }\n            </style>\n            <md-elevation part="elevation"></md-elevation>\n            <div class="background"></div>\n            <slot></slot>\n                        <div class="outline"></div>\n        `}}class MdElevatedCard extends HTMLElement{constructor(){super(),this.attachShadow({mode:"open"}),this.shadowRoot.innerHTML=`\n            <style>\n                ${sharedStyles}\n                ${elevatedStyles}\n\n                ::slotted(div[slot="actions"]) {\n                    display: flex;\n                    flex-direction: row;\n                    align-items: center;\n                    justify-content: center;\n                    padding: 16px;\n                }\n            </style>\n            <md-elevation part="elevation"></md-elevation>\n            <div class="background"></div>\n            <slot></slot>\n                        <div class="outline"></div>\n        `}}customElements.define("md-outlined-card",MdOutlinedCard),customElements.define("md-filled-card",MdFilledCard),customElements.define("md-elevated-card",MdElevatedCard);
        ''')),
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

  // @css
  // static final styles = [...sharedStyles];
}
