import 'package:jaspr/jaspr.dart';

/// Representa el componente [Radio](https://material-web.dev/components/radio/) de Material Web Components.
class Radio extends Component {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  Radio({super.key, this.attributes, this.cssClass, this.styles, this.events});

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        key: key,
        tag: "md-radio",
        classes: cssClass,
        attributes: attributes,
        styles: styles,
        events: events,
      ),
    );
  }
}
