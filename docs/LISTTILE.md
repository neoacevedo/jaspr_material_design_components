## ListTile

```dart
ListTile(
    styles: Styles(maxWidth: 300.px),
    children: [
    ListTile.item(
        children: [
            text('Lit'),
            svg(
                [
                raw(
                    '<path fill="currentColor" d="m160 80v80l-40-40zm-40 40v80l40-40zm0-80v80l-40-40zm-40 40v80l40-40zm-40-40v80l40-40zm40-40v80l-40-40zm-40 120v80l-40-40zm-40-40v80l40-40z" />',
                ),
                ],
                styles: Styles(height: 24.px),
                viewBox: '0 0 160 200',
                attributes: {'slot': 'start'},
            )
        ],
    ),
    Divider(),
    ListTile.item(
        children: [
            text('Polymer'),
            Icon('polymer', attributes: {'slot': 'start'}),
        ],
    ),
    Divider(),
    ListTile.item(
        children: [
            text('Angular'),
            Icon('angular', attributes: {'slot': 'start'}),
        ],
    ),
]);
```