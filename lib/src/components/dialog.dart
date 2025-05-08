import 'package:jaspr/jaspr.dart';

/// Representa el componente [Dialog](https://material-web.dev/components/dialog/) de Material Web Components.
class Dialog extends Component {
  final String? id;

  late final List<Component>? headline;

  late final List<Component>? children;

  late final Map<String, String>? attributes;

  final Styles? styles;

  final String? cssClass;

  late final List<Component>? actions;

  Dialog({
    super.key,
    this.id,
    this.headline,
    this.children,
    this.attributes,
    this.styles,
    this.cssClass,
    this.actions,
  });

  @override
  Element createElement() {
    return DomElement(
      DomComponent(
        key: key,
        tag: 'md-dialog',
        classes: cssClass,
        attributes: attributes,
        styles: styles,
        children: [
          if (headline != null)
            div(headline!, attributes: {'slot': 'headline'}),
          if (children != null) div(children!, attributes: {'slot': 'content'}),
          if (actions != null) div(actions!, attributes: {'slot': 'actions'}),
        ],
      ),
    );
  }
}
