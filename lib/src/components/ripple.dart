import 'package:jaspr/jaspr.dart';

/// Representa el componente [Ripple](https://material-web.dev/components/ripple/) de Material Web Components.
class Ripple extends Component {
  final bool? disabled;
  final String? htmlFor;
  final Styles? styles;
  final String? cssClass;
  final Map<String, String>? attributes;
  final Map<String, EventCallback>? events;

  const Ripple({
    super.key,
    this.disabled,
    this.htmlFor,
    this.styles,
    this.cssClass,
    this.attributes,
    this.events,
  });

  @override
  Element createElement() {
    if (disabled != null) {
      attributes?['disabled'] = '';
    }

    if (htmlFor != null) {
      attributes?['for'] = htmlFor!;
    }

    return DomElement(
      DomComponent(
        key: key,
        tag: 'md-ripple',
        attributes: attributes,
        styles: styles,
        classes: cssClass,
        events: events,
      ),
    );
  }
}
