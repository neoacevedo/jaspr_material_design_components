import 'package:jaspr/server.dart' hide Element;
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

  // Declare el Map para los atributos del menú con setState.
  // Esto permite que el menú se abra y cierre al hacer clic en el botón.
  Map<String, String> menuAttributes = {
    'id': 'usage-menu2',
    'anchor': 'usage-anchor2',
  };

  // Variable Key para identificar al componente Dialog.
  final GlobalNodeKey<HTMLFormElement> myDialogKey = GlobalNodeKey();

  // Variable Key para identificar al componente Menu.
  final GlobalNodeKey<HTMLFormElement> menuKey = GlobalNodeKey();

  final GlobalNodeKey<HTMLElement> tabKey = GlobalNodeKey();

  // Variables para manejar el estado de los tabs.
  int activeTabIndex = 0; // Variable para almacenar el panel actual visible.
  int previousTabIndex =
      0; // Variable para almacenar el índice del tab anterior.

  HTMLElement? currentPanel;

  /// Cambia el estado de abierto/cerrado para el menú.
  void toggleMenu() {
    setState(() {
      if (menuKey.currentNode?.hasAttribute('open') == false) {
        menuAttributes['open'] = '';
      } else {
        menuAttributes.remove('open');
      }
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      div(classes: 'material-examples', [
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
              Checkbox(attributes: {'touch-target': 'wrapper', 'checked': ''}),
              Checkbox(
                attributes: {'touch-target': 'wrapper', 'indeterminate': ''},
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
                  children: [text('Set with idref')],
                ),
                Menu(
                  [
                    MenuItem([
                      div([text('Apple')], attributes: {'slot': 'headline'}),
                    ]),
                    MenuItem([
                      div([text('Banana')], attributes: {'slot': 'headline'}),
                    ]),
                    MenuItem([
                      div([text('Cucumber')], attributes: {'slot': 'headline'}),
                    ]),
                  ],
                  attributes: {
                    'id': 'usage-menu',
                    'anchor': 'usage-anchor',
                  },
                ),
              ], styles: Styles(position: Position.relative())),
            ]),
            div([
              span([
                Button.filled(
                  attributes: {'id': 'usage-anchor2'},
                  events: events(onClick: toggleMenu),
                  children: [text('Set with state change (setState)')],
                ),
                Menu(
                  key: menuKey,
                  [
                    MenuItem([
                      div([text('Apple')], attributes: {'slot': 'headline'}),
                    ]),
                    MenuItem([
                      div([text('Banana')], attributes: {'slot': 'headline'}),
                    ]),
                    MenuItem([
                      div([text('Cucumber')], attributes: {'slot': 'headline'}),
                    ]),
                  ],
                  attributes: menuAttributes,
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
                Slider(attributes: {'min': '0', 'max': '100', 'value': '50'}),
              ]),
              br(),
              span([
                text('Discreto'),
                Slider(
                  attributes: {'step': 5.toString(), 'min': '0', 'max': '20'},
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
          Select.outlined(label: 'Label', attributes: {
            'required': ''
          }, children: [
            SelectOption(attributes: {'aria-label': 'blank'}),
            SelectOption(selected: true, value: 'apple', children: [
              div(attributes: {'slot': 'headline'}, [text('Apple')])
            ]),
            SelectOption(value: 'tomato', children: [
              div(attributes: {'slot': 'headline'}, [text('Tomato')])
            ]),
          ])
        ], cssClass: 'group'),
        ElevatedCard(children: [
          h6([text('Tabs')], classes: 'md-typescale-headline-medium'),
          Tabs(key: tabKey, events: {
            'change': (event) {
              Element? root = tabKey.currentNode?.getRootNode() as Element?;

              // Se asegura de que el DOM se haya actualizado antes de continuar
              Future.microtask(() {
                // iteración para encontrar el índice del nuevo tab activo
                for (var i = 0; i < tabKey.currentNode!.children.length; i++) {
                  var tab = tabKey.currentNode?.children.item(i);
                  if (tab?.hasAttribute('active') == true) {
                    activeTabIndex = i;
                    break;
                  }
                }

                if (previousTabIndex != activeTabIndex) {
                  var previousPanelId = tabKey.currentNode?.children
                      .item(previousTabIndex)
                      ?.getAttribute('aria-controls');
                  currentPanel =
                      root?.querySelector('#$previousPanelId') as HTMLElement?;
                  // Oculta el panel del tab anterior
                  if (currentPanel != null) {
                    currentPanel?.setAttribute('hidden', '');
                  }
                }

                var panelId = tabKey.currentNode?.children
                    .item(activeTabIndex)
                    ?.getAttribute('aria-controls');

                currentPanel = root?.querySelector('#$panelId') as HTMLElement?;
                // Muestra el panel del nuevo tab activo
                if (currentPanel != null) {
                  currentPanel?.removeAttribute('hidden');
                  previousTabIndex = activeTabIndex;
                }
              });
            }
          }, attributes: {
            'aria-label': 'Content to view',
            'active-tab-index': '0'
          }, children: [
            Tab.primary(attributes: {
              'id': 'photos-tab',
              'aria-controls': 'photos-panel'
            }, children: [
              text('Photos')
            ]),
            Tab.primary(attributes: {
              'id': 'videos-tab',
              'aria-controls': 'videos-panel'
            }, children: [
              text('Videos')
            ]),
            Tab.primary(
                attributes: {'id': 'music-tab', 'aria-controls': 'music-panel'},
                children: [text('Music')]),
          ]),
          div([
            text('Photos')
          ], attributes: {
            'id': 'photos-panel',
            'role': 'tabpanel',
            'aria-labelledby': 'photos-tab'
          }),
          div([
            text('Videos')
          ], attributes: {
            'id': 'videos-panel',
            'role': 'tabpanel',
            'aria-labelledby': 'videos-tab',
            'hidden': ''
          }),
          div([
            text('Music')
          ], attributes: {
            'id': 'music-panel',
            'role': 'tabpanel',
            'aria-labelledby': 'music-tab',
            'hidden': ''
          })
        ], cssClass: 'group'),
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

    // Usaremos javascript para mostrar el menu al hacer clic en el botón 'Menú' mediante la referencia con su ID,
    // pero también se puede usando los estados, como con los botones para mostrar el diálogo.
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
