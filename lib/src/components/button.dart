import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_material_design_components/jaspr_material_design_components.dart';
import 'package:jaspr_material_design_components/src/components/elevation.dart';
import 'package:universal_web/web.dart' as web;

enum _ButtonRippleState { inactive, touchDelay, holding, waitingForClick }

/// Representa los diferentes estados de los botones de [Material Web Components](https://material-web.dev/components/button/).
///
/// Representa tanto los botones normales como los Icon Button.
class Button extends StatefulComponent {
  final bool? disabled;

  final String? name;

  final bool? hasIcon;

  final String? href;

  final Target? target;

  final String? trailingIcon;

  final ButtonType? type;

  final bool? softDisabled;

  final Styles? cssStyles;

  final String? cssClass;

  final String? value;

  final Map<String, String>? attributes;

  final List<Component>? children;

  final Map<String, EventCallback>? events;

  final String _type;

  /// Renderiza un elevated [Button]
  Button.elevated({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'elevated-button';

  /// Renderiza un filled [Button]
  Button.filled({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'filled-button';

  /// Renderiza un outlined [Button]
  Button.outlined({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'outlined-button';

  /// Renderiza un text [Button]
  Button.text({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'text-button';

  /// Renderiza un tonal [Button]
  Button.filledTonal({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'filled-tonal-button';

  /// Renderiza un icon [Button]
  Button.icon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'icon-button';

  /// Renderiza un filled icon [Button]
  Button.filledIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'filled-icon-button';

  /// Renderiza un filled tonal icon [Button]
  Button.filledTonalIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'filled-tonal-icon-button';

  /// Renderiza un outlined icon [Button]
  Button.outlinedIcon({
    super.key,
    this.disabled,
    this.name,
    this.hasIcon,
    this.href,
    this.target,
    this.trailingIcon,
    this.type,
    this.softDisabled,
    this.cssStyles,
    this.cssClass,
    this.value,
    this.attributes,
    this.children,
    this.events,
  }) : _type = 'outlined-icon-button';

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _rippleHovered = false;
  bool _ripplePressed = false;
  int _pressStartTime = 0;
  Timer? _touchDelayTimer;

  _ButtonRippleState _rippleState = _ButtonRippleState.inactive;

  static const int minimumPressMs = 225;
  static const int touchDelayMs = 150;

  @override
  void dispose() {
    _touchDelayTimer?.cancel();
    super.dispose();
  }

  void _handlePointerDown(web.Event event) {
    if (component.disabled == true) return;

    final pe = event as web.PointerEvent;
    if (!pe.isPrimary) return;

    _pressStartTime = DateTime.now().millisecondsSinceEpoch;

    if (pe.pointerType == 'touch') {
      _rippleState = _ButtonRippleState.touchDelay;
      _touchDelayTimer = Timer(const Duration(milliseconds: touchDelayMs), () {
        if (_rippleState == _ButtonRippleState.touchDelay) {
          _rippleState = _ButtonRippleState.holding;
          setState(() => _ripplePressed = true);
        }
      });
    } else {
      _rippleState = _ButtonRippleState.waitingForClick;
      setState(() => _ripplePressed = true);
    }
  }

  void _handlePointerUp(web.Event event) {
    if (component.disabled == true) return;

    final pe = event as web.PointerEvent;
    if (!pe.isPrimary) return;

    _touchDelayTimer?.cancel();

    if (_rippleState == _ButtonRippleState.holding || _rippleState == _ButtonRippleState.waitingForClick) {
      _rippleState = _ButtonRippleState.inactive;
      _endPress();
    }
  }

  void _handlePointerEnter(web.Event event) {
    if (component.disabled == true) return;
    final pe = event as web.PointerEvent;
    if (pe.pointerType == 'touch') return;
    setState(() => _rippleHovered = true);
  }

  void _handlePointerLeave(web.Event event) {
    if (component.disabled == true) return;
    _touchDelayTimer?.cancel();
    setState(() {
      _rippleHovered = false;
      _ripplePressed = false;
    });
  }

  void _handlePointerCancel(web.Event event) {
    _touchDelayTimer?.cancel();
    _rippleState = _ButtonRippleState.inactive;
    setState(() => _ripplePressed = false);
  }

  Future<void> _endPress() async {
    final elapsed = DateTime.now().millisecondsSinceEpoch - _pressStartTime;
    if (elapsed >= minimumPressMs) {
      setState(() => _ripplePressed = false);
      return;
    }
    await Future.delayed(Duration(milliseconds: minimumPressMs - elapsed));
    if (mounted) {
      setState(() => _ripplePressed = false);
    }
  }

  @override
  Component build(BuildContext context) {
    final mergedAttributes = <String, String>{
      ...?component.attributes,
      if (component.disabled == true) 'disabled': '',
      if (component.name != null) 'name': component.name!,
      if (component.hasIcon == true) 'has-icon': '',
      if (component.trailingIcon != null) 'trailing-icon': component.trailingIcon!,
      if (component.softDisabled == true) 'soft-disabled': '',
      if (component.value != null) 'value': component.value!,
    };

    var buttonContent = component.children;

    if (buttonContent != null) {
      if (buttonContent.any((c) => c is Icon) && buttonContent.any((c) => c is Text)) {
        if (component.trailingIcon != null) {
          print(component.trailingIcon);
          buttonContent = [
            ...buttonContent.whereType<Text>().map((text) => span(classes: 'label', [text])),
            ...buttonContent.whereType<Icon>(),
          ];
        } else {
          buttonContent = buttonContent.map((c) => c is Text ? label(classes: 'label', [c]) : c).toList();
        }
      } else {
        buttonContent = buttonContent.map((c) => c is Text ? label(classes: 'label', [c]) : c).toList();
      }
    }

    return div(
      classes: '${component.cssClass ?? ''} ${component._type}',
      events: {
        'pointerdown': _handlePointerDown,
        'pointerup': _handlePointerUp,
        'pointerenter': _handlePointerEnter,
        'pointerleave': _handlePointerLeave,
        'pointercancel': _handlePointerCancel,
        ...?component.events,
      },
      [
        if (component._type.startsWith('outlined') || component._type.startsWith('text') == false) Elevation(),
        if (component._type.startsWith('outlined') == true) div([], classes: 'outline'),

        div(classes: 'background', []),
        FocusRing(htmlFor: component.href != null ? 'link' : 'button'),
        Ripple(disabled: component.disabled, hovered: _rippleHovered, pressed: _ripplePressed),
        component.href != null
            ? a(
                key: component.key,
                id: 'link',
                attributes: mergedAttributes,
                styles: component.cssStyles,
                href: component.href!,
                target: component.target,
                classes: 'button',
                [span(classes: 'touch', []), ...buttonContent!],
              )
            : button(key: component.key, id: 'button', attributes: mergedAttributes, styles: component.cssStyles, classes: 'button', type: component.type, [
                span(classes: 'touch', []),
                ...buttonContent!,
              ]),
      ],
    );
  }
}
