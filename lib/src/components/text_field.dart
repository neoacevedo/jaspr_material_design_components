import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

/// Material Design 3 Text Field component.
///
/// Renders a native `<input>` or `<textarea>` element based on [inputType].
/// When [inputType] is `'textarea'`, renders a `<textarea>`; otherwise renders
/// an `<input>` with the given type attribute.
///
/// Visual variant is controlled by [filled]: `true` renders the filled variant,
/// `false` (default) renders outlined.
///
/// Leading and trailing icons are provided via [children] as elements that
/// carry the classes `md-text-field__icon` plus `md-text-field__icon--leading`
/// or `md-text-field__icon--trailing`. The element is placed in the flow
/// unchanged (leading before the input, trailing after it). Use any content
/// you like as the glyph (e.g. a `<span>` with `material-symbols-outlined`
/// or an inline `<svg>`):
/// ```dart
/// TextField(
///   label: 'Buscar',
///   children: [
///     span([Component.text('search')],
///         classes: 'material-symbols-outlined md-text-field__icon md-text-field__icon--leading'),
///   ],
/// )
/// ```
/// Children without an `md-text-field__icon-*` class are ignored.
class TextField extends StatefulComponent {
  /// The input type (e.g. `'text'`, `'email'`, `'password'`, `'textarea'`).
  ///
  /// When `'textarea'`, a `<textarea>` element is rendered. Otherwise an
  /// `<input>` with the given type is rendered (defaults to `'text'`).
  final String? inputType;

  /// The initial value of the text field.
  final String? value;

  /// Whether to render the filled variant (`true`) or outlined (`false`).
  final bool filled;

  /// The floating label text.
  final String? label;

  /// Placeholder text shown when the field is empty.
  final String? placeholder;

  /// Indicates there is an error
  final bool? error;

  /// Error message that replaces [supportingText] when set.
  final String? errorText;

  /// Whether the field is required.
  final bool? required;

  /// Whether the field is disabled.
  final bool? disabled;

  /// Whether the field is read-only.
  final bool? readOnly;

  /// Maximum length (characters) of the input value.
  final int? maxLength;

  /// Minimum length (characters) of the input value.
  final int? minLength;

  /// Validation pattern (regex) for the input value.
  final String? pattern;

  /// Number of visible text lines for a `<textarea>`.
  final int? rows;

  /// Visible width (average character widths) for a `<textarea>`.
  final int? cols;

  /// Text displayed before the input value.
  final String? prefixText;

  /// Text displayed after the input value.
  final String? suffixText;

  /// Supporting text displayed below the field.
  final String? supportingText;

  /// When `true`, hides the asterisk on the label for required fields.
  final bool? noAsterisk;

  /// Override the input text CSS `direction` (e.g. `'ltr'` or `'rtl'`).
  ///
  /// Useful for RTL languages that use LTR notation for fractions. Applies as
  /// an inline `direction` style on the `<input>`/`<textarea>` only, keeping
  /// the rest of the field's direction unchanged.
  final String? textDirection;

  /// When `true`, hides the number spinner for `type="number"`.
  final bool? noSpinner;

  /// Callback invoked on each input event with the current string value.
  final void Function(String value)? onInput;

  /// Callback invoked on change event with the current string value.
  final void Function(String value)? onChange;

  /// Callback invoked when the field receives focus.
  final void Function()? onFocus;

  /// Callback invoked when the field loses focus.
  final void Function()? onBlur;

  /// Additional HTML attributes applied to the input/textarea element.
  final Map<String, String>? attributes;

  /// Additional event listeners on the input/textarea element.
  final Map<String, EventCallback>? events;

  /// Inline CSS styles on the root container.
  final Styles? cssStyles;

  /// CSS class(es) on the root container.
  final String? cssClass;

  /// Child components.
  ///
  /// For leading/trailing icons, pass an element carrying the classes
  /// `md-text-field__icon` + `md-text-field__icon--leading` (before the input)
  /// or `md-text-field__icon--trailing` (after the input). The element is
  /// placed unchanged; the glyph is up to you (material-symbols span, svg…).
  /// Children without `md-text-field__icon-*` are ignored.
  final List<Component>? children;

  const TextField({
    super.key,
    this.inputType,
    this.value,
    this.filled = false,
    this.label,
    this.placeholder,
    this.error = false,
    this.errorText,
    this.required,
    this.disabled,
    this.readOnly,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.rows,
    this.cols,
    this.prefixText,
    this.suffixText,
    this.supportingText,
    this.noAsterisk,
    this.textDirection,
    this.noSpinner,
    this.onInput,
    this.onChange,
    this.onFocus,
    this.onBlur,
    this.attributes,
    this.events,
    this.cssStyles,
    this.cssClass,
    this.children,
  });

  @override
  State<TextField> createState() => _TextFieldState();
}

int _textFieldIdSequence = 0;

class _TextFieldState extends State<TextField> {
  bool _focused = false;

  late final String _inputId = 'md-text-field-${_textFieldIdSequence++}';

  bool get _isTextarea => component.inputType == 'textarea';
  String get _variant => component.filled ? 'filled' : 'outlined';
  bool get _hasError => component.error == true || component.errorText != null;
  bool get _isDisabled => component.disabled == true;

