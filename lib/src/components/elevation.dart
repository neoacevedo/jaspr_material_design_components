import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Elevation extends StatelessComponent {
  const Elevation({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'elevation', [div(classes: 'shadow', [])]);
  }
}
