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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC06qw3Rls4-MTLt1eeRfRhs5greHMgc0I',
    appId: '1:807646660063:web:a64ce7132bcc45bde6706a',
    messagingSenderId: '807646660063',
    projectId: 'flutter-app-backendmj',
    authDomain: 'flutter-app-backendmj.firebaseapp.com',
    storageBucket: 'flutter-app-backendmj.appspot.com',
    measurementId: 'G-120FH52HZ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn4ZjqdU4nejIHqPmpwMOCIshw1rGF0pg',
    appId: '1:807646660063:android:50cbb7f769ec6df2e6706a',
    messagingSenderId: '807646660063',
    projectId: 'flutter-app-backendmj',
    storageBucket: 'flutter-app-backendmj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBn7iPVvcT5Gpy3eD8HXO13jlVJEM-n5DU',
    appId: '1:807646660063:ios:12ab7a60146f05f0e6706a',
    messagingSenderId: '807646660063',
    projectId: 'flutter-app-backendmj',
    storageBucket: 'flutter-app-backendmj.appspot.com',
    iosBundleId: 'com.example.mysecondproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC06qw3Rls4-MTLt1eeRfRhs5greHMgc0I',
    appId: '1:807646660063:web:f1ce98808d9ff558e6706a',
    messagingSenderId: '807646660063',
    projectId: 'flutter-app-backendmj',
    authDomain: 'flutter-app-backendmj.firebaseapp.com',
    storageBucket: 'flutter-app-backendmj.appspot.com',
    measurementId: 'G-K0FZN0VG1J',
  );
}
