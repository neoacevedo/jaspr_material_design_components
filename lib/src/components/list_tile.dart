import 'package:jaspr/jaspr.dart';

///
class ListTile extends Component {
  final Map<String, String>? attributes;

  final List<Component>? children;

  final Styles? styles;

  final String _tag;

  final Map<String, EventCallback>? _events;

  ListTile.item({
    super.key,
    this.attributes,
    this.children,
    this.styles,
    Map<String, EventCallback>? events,
  }) : _tag = 'md-list-item',
       _events = events;

  ListTile({super.key, this.attributes, this.children, this.styles})
    : _tag = 'md-list',
      _events = null;

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        key: key,
        tag: _tag,
        attributes: attributes,
        styles: styles,
        children: children,
        events: _events,
      ),
    );
  }
}
