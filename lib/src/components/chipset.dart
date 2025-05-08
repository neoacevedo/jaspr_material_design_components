import 'package:jaspr/jaspr.dart';

///
class Chipset extends Component {
  final List<Component> children;
  final String? cssClass;
  final Map<String, String>? attributes;
  final Styles? styles;

  const Chipset(
    this.children, {
    super.key,
    this.attributes,
    this.cssClass,
    this.styles,
  });

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        key: key,
        tag: 'md-chip-set',
        classes: cssClass,
        attributes: attributes,
        styles: styles,
        children: children,
      ),
    );
  }
}
