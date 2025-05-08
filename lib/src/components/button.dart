import 'package:jaspr/jaspr.dart';

/// Representa los diferentes estados de los botones de [Material Web Components](https://material-web.dev/components/button/).
///
/// Representa tanto los botones normales como los Icon Button.
class Button extends Component {
  final bool? disabled;

  final String? name;

  final bool? hasIcon;

  final String? href;

  final String? target;

  final String? trailingIcon;

  final String? type;

  final bool? softDisabled;

  final Styles? styles;

  final String? value;

  late final Map<String, String>? attributes;

  late final List<Component>? children;

  final Map<String, EventCallback>? events;

  final String _tag;

  /// Renderiza un elevated [Button]
  Button.elevated({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-elevated-button';

  /// Renderiza un filled [Button]
  Button.filled({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-filled-button';

  /// Renderiza un outlined [Button]
  Button.outlined({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-outlined-button';

  /// Renderiza un text [Button]
  Button.text({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-text-button';

  /// Renderiza un tonal [Button]
  Button.filledTonal({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-filled-tonal-button';

  /// Renderiza un icon [Button]
  ///
  /// El ícono del botón irá en la propiedad [children]. Si se requiere que al hacer clic
  /// en el botón haga un [toggle](https://material-web.dev/components/icon-button/#toggle),
  /// en la misma propiedad se puede agregar un [Icon] donde en su propiedad `attribute` se agregue el slot `selected`:
  ///
  /// ```dart
  ///   Button.icon(children: [Icon('visibility'), Icon('visibility_off', attributes: {'slot': 'selected'})])
  /// ```
  Button.icon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-icon-button';

  /// Renderiza un filled icon [Button]
  ///
  /// El ícono del botón irá en la propiedad [children]. Si se requiere que al hacer clic
  /// en el botón haga un [toggle](https://material-web.dev/components/icon-button/#toggle),
  /// en la misma propiedad se puede agregar un [Icon] donde en su propiedad `attribute` se agregue el slot `selected`:
  ///
  /// ```dart
  ///   Button.filledIcon(children: [Icon('visibility'), Icon('visibility_off', attributes: {'slot': 'selected'})])
  /// ```
  Button.filledIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-filled-icon-button';

  /// Renderiza un filled tonal icon [Button]
  ///
  /// El ícono del botón irá en la propiedad [children]. Si se requiere que al hacer clic
  /// en el botón haga un [toggle](https://material-web.dev/components/icon-button/#toggle),
  /// en la misma propiedad se puede agregar un [Icon] donde en su propiedad `attribute` se agregue el slot `selected`:
  ///
  /// ```dart
  ///   Button.filledTonalIcon(children: [Icon('visibility'), Icon('visibility_off', attributes: {'slot': 'selected'})])
  /// ```
  Button.filledTonalIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-filled-tonal-icon-button';

  /// Renderiza un outlined icon [Button]
  ///
  /// El ícono del botón irá en la propiedad [children]. Si se requiere que al hacer clic
  /// en el botón haga un [toggle](https://material-web.dev/components/icon-button/#toggle),
  /// en la misma propiedad se puede agregar un [Icon] donde en su propiedad `attribute` se agregue el slot `selected`:
  ///
  /// ```dart
  ///   Button.outlinedIcon(children: [Icon('visibility'), Icon('visibility_off', attributes: {'slot': 'selected'})])
  /// ```
  Button.outlinedIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.styles,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _tag = 'md-outlined-icon-button';

  @override
  Element createElement() {
    attributes?.addAll({
      'class': 'button',
      if (disabled != null && disabled!)
        'disabled': '', // Si disabled es true, agrega 'disabled': ''
      if (name != null) 'name': name!,
      if (hasIcon != null && hasIcon!)
        'has-icon': '', // Si hasIcon es true, agrega 'has-icon': ''
      if (href != null) 'href': href!,
      if (target != null) 'target': target!,
      if (trailingIcon != null) 'trailing-icon': trailingIcon!,
      'type': (type != null) ? type! : 'submit',
      if (softDisabled != null && softDisabled!)
        'soft-disabled':
            '', // Si softDisabled es true, agrega 'soft-disabled': ''
      if (value != null) 'value': value!,
    });

    return DomElement(
      DomComponent(
        key: key,
        tag: _tag,
        attributes: attributes,
        styles: styles,
        children: children,
        events: {...?events},
      ),
    );
  }
}
