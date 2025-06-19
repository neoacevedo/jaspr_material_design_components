import 'package:jaspr/jaspr.dart';

/// Representa el componente web `tabs` de [Material Web Components](https://material-web.dev/components/tabs/).
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
///
class Tab extends Component {
  final List<Component>? children;

  final Map<String, String>? attributes;

  final Map<String, EventCallback>? events;

  final Styles? styles;

  final String _tag;

  /// [Tab.primary] representa el componente `tab` primario.
  const Tab.primary(
      {super.key, this.children, this.attributes, this.events, this.styles})
      : _tag = 'md-primary-tab';

  /// [Tab.secondary] representa el componente `tab` secundario.
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
