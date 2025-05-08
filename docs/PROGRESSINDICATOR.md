## Progress Indicator

```dart
p([
    text('Linear'),
    ProgressIndicator(ProgressIndicator.linear, value: 0.5),
]);
p([
    text('Linear Indeterminado'),
    ProgressIndicator(ProgressIndicator.linear, indeterminate: true),
]);
p([
    text('Circular'),
    ProgressIndicator(ProgressIndicator.circular, value: 0.75),
]);
p([
    text('Circular Indeterminado'),
    ProgressIndicator(
    ProgressIndicator.circular,
    indeterminate: true,
    ),
]);
```