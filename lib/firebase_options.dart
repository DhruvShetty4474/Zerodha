// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAuPLXeRM9qFcj6Rv7PO2jkXCgBjkm-dDY',
    appId: '1:393981252818:web:6e3d5db7884483befac90b',
    messagingSenderId: '393981252818',
    projectId: 'zerodhaclone-69c64',
    authDomain: 'zerodhaclone-69c64.firebaseapp.com',
    storageBucket: 'zerodhaclone-69c64.firebasestorage.app',
    measurementId: 'G-BVDJQ58V31',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAB-sXTuCZyfm8B0ifWBc9H8Q3umWwE8XA',
    appId: '1:393981252818:android:88e4c96692403ce5fac90b',
    messagingSenderId: '393981252818',
    projectId: 'zerodhaclone-69c64',
    storageBucket: 'zerodhaclone-69c64.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJozccdiPoyqlG4Prc4FZ33NrL1xTt0LY',
    appId: '1:393981252818:ios:437ec8f237b8bac4fac90b',
    messagingSenderId: '393981252818',
    projectId: 'zerodhaclone-69c64',
    storageBucket: 'zerodhaclone-69c64.firebasestorage.app',
    iosBundleId: 'com.example.kite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJozccdiPoyqlG4Prc4FZ33NrL1xTt0LY',
    appId: '1:393981252818:ios:437ec8f237b8bac4fac90b',
    messagingSenderId: '393981252818',
    projectId: 'zerodhaclone-69c64',
    storageBucket: 'zerodhaclone-69c64.firebasestorage.app',
    iosBundleId: 'com.example.kite',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAuPLXeRM9qFcj6Rv7PO2jkXCgBjkm-dDY',
    appId: '1:393981252818:web:c38b196eb33e801cfac90b',
    messagingSenderId: '393981252818',
    projectId: 'zerodhaclone-69c64',
    authDomain: 'zerodhaclone-69c64.firebaseapp.com',
    storageBucket: 'zerodhaclone-69c64.firebasestorage.app',
    measurementId: 'G-6N5N4YRHN4',
  );
}
