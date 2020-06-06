# ping_identity

Flutter plugin for the Ping Identity SDK.

## Development

### Android

Add the `nexusUsername` and `nexusPassword` credentials to your `android/local.properties` file

### iOS

To be implemented.

## Getting started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Roadmap

### Example app

Provide a minimal usage example of the plugin.

### Make public

Decouple the implementation from DNB's private Nexus/CocoaPods repositories and let the user provide their own SDK.

### EventChannels

Right now the plugin is just a basic port from the Android and iOS SDKs. To allow for more advanced use, the plugin should expose EventChannels to Dart to allow for usage of streams.

### Explore macOS, web implementations

The plugin could expand to provide desktop/web implementations, however this is not covered by Ping Identity SDKs and requires custom implementations. Feasibility to be explored.