  String get _value => component.value ?? '';

  void _handleInput(web.Event event) {
    final value = (event.target as dynamic).value as String? ?? '';
    component.onInput?.call(value);
  }

  void _handleChange(web.Event event) {
    final value = (event.target as dynamic).value as String? ?? '';
    component.onChange?.call(value);
  }

  void _handleFocus(web.Event event) {
    setState(() => _focused = true);
    component.onFocus?.call();
  }

  void _handleBlur(web.Event event) {
    setState(() => _focused = false);
    component.onBlur?.call();
  }

  static String? _classesOf(Component child) {
    try {
      final dynamic c = child;
      final classes = c.classes;
      return classes is String ? classes : null;
    } on NoSuchMethodError {
      return null;
    }
  }

  static bool _hasIconClass(Component child, String variant) => (_classesOf(child) ?? '').split(' ').contains('md-text-field__icon--$variant');

  @override
  Component build(BuildContext context) {
    final isTextarea = _isTextarea;
    final variant = _variant;
    final hasValue = _value.isNotEmpty;
    final children = component.children ?? const <Component>[];
    final leadingIcons = children.where((c) => _hasIconClass(c, 'md-text-field--with-leading-icon ')).toList();
    final trailingIcons = children.where((c) => _hasIconClass(c, 'md-text-field--with-trailing-icon ')).toList();
    final hasLeading = leadingIcons.isNotEmpty;
    final hasTrailing = trailingIcons.isNotEmpty;
    final showLabel = component.label != null;

    final buffer = StringBuffer('md-text-field md-text-field--$variant');
    if (_focused) buffer.write(' focused');
    if (hasValue) buffer.write(' populated');
    if (_hasError) buffer.write(' error');
    if (_isDisabled) buffer.write(' disabled');
    if (hasLeading) buffer.write(' has-leading-icon');
    if (hasTrailing) buffer.write(' has-trailing-icon');
    if (!showLabel) buffer.write(' no-label');
    if (component.noSpinner == true) buffer.write(' no-spinner');
    if (component.cssClass != null) buffer.write(' ${component.cssClass}');
    final rootClass = buffer.toString();
    final inputId = component.attributes?['id'] ?? _inputId;

    final mergedEvents = <String, EventCallback>{
      'input': _handleInput,
      'change': _handleChange,
      'focus': _handleFocus,
      'blur': _handleBlur,
      if (component.events != null) ...component.events!,
    };

    final mergedAttrs = <String, String>{
      if (component.attributes != null) ...component.attributes!,
      'id': inputId,
      if (component.placeholder != null) 'placeholder': component.placeholder!,
      if (component.required == true) 'required': '',
      if (component.disabled == true) 'disabled': '',
      if (component.readOnly == true) 'readonly': '',
      if (component.maxLength != null) 'maxlength': component.maxLength.toString(),
      if (component.minLength != null) 'minlength': component.minLength.toString(),
      if (component.pattern != null) 'pattern': component.pattern!,
      if (!isTextarea && component.inputType != null) 'type': component.inputType!,
    };

    final inputStyles = component.textDirection == null || component.textDirection!.isEmpty ? null : Styles(raw: {'direction': component.textDirection!});

    Component inputElement;
    if (isTextarea) {
      final taAttrs = <String, String>{
        ...mergedAttrs,
        if (component.rows != null) 'rows': component.rows.toString(),
        if (component.cols != null) 'cols': component.cols.toString(),
      };
      inputElement = Component.element(
        tag: 'textarea',
        attributes: taAttrs,
        children: _value.isNotEmpty ? [.text(_value)] : [],
        events: mergedEvents,
        classes: 'md-text-field__input',
        styles: inputStyles,
      );
    } else {
      inputElement = Component.element(
        tag: 'input',
        attributes: {...mergedAttrs, if (component.value != null) 'value': component.value!},
        events: mergedEvents,
        classes: 'md-text-field__input',
        styles: inputStyles,
      );
    }

    final rootChildren = <Component>[
      if (leadingIcons.isNotEmpty) div(classes: 'md-text-field__start', [...leadingIcons]),

      div(classes: 'md-text-field__middle', [
        if (component.prefixText != null) span(classes: 'md-text-field__prefix', [.text(component.prefixText!)]),
        inputElement,
        if (showLabel)
          span(
            classes: 'md-text-field__label',
            attributes: {'for': inputId},
            [
              .text(component.label!),
              if (component.required == true && component.noAsterisk != true) span(classes: 'asterisk', [.text(' *')]),
            ],
          ),
        if (component.suffixText != null) span(classes: 'md-text-field__suffix', [.text(component.suffixText!)]),
      ]),

      if (trailingIcons.isNotEmpty) div(classes: 'md-text-field__end', [...trailingIcons]),
    ];

    final supportingText = _hasError ? component.errorText : component.supportingText;

    return div(classes: 'md-text-field-wrapper${_hasError ? ' error' : ''}', [
      div(classes: rootClass, styles: component.cssStyles, rootChildren),
      if (supportingText != null)
        div(classes: 'md-text-field__supporting-text', [
          span(classes: 'md-text-field__supporting-text-message', [.text(supportingText)]),
        ]),
    ]);
  }
}
