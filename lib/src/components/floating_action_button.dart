import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

///
class FloatingActionButton extends StatelessComponent {
  late final List<Component>? children;

  late final Map<String, String>? attributes;

  final Styles? styles;

  final String _tag;

  FloatingActionButton({super.key, this.children, this.attributes, this.styles}) : _tag = 'md-fab';

  FloatingActionButton.branded({super.key, this.children, this.attributes, this.styles}) : _tag = 'md-branded-fab';

  @override
  Component build(BuildContext context) {
    return Component.element(key: key, tag: _tag, attributes: attributes, styles: styles, children: children);
  }
}
