import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Representa el componente [Checkbox](https://material-web.dev/components/checkbox/) de Material Web Components.
class Checkbox extends StatelessComponent {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  Checkbox({super.key, this.attributes, this.cssClass, this.styles, this.events});

  @override
  Component build(BuildContext context) {
    return Component.element(key: key, tag: "md-checkbox", classes: cssClass, attributes: attributes, styles: styles, events: events);
  }
}
