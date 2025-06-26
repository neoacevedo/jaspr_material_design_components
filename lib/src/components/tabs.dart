import 'package:jaspr/jaspr.dart';

/// Representa el componente web `tabs` de [Material Web Components](https://material-web.dev/components/tabs/).
///
/// La lista de `[children]` debe contener componentes `[Tab]`.
/// Cada componente `[Tab]` representa una pestaña dentro del componente `[Tabs]`.
///
/// El componente `[Tabs]` puede tener atributos y eventos personalizados para manejar interacciones específicas,
/// como cambiar la pestaña activa o manejar eventos de selección.
///
/// El componente `[Tabs]` también puede tener atributos y eventos personalizados para manejar interacciones específicas,
/// como hacer clic en la pestaña o cambiar su estado activo. Los atributos se pasan a través del mapa `[attributes]`, que
/// generará cada atributo HTML para la etiqueta, y los eventos se manejan a través del mapa `[events]`.
///
/// El componente `[Tabs]` también puede tener estilos personalizados a través del parámetro `[styles]`, que permite ajustar su apariencia según las necesidades del diseño.
class Tabs extends Component {
  final List<Component>? children;

  final Map<String, String>? attributes;

  final Map<String, EventCallback>? events;

  final Styles? styles;

  /// Representa el componente web `tabs` de [Material Web Components](https://material-web.dev/components/tabs/).
  const Tabs(
      {super.key, this.children, this.attributes, this.events, this.styles});

  @override
  Element createElement() {
    return DomElement(DomComponent(
        key: key,
        tag: 'md-tabs',
        children: children,
        attributes: attributes,
        events: events,
        styles: styles));
  }
}

/// Representa cada componente `tab` de [Material Web Components](https://material-web.dev/components/select/).
///
/// Cada `[Tab]` debe ser un hijo de un componente `[Tabs]`.
/// El componente `[Tab]` puede ser de tipo primario o secundario, dependiendo de su uso en la interfaz de usuario.
///
/// El componente `[Tab]` primario se utiliza para la navegación principal, mientras que el secundario se usa para opciones adicionales o secundarias.
///
/// El componente `[Tab]` puede contener otros componentes como texto, iconos o cualquier otro contenido que se desee mostrar en la pestaña.
/// Estos componentes se pasan a través de la lista `[children]`, que debe contener al menos un componente hijo.
///
/// El componente `[Tab]` también puede tener atributos y eventos personalizados para manejar interacciones específicas,
/// como hacer clic en la pestaña o cambiar su estado activo. Los atributos se pasan a través del mapa `[attributes]`, que
/// generará cada atributo HTML para la etiqueta, y los eventos se manejan a través del mapa `[events]`.
///
/// El componente `[Tab]` también puede tener estilos personalizados a través del parámetro `[styles]`, que permite ajustar su apariencia según las necesidades del diseño.
class Tab extends Component {
  final List<Component>? children;

  final Map<String, String>? attributes;

  final Map<String, EventCallback>? events;

  final Styles? styles;

  final String _tag;

  /// [Tab.primary] representa el componente `tab` primario.
  /// Este tipo de pestaña se utiliza para la navegación principal en la interfaz de usuario.
  /// Puede contener otros componentes como texto, iconos o cualquier otro contenido que se desee mostrar en la pestaña.
  /// El componente `[Tab]` primario puede tener atributos y eventos personalizados para manejar interacciones específicas,
  /// como hacer clic en la pestaña o cambiar su estado activo. Los atributos se pasan a través del mapa `[attributes]`, que
  /// generará cada atributo HTML para la etiqueta, y los eventos se manejan a través del mapa `[events]`.
  /// El componente `[Tab]` primario también puede tener estilos personalizados a través del parámetro `[styles]`, que
  /// permite ajustar su apariencia según las necesidades del diseño.
  /// Ejemplo de uso:
  /// ```dart
  /// Tab.primary(
  ///   children: [
  ///     Text('Pestaña Primaria'),
  ///     Icon(Icons.home),
  ///   ],
  ///   attributes: {
  ///     'active': '', // Indica que esta pestaña está activa
  ///     'aria-controls': 'panel-1', // Relaciona la pestaña con su panel correspondiente
  ///   },
  ///   events: {
  ///     'click': (event) {
  ///       // Maneja el evento de clic en la pestaña
  ///       print('Pestaña Primaria clickeada');
  ///     },
  ///   },
  ///   styles: Styles(
  ///     backgroundColor: 'blue',
  ///     color: 'white',
  ///   ),
  /// )
  /// ```
  const Tab.primary(
      {super.key, this.children, this.attributes, this.events, this.styles})
      : _tag = 'md-primary-tab';

  /// [Tab.secondary] representa el componente `tab` secundario.
  /// Este tipo de pestaña se utiliza para opciones adicionales o secundarias en la interfaz de usuario.
  /// Puede contener otros componentes como texto, iconos o cualquier otro contenido que se desee mostrar en la pestaña.
  /// El componente `[Tab]` secundario puede tener atributos y eventos personalizados para manejar interacciones específicas,
  /// como hacer clic en la pestaña o cambiar su estado activo. Los atributos se pasan a través del mapa `[attributes]`, que
  /// generará cada atributo HTML para la etiqueta, y los eventos se manejan a través del mapa `[events]`.
  /// El componente `[Tab]` secundario también puede tener estilos personalizados a través del parámetro `[styles]`, que
  /// permite ajustar su apariencia según las necesidades del diseño.
  /// Ejemplo de uso:
  /// ```dart
  /// Tab.secondary(
  ///   children: [
  ///     Text('Pestaña Secundaria'),
  ///     Icon(Icons.settings),
  ///   ],
  ///   attributes: {
  ///     'aria-controls': 'panel-2', // Relaciona la pestaña con su panel correspondiente
  ///   },
  ///   events: {
  ///     'click': (event) {
  ///       // Maneja el evento de clic en la pestaña
  ///       print('Pestaña Secundaria clickeada');
  ///     },
  ///   },
  ///   styles: Styles(
  ///     backgroundColor: 'gray',
  ///     color: 'black',
  ///   ),
  /// )
  /// ```
  const Tab.secondary(
      {super.key, this.children, this.attributes, this.events, this.styles})
      : _tag = 'md-secondary-tab';

  @override
  Element createElement() {
    return DomElement(DomComponent(
        key: key,
        tag: _tag,
        children: children,
        attributes: attributes,
        events: events,
        styles: styles));
  }
}
