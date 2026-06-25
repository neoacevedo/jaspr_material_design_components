import 'package:jaspr/dom.dart';
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
class Icon extends StatelessComponent {
  final String icon;

  final String? cssClass;

  final IconVariant? variant;

  final Map<String, String>? attributes;

  const Icon(this.icon, {super.key, this.cssClass, this.variant = IconVariant.outlined, this.attributes});

  @override
  Component build(BuildContext context) {
    String materialClass = 'material-symbols-${variant?.name}';
    return span(classes: cssClass != null ? '$materialClass $cssClass' : materialClass, attributes: attributes, [.text(icon)]);
    // return Component.element(
    //   key: key,
    //   tag: 'md-icon',
    //   children: [text(icon)],
    //   classes: cssClass,
    //   attributes: attributes,
    // );
  }
}

enum IconVariant {
  outlined,
  rounded,
  sharp,
}
