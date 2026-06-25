import 'package:jaspr/dom.dart' hide Animation;
import 'package:jaspr/jaspr.dart';

class Ripple extends StatelessComponent {
  final bool? disabled;
  final bool hovered;
  final bool pressed;

  const Ripple({
    super.key,
    this.disabled,
    this.hovered = false,
    this.pressed = false,
  });

  @override
  Component build(BuildContext context) {
    String rippleClasses = 'ripple';
    if (disabled == true) rippleClasses += ' disabled';
    if (hovered) rippleClasses += ' hovered';
    if (pressed) rippleClasses += ' pressed';

    return div(classes: rippleClasses, [
      span([], classes: 'ripple-element'),
      span([], classes: 'surface'),
    ]);
  }
}
