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
    apiKey: 'AIzaSyAnzN0-uc7x9sLOBZuVQJYmjV14DH64mHo',
    appId: '1:675788311258:web:4086816465750cef1c73e3',
    messagingSenderId: '675788311258',
    projectId: 'metapal',
    authDomain: 'metapal.firebaseapp.com',
    databaseURL: 'https://metapal-default-rtdb.firebaseio.com',
    storageBucket: 'metapal.appspot.com',
    measurementId: 'G-V8JD3EEDT8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6Y3QuhIA3ikhxRKhm0ADTNEVRHTVm5I8',
    appId: '1:675788311258:android:1e03c865f75b13f01c73e3',
    messagingSenderId: '675788311258',
    projectId: 'metapal',
    databaseURL: 'https://metapal-default-rtdb.firebaseio.com',
    storageBucket: 'metapal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhCozmWqZKnwikIY0EFIONlCzA-muRw0o',
    appId: '1:675788311258:ios:9d9ba200d74097d11c73e3',
    messagingSenderId: '675788311258',
    projectId: 'metapal',
    databaseURL: 'https://metapal-default-rtdb.firebaseio.com',
    storageBucket: 'metapal.appspot.com',
    iosClientId: '675788311258-71gcq7d1465hcosf6jh1601firpm2a8h.apps.googleusercontent.com',
    iosBundleId: 'com.example.metapal',
  );
}
