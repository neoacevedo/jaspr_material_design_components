import 'package:jaspr/jaspr.dart';

abstract class _Field extends StatelessComponent {
  final Styles? cssStyles;

  final String? cssClass;

  final Map<String, String>? attributes;

  final List<Component>? children;

  final Map<String, EventCallback>? events;

  final String _type;

  _Field(
    String type, {
    super.key,
    this.cssStyles,
    this.cssClass,
    this.attributes,
    this.children,
    this.events,
  }) : _type = generateFieldTag(type);

  static String generateFieldTag(String type) {
    return 'md-$type-text-field';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: _type,
      classes: cssClass,
      attributes: attributes,
      styles: cssStyles,
      children: children,
      events: events,
    );
  }
}

/// Representa el componente [Text Field](https://material-web.dev/components/text-field/) de Material Web Components.
///
/// Por defecto genera el componente en forma `outlined`. Para generar el componente
/// en forma `filled`, el valor del parámetro [filled] deberá ser `true`.
///
/// En su propiedad [attributes] puede definir si este componente se comporta como
/// un `textarea` definiendo la propiedad `type` en `textarea`.
class TextField extends _Field {
  TextField({
    super.key,
    super.cssStyles,
    super.cssClass,
    super.attributes,
    super.children,
    super.events,
    bool filled = false,
  }) : super(filled ? 'filled' : 'outlined');
}
