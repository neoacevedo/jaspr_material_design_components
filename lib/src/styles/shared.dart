import 'package:jaspr/jaspr.dart';

List<StyleRule> get sharedStyles => [
  css(':root', [
    css('&').styles(
      radius: BorderRadius.all(
        Radius.circular(Unit.variable('--_container-shape')),
      ),
      boxSizing: BoxSizing.borderBox,
      display: Display.flex,
      flexDirection: FlexDirection.column,
      position: Position.relative(),
      zIndex: ZIndex(0),
    ),
  ]),
  css(
    'md-elevated-card, '
    'md-filled-card, '
    'md-outlined-card',
    [
      css('&').styles(
        radius: BorderRadius.all(
          Radius.circular(Unit.variable('--_container-shape')),
        ),
        boxSizing: BoxSizing.borderBox,
        display: Display.flex,
        flexDirection: FlexDirection.column,
        position: Position.relative(),
        zIndex: ZIndex(0),
      ),
    ],
  ),
  css(
    'md-elevated-card md-elevation,'
    'md-elevated-card .background,'
    'md-elevated-card .outline,'
    'md-filled-card md-elevation,'
    'md-filled-card .background,'
    'md-filled-card .outline,'
    'md-outlined-card md-elevation,'
    'md-outlined-card .background,'
    'md-outlined-card .outline',
    [
      css('&').styles(
        radius: BorderRadius.all(Radius.circular(Unit.expression('inherit'))),
        position: Position.absolute(),
        pointerEvents: PointerEvents.none,
        raw: {'inset': '0'},
      ),
    ],
  ),
  css(
    'md-elevated-card .background, md-filled-card .background, md-outlined-card .background',
  ).styles(
    backgroundColor: Color.variable('--_container-color'),
    zIndex: ZIndex(-1),
  ),
  css(
    'md-elevated-card .outline, md-filled-card .outline, md-outlined-card .outline',
  ).styles(
    border: Border(
      color: Color.rgba(0, 0, 0, 0),
      width: 1.px,
      style: BorderStyle.solid,
    ),
    zIndex: ZIndex(1),
  ),
  css(
    'md-elevated-card md-elevation, md-filled-card md-elevation, md-outlined-card md-elevation',
  ).styles(
    raw: {
      '--md-elevation-level': 'var(--_container-elevation)',
      '--md-elevation-shadow-color': 'var(--_container-shadow-color)',
    },
  ),
  css(
    'md-elevated-card .content-wrapper, md-filled-card .content-wrapper, md-outlined-card .content-wrapper',
  ).styles(
    radius: BorderRadius.all(Radius.circular(Unit.expression('inherit'))),
  ),
];
