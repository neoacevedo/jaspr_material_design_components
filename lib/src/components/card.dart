import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_material_design_components/jaspr_material_design_components.dart';

class Card extends StatelessComponent {
  final Styles? cssStyles;

  final String? cssClass;

  final Map<String, String>? attributes;

  final List<Component> children;

  // final List<StyleRule> _elevatedCardStyles = [
  //   css('.elevated', [
  //     css('&').styles(raw: {
  //       '--_container-color': 'var(--md-elevated-card-container-color, var(--md-sys-color-surface-container-low, #f7f2fa))',
  //       '--_container-elevation': 'var(--md-elevated-card-container-elevation, 1)',
  //       '--_container-shadow-color': 'var(--md-elevated-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
  //       '--_container-shape': 'var(--md-elevated-card-container-shape, var(--md-sys-shape-corner-medium, 12px))'
  //     }),
  //     // estilo para el div elevation para que coincida con el nivel del card elevated
  //     css('.elevation').styles(
  //         raw: {'z-index': '-1', '--md-elevation-level': 'var(--_container-elevation)', '--md-elevation-shadow-color': 'var(--_container-shadow-color)'}),
  //     css('.elevation', [
  //       // estilo del shadow
  //       css('.shadow', [
  //         css('&::before').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 3,1) + 2*clamp(0,var(--_level) - 4,1))) calc(1px*(2*clamp(0,var(--_level),1) + clamp(0,var(--_level) - 2,1) + clamp(0,var(--_level) - 4,1))) 0px var(--_shadow-color)',
  //           'opacity': '0.3',
  //         }),
  //         css('&::after').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 1,1) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(3*clamp(0,var(--_level),2) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(clamp(0,var(--_level),4) + 2*clamp(0,var(--_level) - 4,1))) var(--_shadow-color)',
  //           'opacity': '0.15'
  //         }),
  //         css('&::before,&::after').styles(raw: {
  //           'content': '""',
  //           'transition-property': 'box-shadow, opacity',
  //           '--_level': 'var(--md-elevation-level, 0)',
  //           '--_shadow-color': 'var(--md-elevation-shadow-color, var(--md-sys-color-shadow, #000))'
  //         })
  //       ]),
  //     ]),
  //   ]),
  //   css(':root', [
  //     css('&').styles(
  //       raw: {
  //         '--md-elevated-card-container-elevation': '1',
  //         '--md-elevated-card-container-shadow-color': 'var(--md-sys-color-shadow, #000)',
  //         '--md-elevated-card-container-shape': 'var(--md-sys-shape-corner-medium, 12px)',
  //         '--md-elevated-card-container-color': 'var(--md-sys-color-surface-container-low, #f7f2fa)',
  //         '--md-elevation-level': 'var(--_container-elevation)',
  //       },
  //     ),
  //   ]),
  // ];

  // final List<StyleRule> _filledCardStyles = [
  //   css('.filled', [
  //     css('&').styles(raw: {
  //       '--_container-color': 'var(--md-filled-card-container-color, var(--md-sys-color-surface-container-highest, #e6e0e9))',
  //       '--_container-elevation': 'var(--md-filled-card-container-elevation, 0)',
  //       '--_container-shadow-color': 'var(--md-filled-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
  //       '--_container-shape': 'var(--md-filled-card-container-shape, var(--md-sys-shape-corner-medium, 12px))'
  //     }),
  //     css('.elevation').styles(
  //         raw: {'z-index': '-1', '--md-elevation-level': 'var(--_container-elevation)', '--md-elevation-shadow-color': 'var(--_container-shadow-color)'}),
  //     css('.elevation', [
  //       // estilo del shadow
  //       css('.shadow', [
  //         css('&::before').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 3,1) + 2*clamp(0,var(--_level) - 4,1))) calc(1px*(2*clamp(0,var(--_level),1) + clamp(0,var(--_level) - 2,1) + clamp(0,var(--_level) - 4,1))) 0px var(--_shadow-color)',
  //           'opacity': '0.3',
  //         }),
  //         css('&::after').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 1,1) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(3*clamp(0,var(--_level),2) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(clamp(0,var(--_level),4) + 2*clamp(0,var(--_level) - 4,1))) var(--_shadow-color)',
  //           'opacity': '0.15'
  //         }),
  //         css('&::before,&::after').styles(raw: {
  //           'content': '""',
  //           'transition-property': 'box-shadow, opacity',
  //           '--_level': 'var(--md-elevation-level, 0)',
  //           '--_shadow-color': 'var(--md-elevation-shadow-color, var(--md-sys-color-shadow, #000))'
  //         })
  //       ]),
  //     ]),
  //   ]),
  //   css(':root', [
  //     css('&').styles(
  //       raw: {
  //         '--md-filled-card-container-color': 'var(--md-sys-color-surface-container-highest, #e6e0e9)',
  //         '--md-filled-card-container-elevation': '0',
  //         '--md-filled-card-container-shadow-color': 'var(--md-sys-color-shadow, #000)',
  //         '--md-filled-card-container-shape': 'var(--md-sys-shape-corner-medium, 12px)',
  //       },
  //     ),
  //   ]),
  // ];

