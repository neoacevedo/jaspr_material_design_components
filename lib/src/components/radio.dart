import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Representa el componente [Radio](https://material-web.dev/components/radio/) de Material Web Components.
class Radio extends StatelessComponent {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  Radio({super.key, this.attributes, this.cssClass, this.styles, this.events});

  @override
  Component build(BuildContext context) {
    return Component.element(key: key, tag: "md-radio", classes: cssClass, attributes: attributes, styles: styles, events: events);
  }

  @css
  static final List<StyleRule> sharedStyles = [
    css('md-radio').styles(raw: {'margin': 'max(0px,(48px - var(--md-radio-icon-size, 20px))/2)'}),
  ];
}
