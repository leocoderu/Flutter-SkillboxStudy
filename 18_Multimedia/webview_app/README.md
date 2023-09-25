# vebview_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. Add to ios/Runner/Info.plist
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true />
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true />
</dict>

2. Change android/app/build.gradle
   minSdkVersion 21

3. Add dependencies in pubspec.yaml:
   flutter_inappwebview: ^5.7.2+3 

4. 
    