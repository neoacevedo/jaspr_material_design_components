import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Representa el componente [Menu](https://material-web.dev/components/menu/) de Material Web Components.
class Menu extends StatelessComponent {
  final Styles? styles;

  final Map<String, String>? attributes;

  final List<Component> children;

  final Map<String, EventCallback>? events;

  final String _tag;

  Menu(this.children, {super.key, this.styles, this.attributes, this.events}) : _tag = 'md-menu';

  /// Representa el [Menu] hijo del componente [Menu].
  Menu.submenu(this.children, {super.key, this.styles, this.attributes, this.events}) : _tag = 'md-sub-menu';

  @override
  Component build(BuildContext context) {
    return Component.element(key: key, tag: _tag, styles: styles, attributes: attributes, children: children, events: {...?events});
  }
}

class MenuItem extends StatelessComponent {
  final Styles? styles;

  final Map<String, String>? attributes;

  final List<Component> children;

  final Map<String, EventCallback>? events;

  /// Represena los elementos del [Menu]
  const MenuItem(this.children, {this.styles, this.attributes, this.events});

  @override
  Component build(BuildContext context) {
    return Component.element(tag: 'md-menu-item', styles: styles, attributes: attributes, children: children, events: {...?events});
  }
}
