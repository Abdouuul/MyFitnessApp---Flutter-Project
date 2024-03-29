// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0TgOrpy7n4X-a-Y4yH7-eiWnw2kQB6QI',
    appId: '1:295693143380:web:8ea7377ad1fee694424cc1',
    messagingSenderId: '295693143380',
    projectId: 'sport-app-6b4cc',
    authDomain: 'sport-app-6b4cc.firebaseapp.com',
    storageBucket: 'sport-app-6b4cc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxgl4ZUpwtogQcY8FLaHzEkKRKS0d_3Fc',
    appId: '1:295693143380:android:291c91e82488cf07424cc1',
    messagingSenderId: '295693143380',
    projectId: 'sport-app-6b4cc',
    storageBucket: 'sport-app-6b4cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVHkxhKu5iItqh3bDyfngx3bwicQodM5g',
    appId: '1:295693143380:ios:051dacc48b41a9ce424cc1',
    messagingSenderId: '295693143380',
    projectId: 'sport-app-6b4cc',
    storageBucket: 'sport-app-6b4cc.appspot.com',
    iosClientId: '295693143380-j0n9i26e2n24ptf3gtp6rrrgokl9shj6.apps.googleusercontent.com',
    iosBundleId: 'com.sportapp-flutter.app',
  );
}
