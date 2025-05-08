## Dialog

```dart
// Variable de estado para controlar el atributo 'open' para controlar el estado de abierto/cerrado del diálogo,
// además de otros atributos que se pueden usar para personalizar el contenido del diálogo.
Map<String, String> dialogAttributes = {};

// Variable Key para identificar al componente Dialog.
final GlobalNodeKey<HTMLFormElement> myDialogKey = GlobalNodeKey();

div([
    Button.elevated(
        children: [
            text('Diálogo simple'),
        ],
        events: events(
            onClick: () {
                setState(() {
                    dialogAttributes['open'] = '';
                    dialogAttributes.remove('type');
                });
            },
        ),
    ),
    Button.elevated(
        children: [
            text('Alert'),
        ],
        events: events(
            onClick: () {
                setState(() {
                    dialogAttributes['type'] = 'alert';
                    dialogAttributes['open'] = '';
                });
            },
        ),
    ),
    Button.elevated(
        children: [
            text('Diálogo Confirm'),
        ],
        events: events(
            onClick: () {
                setState(() {
                    dialogAttributes['open'] = '';
                });
            },
        ),
    ),
    Button.elevated(
        children: [
            Text('Form'),
        ],
        events: events(
            onClick: () {
                setState(() {
                    dialogAttributes['open'] = '';
                    dialogAttributes['type'] = 'form'; // Usado únicamente para renderizar un input 
                });
            },
        ),
    ),
]);

Dialog(
    key: myDialogKey,
    children: [
    text('Este es un diálogo'),
    if (dialogAttributes.containsKey('type') &&
        dialogAttributes['type'] == 'form')
        TextField(attributes: {'label': 'Input'}),
    ],
    attributes: dialogAttributes,
);
```