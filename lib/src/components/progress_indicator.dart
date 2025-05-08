import 'package:jaspr/jaspr.dart';

/// Representa el componente [Progress Indicator](https://material-web.dev/components/progress-indicator/) de Material Web Components.
///
/// Hay dos tipos de indicadores: linear y circular. Con el atributo [type] y asignándole los valores [ProgressIndicator.circular] o [ProgressIndicator.linear]
/// generará las variantes de este componente.
///
/// Si se requiere que el modo indeterminado, con la propiedad [indeterminate] en `true` lo podrá generar.
///
/// Los indicadores indeterminados pueden intercalar entre cuatro colores _(primary, primary container, tertiary, tertiary container que es el predefinido)_
/// con la propiedad [fourColor] en `true`.
class ProgressIndicator extends Component {
  static final circular = 'circular';
  static final linear = 'linear';

  final num? buffer;
  final num? value;
  final num? max;
  final bool? indeterminate;
  final bool? fourColor;

  final String type;

  ProgressIndicator(
    this.type, {
    super.key,
    this.buffer,
    this.value,
    this.max,
    this.indeterminate,
    this.fourColor,
  });

  @override
  Element createElement() {
    Map<String, String> attributes = {};

    if (buffer != null) {
      attributes['buffer'] = buffer.toString();
    }

    if (value != null) {
      attributes['value'] = value.toString();
    }

    if (max != null) {
      attributes['max'] = max.toString();
    }

    if (indeterminate != null && indeterminate! == true) {
      attributes['indeterminate'] = '';
    }

    if (fourColor != null && fourColor! == true) {
      attributes['four-color'] = '';
    }

    return DomElement(
      DomComponent(key: key, tag: 'md-$type-progress', attributes: attributes),
    );
  }
}
