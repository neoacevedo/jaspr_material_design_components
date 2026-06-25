import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class FocusRing extends StatefulComponent {
  final String? htmlFor;
  final bool? visible;
  final bool? inward;
  final Map<String, String>? attributes;
  final Map<String, EventCallback>? events;

  const FocusRing({super.key, this.htmlFor, this.visible, this.inward, this.attributes, this.events});

  @override
  State<FocusRing> createState() => _FocusRingState();
}

class _FocusRingState extends State<FocusRing> {
  @override
  Component build(BuildContext context) {
    return div(
      classes: 'focus-ring',
      attributes: {
        if (component.htmlFor != null) 'for': component.htmlFor!,
        if (component.visible != null && component.visible!) 'visible': '',
        if (component.inward != null && component.inward!) 'inward': '',
        'aria-hidden': 'true',
        ...?component.attributes,
      },
      events: component.events,
      [],
    );
  }
}
