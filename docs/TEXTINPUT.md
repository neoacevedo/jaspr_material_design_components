## Text Input

```dart
TextField(filled: true, attributes: {
    'label': 'Filled Text Field'
    }, children: [
        Icon('search', attributes: {'slot': 'leading-icon'})
]);

TextField(attributes: {
    'placeholder': 'Outlined Text Field'
    }, children: [
    Button.icon(
        attributes: {'slot': 'trailing-icon'},
        children: [Icon('visibility')])
]);

TextField(filled: true, attributes: {
    'label': 'Filled Text Area',
    'type': 'textarea',
    'rows': '3'
});

TextField(attributes: {
    'label': 'Outlined Text Area',
    'type': 'textarea',
    'rows': '3'
});
```