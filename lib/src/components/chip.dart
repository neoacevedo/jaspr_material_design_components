import 'package:jaspr/jaspr.dart';

/// Representa los diferentes tipos del componente `md-*-chip` de [Material Web Components](https://material-web.dev/components/chip/).
class Chip extends Component {
  final String label;
  final String? cssClass;
  final Styles? styles;
  final Map<String, String>? attributes;
  final List<Component>? children;

  final String _tag;
  final bool _removable;

  /// Renderiza el componente [md-assist-chip](https://material-web.dev/components/chip/#assist-chip).
  ///
  /// Este componente no tiene el atributo `removable` por lo que aunque se le incluya, no renderizará el
  /// trailing-icon.
  Chip.assist(
    this.label, {
    super.key,
    this.cssClass,
    this.attributes,
    this.styles,
    this.children,
  }) : _tag = 'md-assist-chip',
       _removable = false;

  /// Renderiza el componente [md-filter-chip](https://material-web.dev/components/chip/#filter-chip).
  ///
  /// Para que el componente web disponga del trailing-icon que remueva este del DOM, el atributo
  /// [removable] debe tener el valor `true`.
  ///
  /// Si se quiere reemplazar el trailing-icon removible, y dar un aspecto de chip con menú, la propiedad [removable] debe tener el valor
  /// `false`, el label deberá tener un texto vacío, y el contenido dentro de este componente será
  /// el texto seguido del ícono:
  ///
  /// ```dart
  /// Chip.filter('', removable: false, children: [
  ///     div([
  ///         span([text('Filter chip con "trailing-icon".')],
  ///                  classes: 'label'),
  ///         span([Icon('arrow_drop_down')], classes: 'trailing icon')
  ///      ], classes: 'container')
  /// ]);
  /// ```
  /// Para lograr un estilo visual similar al contenido por defecto haciendo uso de la opción anterior, se puede emplear el siguiente ejemplo:
  ///
  /// ```dart
  ///  ...
  ///  css('.icon').styles(raw: {
  ///      'align-self': 'center',
  ///      'display': 'flex',
  ///      'fill': 'currentcolor',
  ///      'position': 'relative'
  ///  })),
  ///  css('.trailing.icon').styles(raw: {
  ///      'color': 'var(--_trailing-icon-color)',
  ///      'height': 'var(--_icon-size)',
  ///      'width': 'var(--_icon-size)'
  ///  }),
  ///  css('.container').styles(raw: raw: {
  ///      'border-radius': 'inherit',
  ///      'box-sizing': 'border-box',
  ///      'display': 'flex',
  ///      'height': '100%',
  ///      'position': 'relative',
  ///      'width': '100%'
  ///  }),
  /// ...
  /// ```
  Chip.filter(
    this.label, {
    super.key,
    this.cssClass,
    this.attributes,
    this.styles,
    this.children,
    bool removable = false,
  }) : _tag = 'md-filter-chip',
       _removable = removable,
       assert(
         (attributes?.containsKey('href') != true),
         'Los chips tipo filter no deben tener el atributo `href`.',
       );

  /// Renderiza el componente [md-input-chip](https://material-web.dev/components/chip/#input-chip).
  ///
  /// A diferencia de [Chip.filter()], este componente mostrará el trailing-icon para removerlo del DOM.
  Chip.input(
    this.label, {
    super.key,
    this.cssClass,
    this.attributes,
    this.styles,
    this.children,
  }) : _tag = 'md-input-chip',
       _removable = false;

  /// Renderiza el componente [md-suggestion-chip](https://material-web.dev/components/chip/#suggestion-chip).
  ///
  /// Este componente no tiene el atributo `removable` por lo que aunque se le incluya, no renderizará el
  /// trailing-icon.
  Chip.suggestion(
    this.label, {
    super.key,
    this.cssClass,
    this.attributes,
    this.styles,
    this.children,
  }) : _tag = 'md-suggestion-chip',
       _removable = false;

  @override
  Element createElement() {
    Map<String, String> localAttributes = attributes ?? {};

    localAttributes['label'] = label;
    if (_removable == true) {
      localAttributes['removable'] = '';
    }

    return DomElement(
      DomComponent(
        key: key,
        tag: _tag,
        classes: cssClass,
        attributes: localAttributes,
        styles: styles,
        children: children,
      ),
    );
  }
}
