import 'package:jaspr/jaspr.dart';

/// Representa el componente [Switch](https://material-web.dev/components/switch/) de Material Web Components.
class Switch extends Component {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  const Switch({
    super.key,
    this.attributes,
    this.cssClass,
    this.styles,
    this.events,
  });

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        tag: "md-switch",
        classes: cssClass,
        attributes: attributes,
        styles: styles,
        events: events,
      ),
    );
  }
}
