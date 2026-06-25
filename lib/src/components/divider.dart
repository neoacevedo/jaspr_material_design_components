import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Representa el componente [Divider](https://material-web.dev/components/divider/) de Material Web Components.
class Divider extends StatelessComponent {
  final bool? insetStart;

  final bool? insetEnd;

  final String? cssClass;

  late final Map<String, String>? attributes;

  final Styles? styles;

  Divider({super.key, this.attributes, this.styles, this.cssClass, this.insetStart, this.insetEnd});

  @override
  Component build(BuildContext context) {
    Map<String, String> localAttributes = attributes ?? {};

    if (insetStart != null) {
      localAttributes['inset-start'] = '$insetStart';
    }

    if (insetEnd != null) {
      localAttributes['inset-end'] = '$insetEnd';
    }

    return Component.element(key: key, tag: 'md-divider', styles: styles, classes: cssClass, attributes: localAttributes);
  }
}
