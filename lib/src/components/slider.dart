import 'package:jaspr/jaspr.dart';

/// Representa el componente [Slider](https://material-web.dev/components/slider/) de Material Web Components.
///
/// Los Sliders pueden ser `continuos` o `discretos`, y pueden también representar un rango.
///
/// **Continuo**: Permite seleccionar un valor de rango subjetivo:
/// ```dart
/// Slider(attributes: {'min': '0', 'max': '100', 'value': '50'});
/// ```
/// **Discreto**: Permite seleccionar un valor específico de un rango predeterminado usando el atributo [ticks]. Se pueden usar las marcas para indicar los valores disponibles:
/// ```dart
/// Slider(attributes: {'min': '0', 'max': '100', 'value': '50', 'step': '5'}, ticks: true);
/// ```
/// **Rango**: El atributo [range] genera dos manejadores e indica un valor mínimo y máximo en un rango:
/// ```dart
/// Slider(attributes: {'value-start': '25', 'value-end': '50', 'value': '50'}, range: true);
/// ```
class Slider extends Component {
  final String? cssClass;

  final Map<String, String>? attributes;

  final Styles? styles;

  final bool? ticks;

  final bool? range;

  final bool? labeled;

  Slider({
    this.attributes,
    this.cssClass,
    this.styles,
    this.range = false,
    this.ticks = false,
    this.labeled = false,
  });

  @override
  Element createElement() {
    if (range == true) {
      attributes?['range'] = '';
    }

    if (ticks == true) {
      attributes?['ticks'] = '';
    }

    if (labeled == true) {
      attributes?['labeled'] = '';
    }

    return DomElement(
      DomComponent(
        tag: "md-slider",
        classes: cssClass,
        attributes: attributes,
        styles: styles,
      ),
    );
  }
}
