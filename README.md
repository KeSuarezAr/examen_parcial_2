## Descripción

Esta es una aplicación Flutter que utiliza el patrón Provider para la gestión del estado. Incluye una lista de tareas donde los usuarios pueden agregar, editar y eliminar tareas.

## Ejecución del Proyecto

Para ejecutar este proyecto, sigue estos pasos:

1. Clona el repositorio: `git clone https://github.com/KeSuarezAr/examen_parcial_2.git`
2. Navega al directorio del proyecto: `cd examen_parcial_2`
3. Obtén las dependencias: `flutter pub get`
4. Ejecuta la aplicación: `flutter run`

## Uso del Patrón Provider

El patrón Provider se utiliza en este proyecto para la gestión del estado. Nos permite proporcionar datos y funcionalidad a los widgets que lo necesitan, sin tener que pasarlos manualmente a través del árbol de widgets.

Usamos `ChangeNotifierProvider` para proporcionar instancias de nuestra clase `TareaProvider` a los widgets que lo necesitan. Esta clase extiende `ChangeNotifier` y gestiona una lista de objetos `Tarea`.

Los widgets pueden consumir este proveedor utilizando el widget `Consumer` o los métodos `context.watch` y `context.read`. Esto les permite reaccionar a los cambios en `TareaProvider` y llamar a métodos sobre él.

Por ejemplo, nuestro widget `ListaTareas` utiliza un `Consumer` para construir una lista de tareas basada en el estado actual de `TareaProvider`.
