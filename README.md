<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

Material Design Web Components para Jaspr.

#### Donaciones:

<img title="" src="Litecoin.jpg" alt="" width="339" data-align="center">

Jaspr Material Design Components es un paquete primario que encapsula los componentes de [Material Web Components](https://materia-web.dev) haciendo uso del CDN.

Más componentes en camino.

## Getting started

Como prerrequisito, se tiene que tener instalado el SDK de Dart y Jaspr en su equipo. 

Instale el paquete con el comando `dart pub add jaspr_material_design_components` 

## Usage

Para los íconos, importe los estilos de las fuentes de Material Symbols agregando lo siguiente en el `head` del `Document` de su proyecto:

```dart
const StyleRule.import(
      'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200'),
const StyleRule.import(
      'https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200'),
const StyleRule.import(
      'https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200'),
const StyleRule.import(
      'https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap'),
```

Incluya el siguiente código en el último lugar dentro del método `build` de la clase `App` de su proyecto para inicializar los componentes web de Material: 

```dart
for (var element in JasprMaterialDesignComponents().materialScript()) {
      yield element;
}
```

Esto cargará los estilos y scripts para que los componentes de Material se puedan usar.

##### Componentes

- [Button](doc/BUTTON.md)
- [Card](doc/CARD.md)
- [Checkbox](doc/CHECKBOX.md)
- [Chip](doc/CHIP.md)
- [Dialog](doc/DIALOG.md)
- [Floating Action Button](doc/FAB.md)
- [ListTile](doc/LISTTILE.md) 
- [Menu](doc/MENU.md)
- [ProgressIndicator](doc/PROGRESSINDICATOR.md) 
- [Radio](doc/RADIO.md)
- [Text Input](doc/TEXTINPUT.md)
- [Switch](doc/SWITCH.md)
