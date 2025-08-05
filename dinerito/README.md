# dinerito

A new Flutter project.

## Getting Started

### Antes de ejecutar la app en local, asegurate de:

1. Crea y agregar las variables de entorno en un archivo .env `/lib/src/configuration/env/dev/.env`
2. Generar las variables de entorno con el siguiente comando:
    dart run build_runner clean && dart run build_runner build --delete-conflicting-outputs
3. Configura el proyecto para que apunte a las variables dev en la ruta: 

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