  // final _outlinedCardStyles = [
  //   css('.outlined', [
  //     css('&').styles(
  //       raw: {
  //         '--_container-color': 'var(--md-outlined-card-container-color, var(--md-sys-color-surface, #fef7ff))',
  //         '--_container-elevation': 'var(--md-outlined-card-container-elevation, 0)',
  //         '--_container-shadow-color': 'var(--md-outlined-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
  //         '--_container-shape': 'var(--md-outlined-card-container-shape, var(--md-sys-shape-corner-medium, 12px))',
  //         '--_outline-color': 'var(--md-outlined-card-outline-color, var(--md-sys-color-outline-variant, #cac4d0))',
  //         '--_outline-width': 'var(--md-outlined-card-outline-width, 1px)',
  //       },
  //     ),
  //     css('.elevation').styles(
  //         raw: {'z-index': '-1', '--md-elevation-level': 'var(--_container-elevation)', '--md-elevation-shadow-color': 'var(--_container-shadow-color)'}),
  //     css('.elevation', [
  //       // estilo del shadow
  //       css('.shadow', [
  //         css('&::before').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 3,1) + 2*clamp(0,var(--_level) - 4,1))) calc(1px*(2*clamp(0,var(--_level),1) + clamp(0,var(--_level) - 2,1) + clamp(0,var(--_level) - 4,1))) 0px var(--_shadow-color)',
  //           'opacity': '0.3',
  //         }),
  //         css('&::after').styles(raw: {
  //           'box-shadow':
  //               '0px calc(1px*(clamp(0,var(--_level),1) + clamp(0,var(--_level) - 1,1) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(3*clamp(0,var(--_level),2) + 2*clamp(0,var(--_level) - 2,3))) calc(1px*(clamp(0,var(--_level),4) + 2*clamp(0,var(--_level) - 4,1))) var(--_shadow-color)',
  //           'opacity': '0.15'
  //         }),
  //         css('&::before,&::after').styles(raw: {
  //           'content': '""',
  //           'transition-property': 'box-shadow, opacity',
  //           '--_level': 'var(--md-elevation-level, 0)',
  //           '--_shadow-color': 'var(--md-elevation-shadow-color, var(--md-sys-color-shadow, #000))'
  //         })
  //       ]),
  //     ]),
  //     css('.outline').styles(
  //       raw: {
  //         'border-color': 'var(--_outline-color) !important',
  //         'border-width': 'var(--_outline-width) !important',
  //       },
  //     ),
  //   ]),
  // ];

  final String _type;

  /// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `elevated`.
  Card({super.key, required this.children, this.cssStyles, this.cssClass, this.attributes}) : _type = 'elevated';

  /// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `filled`.
  Card.filled({super.key, required this.children, this.cssStyles, this.cssClass, this.attributes}) : _type = 'filled';

  /// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `outlined`.
  Card.outlined({super.key, required this.children, this.cssStyles, this.cssClass, this.attributes}) : _type = 'outlined';

  @override
  Component build(BuildContext context) {
    // sharedStyles.addAll(_type == 'elevated' ? _elevatedCardStyles : (_type == 'filled' ? _filledCardStyles : _outlinedCardStyles));

    return div(key: key, classes: '$_type ${cssClass ?? ''}', attributes: attributes, styles: cssStyles, [
      if (_type.contains(RegExp('outlined'), 0) == false) Elevation(),
      if (_type.contains(RegExp('outlined'), 0) == true) div([], classes: 'outline'),

      div(classes: 'background', []),
      ...children,
      div([], classes: 'outline'),
    ]);
  }

  // @css
  // static final List<StyleRule> sharedStyles = [
  //   css(':root', [
  //     css('&').styles(raw: {
  //       'border-radius': 'var(--_container-shape)',
  //       'box-sizing': 'border-box',
  //       'display': 'flex',
  //       'flex-direction': 'column',
  //       'position': 'relative',
  //       'z-index': '0',
  //     })
  //   ]),
  //   css(':root', [
  //     css('&, .shadow, .shadow::before, .shadow::after').styles(raw: {
  //       'border-radius': 'inherit',
  //       'inset': '0px',
  //       'position': 'absolute',
  //       'transition-duration': 'inherit',
  //       'transition-property': 'inherit',
  //       'transition-timing-function': 'inherit',
  //     })
  //   ]),
  //   css('.elevation,.background,.outline', [
  //     css('&').styles(raw: {'border-radius': 'inherit', 'inset': '0', 'pointer-events': 'none', 'position': 'absolute'})
  //   ]),
  //   css('.background', [
  //     css('&').styles(raw: {'background': 'var(--_container-color)', 'z-index': '-1'})
  //   ]),
  //   css('.outline').styles(raw: {'border': '1px solid rgba(0,0,0,0)', 'z-index': '1'}),
  //   // estilos compartidos de todos los tipos de card
  //   css('.elevated, .filled, .outlined', [
  //     css('&').styles(
  //         radius: BorderRadius.all(Radius.circular(Unit.variable('--_container-shape'))),
  //         boxSizing: BoxSizing.borderBox,
  //         display: Display.flex,
  //         flexDirection: FlexDirection.column,
  //         position: Position.relative(),
  //         zIndex: ZIndex(0))
  //   ])
  // ];
}
