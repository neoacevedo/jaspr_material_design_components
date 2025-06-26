# Componente `Tabs` y `Tab` (Jaspr Material Design Components)

Este componente implementa los tabs de [Material Web Components](https://material-web.dev/components/tabs/) para Jaspr. Permite crear interfaces con pestañas (tabs) y paneles asociados, siguiendo las mejores prácticas de accesibilidad y diseño.

---

## Importación

```dart
import 'package:jaspr_material_design_components/jaspr_material_design_components.dart';
```

---

## Uso Básico

```dart
Tabs(
  attributes: {
    'aria-label': 'Content to view',
    'active-tab-index': '0', // Índice del tab activo inicial
  },
  children: [
    Tab.primary(
      attributes: {
        'id': 'photos-tab',
        'aria-controls': 'photos-panel',
      },
      children: [text('Photos')],
    ),
    Tab.primary(
      attributes: {
        'id': 'videos-tab',
        'aria-controls': 'videos-panel',
      },
      children: [text('Videos')],
    ),
    Tab.primary(
      attributes: {
        'id': 'music-tab',
        'aria-controls': 'music-panel',
      },
      children: [text('Music')],
    ),
  ],
)
```

### Paneles asociados

Cada tab debe tener un panel asociado, usando los atributos `aria-controls` (en el tab) y `aria-labelledby` (en el panel):

```dart
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
  'hidden': '' // Oculto por defecto
}),
div([
  text('Music')
], attributes: {
  'id': 'music-panel',
  'role': 'tabpanel',
  'aria-labelledby': 'music-tab',
  'hidden': '' // Oculto por defecto
}),
```

---

## Manejo de eventos

Puedes manejar el cambio de pestaña usando el evento `'change'`:

```dart
Tabs(
  key: tabKey,
  events: {
    'change': (event) {
      // Lógica para mostrar/ocultar paneles según el tab activo
    }
  },
  // ...otros parámetros
)
```

Consulta el ejemplo completo para ver cómo sincronizar el estado de los paneles con el tab activo.

---

## Ejemplo Completo

```dart
Tabs(
  key: tabKey,
  events: {
    'change': (event) {
      // Lógica para actualizar paneles
    }
  },
  attributes: {
    'aria-label': 'Content to view',
    'active-tab-index': '0'
  },
  children: [
    Tab.primary(
      attributes: {
        'id': 'photos-tab',
        'aria-controls': 'photos-panel'
      },
      children: [text('Photos')]
    ),
    Tab.primary(
      attributes: {
        'id': 'videos-tab',
        'aria-controls': 'videos-panel'
      },
      children: [text('Videos')]
    ),
    Tab.primary(
      attributes: {
        'id': 'music-tab',
        'aria-controls': 'music-panel'
      },
      children: [text('Music')]
    ),
  ]
),
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
}),
```

---

## Props principales

- **Tabs**
  - `children`: Lista de componentes `Tab`.
  - `attributes`: Mapa de atributos HTML (ej. `aria-label`, `active-tab-index`).
  - `events`: Mapa de eventos (ej. `'change'`).
  - `styles`: Estilos opcionales.

- **Tab.primary / Tab.secondary**
  - `children`: Contenido del tab.
  - `attributes`: Atributos HTML (ej. `id`, `aria-controls`).
  - `events`: Eventos opcionales.
  - `styles`: Estilos opcionales.

---

## Notas

- Usa `Tab.primary` para tabs principales y `Tab.secondary` para secundarios.
- Asegúrate de que los atributos `id` y `aria-controls` estén correctamente enlazados entre tabs y paneles.
- Puedes personalizar los estilos usando el parámetro `styles`.

---

## Referencias

- [Material Web Tabs](https://material-web.dev/components/tabs/)
- [Ejemplo en material_examples.dart](../example/jaspr_material_design_components_example.dart)