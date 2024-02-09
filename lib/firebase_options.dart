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
/// 



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
    apiKey: 'AIzaSyA8xi2eviHEZoS6D3Ad4ZDRyvFsE3MHDNM',
    appId: '1:757076623560:web:5ff24837aeef1a262b65fd',
    messagingSenderId: '757076623560',
    projectId: 'gfgcollab',
    authDomain: 'gfgcollab.firebaseapp.com',
    storageBucket: 'gfgcollab.appspot.com',
    measurementId: 'G-217XJSVVC1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMGwnU_620qgTpyXwXe3ppXIPmHT8eyFs',
    appId: '1:757076623560:android:5c9bf2721aa065772b65fd',
    messagingSenderId: '757076623560',
    projectId: 'gfgcollab',
    storageBucket: 'gfgcollab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANxxyZrjRP_WfrzcYMRgIY6FABrCdK3YM',
    appId: '1:757076623560:ios:3c277b7ac89257b32b65fd',
    messagingSenderId: '757076623560',
    projectId: 'gfgcollab',
    storageBucket: 'gfgcollab.appspot.com',
    iosBundleId: 'com.example.gfgCollab',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANxxyZrjRP_WfrzcYMRgIY6FABrCdK3YM',
    appId: '1:757076623560:ios:79b2927ce273f8fb2b65fd',
    messagingSenderId: '757076623560',
    projectId: 'gfgcollab',
    storageBucket: 'gfgcollab.appspot.com',
    iosBundleId: 'com.example.gfgCollab.RunnerTests',
  );
}