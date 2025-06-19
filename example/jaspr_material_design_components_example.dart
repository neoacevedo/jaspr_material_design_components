import 'package:jaspr/server.dart';
import 'package:universal_web/web.dart' hide Text, Document;
import 'package:jaspr_material_design_components/jaspr_material_design_components.dart';

void main() {
  Jaspr.initializeApp();

  runApp(
    Document(
      title: 'jaspr_material_design_components_example',
      body: DomComponent(tag: 'body', child: App()),
      styles: [...App.styles],
    ),
  );
}

@client
class App extends StatefulComponent {
  const App();

  @override
  State<App> createState() => _AppState();

  @css
  static final styles = [
    css('.group', [css('&').styles(padding: Spacing.all(16.px))]),
  ];
}

class _AppState extends State<App> {
  // State variable to control the dialog's open/closed state
  Map<String, String> dialogAttributes = {};

  // Variable Key para identificar al componente Dialog.
  final GlobalNodeKey<HTMLFormElement> myDialogKey = GlobalNodeKey();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      div(
          styles: Styles(
              display: Display.grid,
              gridTemplate: GridTemplate(
                  columns: GridTracks([
                GridTrack(TrackSize.minmax(
                    TrackSize(50.percent), TrackSize.maxContent))
              ]))),
          [
            OutlinedCard(
              children: [
                h6([
                  text('Botones e inputs'),
                ], classes: 'md-typescale-headline-medium'),
                div([
                  Button.elevated(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      text('Elevated'),
                    ],
                  ),
                  Button.filled(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      text('Filled'),
                    ],
                  ),
                  Button.outlined(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      text('Outlined'),
                    ],
                  ),
                  Button.text(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      text('Text'),
                    ],
                  ),
                  Button.filledTonal(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      Text('Tonal'),
                    ],
                  ),
                  p([]),
                  TextField(
                    filled: true,
                    attributes: {'label': 'Filled Text Field'},
                    children: [
                      Icon('search', attributes: {'slot': 'leading-icon'}),
                    ],
                  ),
                  TextField(
                    attributes: {'placeholder': 'Outlined Text Field'},
                    children: [
                      Button.icon(
                        attributes: {'slot': 'trailing-icon'},
                        children: [Icon('visibility')],
                      ),
                    ],
                  ),
                  p([]),
                  TextField(
                    filled: true,
                    attributes: {
                      'label': 'Filled Text Area',
                      'type': 'textarea',
                      'rows': '3',
                    },
                  ),
                  TextField(
                    attributes: {
                      'label': 'Outlined Text Area',
                      'type': 'textarea',
                      'rows': '3',
                    },
                  ),
                  p([text('Checkbox y Radio')]),
                  Checkbox(attributes: {'touch-target': 'wrapper'}),
                  Checkbox(
                      attributes: {'touch-target': 'wrapper', 'checked': ''}),
                  Checkbox(
                    attributes: {
                      'touch-target': 'wrapper',
                      'indeterminate': ''
                    },
                  ),
                  br(),
                  Radio(attributes: {'name': 'animals', 'value': 'cats'}),
                  Radio(attributes: {'name': 'animals', 'value': 'dogs'}),
                  Radio(
                    attributes: {
                      'name': 'animals',
                      'value': 'birds',
                      'checked': ''
                    },
                  ),
                ]),
              ],
              cssClass: 'group',
            ),
            ElevatedCard(
              children: [
                h6([text('Chips')], classes: 'md-typescale-headline-medium'),
                div([
                  Chipset([
                    Chip.assist('Assist'),
                    Chip.filter('Filter', removable: false),
                    Chip.input('Input'),
                    Chip.suggestion('Suggestion'),
                  ]),
                ]),
              ],
              cssClass: 'group',
            ),
            FilledCard(
              children: [
                h6([text('ListTile')], classes: 'md-typescale-headline-medium'),
                div([
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
                          ),
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
                    ],
                  ),
                ]),
              ],
              cssClass: 'group',
            ),
            OutlinedCard(
              children: [
                h6([text('Menu')], classes: 'md-typescale-headline-medium'),
                div([
                  span([
                    Button.filled(
                      attributes: {'id': 'usage-anchor', 'anchor': 'anchor'},
                      // events: events(onClick: _showDialog),
                      children: [text('Set with idref')],
                    ),
                    Menu(
                      [
                        MenuItem([
                          div([text('Apple')],
                              attributes: {'slot': 'headline'}),
                        ]),
                        MenuItem([
                          div([text('Banana')],
                              attributes: {'slot': 'headline'}),
                        ]),
                        MenuItem([
                          div([text('Cucumber')],
                              attributes: {'slot': 'headline'}),
                        ]),
                      ],
                      attributes: {
                        'id': 'usage-menu',
                        'anchor': 'usage-anchor'
                      },
                      // attributes: menuAttributes,
                    ),
                  ], styles: Styles(position: Position.relative())),
                ]),
              ],
              cssClass: 'group',
            ),
            OutlinedCard(
              children: [
                h6([
                  text('Progress Indicators'),
                ], classes: 'md-typescale-headline-medium'),
                div([
                  p([
                    text('Linear'),
                    ProgressIndicator(ProgressIndicator.linear, value: 0.5),
                  ]),
                  p([
                    text('Linear Indeterminado'),
                    ProgressIndicator(ProgressIndicator.linear,
                        indeterminate: true),
                  ]),
                  p([
                    text('Circular'),
                    ProgressIndicator(ProgressIndicator.circular, value: 0.75),
                  ]),
                  p([
                    text('Circular Indeterminado'),
                    ProgressIndicator(
                      ProgressIndicator.circular,
                      indeterminate: true,
                    ),
                  ]),
                ]),
              ],
              cssClass: 'group',
            ),
            FilledCard(
              children: [
                h6([text('Dialogs')], classes: 'md-typescale-headline-medium'),
                div([
                  Button.elevated(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
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
                  Button.filled(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
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
                  br(),
                  br(),
                  Button.outlined(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      text('Diálogo Confirm'),
                    ],
                    events: events(
                      onClick: () {
                        setState(() {
                          dialogAttributes['type'] = 'confirm';
                          dialogAttributes['open'] = '';
                        });
                      },
                    ),
                  ),
                  Button.text(
                    children: [
                      Icon('home', attributes: {'slot': 'icon'}),
                      Text('Form'),
                    ],
                    events: events(
                      onClick: () {
                        setState(() {
                          dialogAttributes['open'] = '';
                          dialogAttributes['type'] = 'form';
                        });
                      },
                    ),
                  ),
                ]),
              ],
              cssClass: 'group',
            ),
            ElevatedCard(
              children: [
                h6([text('Sliders')], classes: 'md-typescale-headline-medium'),
                div([
                  span([
                    text('Continuo'),
                    Slider(
                        attributes: {'min': '0', 'max': '100', 'value': '50'}),
                  ]),
                  br(),
                  span([
                    text('Discreto'),
                    Slider(
                      attributes: {
                        'step': 5.toString(),
                        'min': '0',
                        'max': '20'
                      },
                      ticks: true,
                    ),
                  ]),
                  br(),
                  span([
                    text('Rango (con etiqueta de valor)'),
                    Slider(
                      attributes: {'value-start': '25', 'value-end': '50'},
                      range: true,
                      labeled: true,
                    ),
                  ]),
                ]),
              ],
              cssClass: 'group',
            ),
            OutlinedCard(children: [
              h6([
                text('Select'),
              ], classes: 'md-typescale-headline-medium'),
              Select.outlined(label: 'Select Outlined', children: [
                SelectOption(attributes: {'aria-label': 'blank'}),
                SelectOption(selected: true, value: 'apple', children: [
                  div(attributes: {'slot': 'headline'}, [text('Apple')])
                ]),
                SelectOption(value: 'tomato', children: [
                  div(attributes: {'slot': 'headline'}, [text('Tomato')])
                ]),
              ])
            ], cssClass: 'group')
          ]),
    ]);
    yield Dialog(
      key: myDialogKey,
      children: [
        text('Este es un diálogo'),
        if (dialogAttributes.containsKey('type') &&
            dialogAttributes['type'] == 'form')
          TextField(attributes: {'label': 'Input'}),
      ],
      attributes: dialogAttributes,
    );

    for (var element in JasprMaterialDesignComponents().materialScript()) {
      yield element;
    }

    // Usaremos javascript para mostrar el menu al hacer clic en el botón 'Menú', pero también se
    // puede usando los estados, como con los botones para mostrar el diálogo.
    yield DomComponent(
      tag: 'script',
      attributes: {'type': 'module'},
      child: raw(
        "const anchorEl = document.body.querySelector('#usage-anchor');\n"
        "const menuEl = document.body.querySelector('#usage-menu');\n"
        "anchorEl.addEventListener('click', () => { menuEl.open = !menuEl.open; });\n",
      ),
    );
  }
}
