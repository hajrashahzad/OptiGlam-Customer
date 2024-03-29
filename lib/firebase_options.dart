// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfYmVEHWjXCpjo0R9Ylpj0ikWPAukwRJ8',
    appId: '1:451404310347:web:56f6163fecb49904266ace',
    messagingSenderId: '451404310347',
    projectId: 'optiglam-customer-67b97',
    authDomain: 'optiglam-customer-67b97.firebaseapp.com',
    storageBucket: 'optiglam-customer-67b97.appspot.com',
    measurementId: 'G-WK6WGKVTS3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3mpmYo455FQeYbMkxP_jhvCovrJaXsCM',
    appId: '1:451404310347:android:64c6c2b933055cdc266ace',
    messagingSenderId: '451404310347',
    projectId: 'optiglam-customer-67b97',
    storageBucket: 'optiglam-customer-67b97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCL5nI2GOs0fdtTUOwmmF9c_4E8w8aGrnI',
    appId: '1:451404310347:ios:b966c1fc1686f4f3266ace',
    messagingSenderId: '451404310347',
    projectId: 'optiglam-customer-67b97',
    storageBucket: 'optiglam-customer-67b97.appspot.com',
    iosBundleId: 'com.example.optiglamcustomer',
  );
}
