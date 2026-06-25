import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

///
class Chipset extends StatelessComponent {
  final List<Component> children;
  final String? cssClass;
  final Map<String, String>? attributes;
  final Styles? styles;

  const Chipset(this.children, {super.key, this.attributes, this.cssClass, this.styles});

  @override
  Component build(BuildContext context) {
    return Component.element(key: key, tag: 'md-chip-set', classes: cssClass, attributes: attributes, styles: styles, children: children);
  }
}
