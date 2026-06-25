import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Representa el componente `select` de [Material Web Components](https://material-web.dev/components/select/).
class Select extends StatelessComponent {
  late final Map<String, String>? attributes;

  final List<Component>? children;

  final Styles? styles;

  final String _tag;

  final Map<String, EventCallback>? events;

  final String? label;

  /// Representa el tipo `filled` del componente.
  Select.filled({super.key, this.attributes, this.children, this.styles, this.events, this.label}) : _tag = 'md-filled-select';

  /// Representa el tipo `outlined` del componente.
  Select.outlined({super.key, this.attributes, this.children, this.styles, this.events, this.label}) : _tag = 'md-outlined-select';

  @override
  Component build(BuildContext context) {
    var customAttrs = attributes ?? {};
    customAttrs.addEntries({'label': label!}.entries);

    return Component.element(key: key, tag: _tag, attributes: customAttrs, styles: styles, events: events, children: children);
  }
}

/// Representa cada elemento `option` de un [Select].
class SelectOption extends StatelessComponent {
  final Map<String, String>? attributes;

  final List<Component>? children;

  final Styles? styles;

  final Map<String, EventCallback>? events;

  final String? value;

  final bool? selected;

  SelectOption({super.key, this.attributes, this.children, this.styles, this.events, this.value, this.selected = false});

  @override
  Component build(BuildContext context) {
    attributes?.addAll({if (value != null) 'value': value!, if (selected != false) 'selected': ''});

    return Component.element(tag: 'md-select-option', attributes: attributes, styles: styles, events: events, children: children);
  }
}
