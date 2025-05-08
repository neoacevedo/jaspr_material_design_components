## Botones

```dart
Button.elevated(children: [
    Icon('home', attributes: {'slot': 'icon'}),
    text('Elevated')
]);

Button.filled(children: [
    Icon('home', attributes: {'slot': 'icon'}),
    text('Filled')
]);

Button.outlined(children: [
    Icon('home', attributes: {'slot': 'icon'}),
    text('Outlined')
]);

Button.text(children: [
    Icon('home', attributes: {'slot': 'icon'}),
    text('Text')
]);

Button.filledTonal(children: [
    Icon('home', attributes: {'slot': 'icon'}),
    Text('Tonal')
]);

Button.icon(attributes: {'slot': 'trailing-icon'},
            children: [Icon('visibility')]);
```