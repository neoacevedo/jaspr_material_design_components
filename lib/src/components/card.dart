import 'package:jaspr/jaspr.dart';

abstract class _Card extends StatelessComponent {
  final Styles? cssStyles;

  final String? cssClass;

  final Map<String, String>? attributes;

  final List<Component>? children;

  static String _generateCardType(String cardType) {
    return 'md-$cardType-card';
  }

  final String _cardType; // Private final field

  _Card(
    String tag, {
    super.key,
    required this.children,
    this.cssStyles,
    this.cssClass,
    this.attributes,
  }) : _cardType = _generateCardType(tag);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      key: key,
      tag: _cardType,
      classes: cssClass,
      attributes: attributes,
      children: [
        DomComponent(tag: 'md-elevation'),
        div([], classes: 'background'),
        div([...children!], classes: 'content-wrapper'),
        div([], classes: 'outline'),
      ],
      styles: cssStyles,
    );
  }
}

/// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `elevated`.
class ElevatedCard extends _Card {
  ElevatedCard({
    required super.children,
    super.key,
    super.cssStyles,
    super.cssClass,
    super.attributes,
  }) : super('elevated');

  @css
  static final elevatedCardStyles = [
    css('md-elevated-card', [
      css('&').styles(
        raw: {
          '--md-elevated-card-container-elevation': '1',
          '--md-elevated-card-container-shadow-color':
              'var(--md-sys-color-shadow, #000)',
          '--md-elevated-card-container-shape':
              'var(--md-sys-shape-corner-medium, 12px)',
          '--_container-color':
              'var(--md-elevated-card-container-color, var(--md-sys-color-surface-container-low, #f7f2fa))',
          '--_container-elevation':
              'var(--md-elevated-card-container-elevation, 1)',
          '--_container-shadow-color':
              'var(--md-elevated-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
          '--_container-shape':
              'var(--md-elevated-card-container-shape, var(--md-sys-shape-corner-medium, 12px))',
          '--md-elevated-card-container-color':
              'var(--md-sys-color-surface-container-low, #f7f2fa)',
          '--md-elevation-level': 'var(--_container-elevation)',
        },
      ),
    ]),
  ];
}

/// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `filled`.
class FilledCard extends _Card {
  FilledCard({
    required super.children,
    super.key,
    super.cssStyles,
    super.cssClass,
    super.attributes,
  }) : super('filled');

  @css
  static final filledCardStyles = [
    css('md-filled-card', [
      css('&').styles(
        raw: {
          '--_container-color':
              'var(--md-filled-card-container-color, var(--md-sys-color-surface-container-highest, #e6e0e9))',
          '--_container-elevation':
              'var(--md-filled-card-container-elevation, 0)',
          '--_container-shadow-color':
              'var(--md-filled-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
          '--_container-shape':
              'var(--md-filled-card-container-shape, var(--md-sys-shape-corner-medium, 12px))',
          '--md-filled-card-container-color':
              'var(--md-sys-color-surface-container-highest, #e6e0e9)',
          '--md-filled-card-container-elevation': '0',
          '--md-filled-card-container-shadow-color':
              'var(--md-sys-color-shadow, #000)',
          '--md-filled-card-container-shape':
              'var(--md-sys-shape-corner-medium, 12px)',
        },
      ),
    ]),
  ];
}

/// Representa el componente [Card](https://m3.material.io/components/cards/guidelines) en su forma `outlined`.
class OutlinedCard extends _Card {
  OutlinedCard({
    required super.children,
    super.key,
    super.cssStyles,
    super.cssClass,
    super.attributes,
  }) : super('outlined');

  @css
  static final outlinedCardStyles = [
    css('md-outlined-card', [
      css('&').styles(
        raw: {
          '--_container-color':
              'var(--md-outlined-card-container-color, var(--md-sys-color-surface, #fef7ff))',
          '--_container-elevation':
              'var(--md-outlined-card-container-elevation, 0)',
          '--_container-shadow-color':
              'var(--md-outlined-card-container-shadow-color, var(--md-sys-color-shadow, #000))',
          '--_container-shape':
              'var(--md-outlined-card-container-shape, var(--md-sys-shape-corner-medium, 12px))',
          '--_outline-color':
              'var(--md-outlined-card-outline-color, var(--md-sys-color-outline-variant, #cac4d0))',
          '--_outline-width': 'var(--md-outlined-card-outline-width, 1px)',
        },
      ),
      css('.outline').styles(
        raw: {
          'border-color': 'var(--_outline-color) !important',
          'border-width': 'var(--_outline-width) !important',
        },
      ),
    ]),
  ];
}
