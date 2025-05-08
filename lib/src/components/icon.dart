import 'package:jaspr/jaspr.dart';

/// Representa el componente [Icon] de Material Design Components.
///
/// Para que el ícono sea visible, registre en la zona de estilos de su componente [App] los estilos de [Material Symbols](https://fonts.google.com/icons).
///
/// Un ejemplo de cómo termina renderizando el componente es el siguiente:
///
/// ```dart
/// Icon('home');
/// ```
///
/// Esto termina generando el componente web:
///
/// ```html
/// <md-icon>home</md-icon>
/// ```
///
/// Para tener las variantes de los estilos de los íconos, puede agregar la clase correspondiente en el atributo [cssClass]:
///
/// ```dart
/// Icon('home', cssClass: 'material-symbols-outlined');
/// ```
///
class Icon extends Component {
  final String icon;

  final String? cssClass;

  final Map<String, String>? attributes;

  const Icon(this.icon, {super.key, this.cssClass, this.attributes});

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        key: key,
        tag: 'md-icon',
        child: Text(icon),
        classes: cssClass,
        attributes: attributes,
      ),
    );
  }
}
