import 'package:jaspr/jaspr.dart';

/// Representa el componente [Checkbox](https://material-web.dev/components/checkbox/) de Material Web Components.
class Checkbox extends Component {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  Checkbox({
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
        key: key,
        tag: "md-checkbox",
        classes: cssClass,
        attributes: attributes,
        styles: styles,
        events: events,
      ),
    );
  }
}
