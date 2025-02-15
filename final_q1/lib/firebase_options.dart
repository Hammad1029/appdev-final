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
    apiKey: 'AIzaSyDEGYlBdl0ZGez5BQPcQJ_BoVu0K8D3pMo',
    appId: '1:419655159340:web:c9227e4aa68f275fe80b89',
    messagingSenderId: '419655159340',
    projectId: 'appdev-a37d3',
    authDomain: 'appdev-a37d3.firebaseapp.com',
    storageBucket: 'appdev-a37d3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlgD4oEyO3adlUl2SbHew-blLpia7yJmg',
    appId: '1:419655159340:android:46cd63f52e8ef5f9e80b89',
    messagingSenderId: '419655159340',
    projectId: 'appdev-a37d3',
    storageBucket: 'appdev-a37d3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABFJF6XBAPWGCdEzjOVNB9Z5m-IMWVR3U',
    appId: '1:419655159340:ios:552959dcea717c11e80b89',
    messagingSenderId: '419655159340',
    projectId: 'appdev-a37d3',
    storageBucket: 'appdev-a37d3.appspot.com',
    iosBundleId: 'com.example.firebaseTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABFJF6XBAPWGCdEzjOVNB9Z5m-IMWVR3U',
    appId: '1:419655159340:ios:552959dcea717c11e80b89',
    messagingSenderId: '419655159340',
    projectId: 'appdev-a37d3',
    storageBucket: 'appdev-a37d3.appspot.com',
    iosBundleId: 'com.example.firebaseTodo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEGYlBdl0ZGez5BQPcQJ_BoVu0K8D3pMo',
    appId: '1:419655159340:web:759c29ed16ebab7fe80b89',
    messagingSenderId: '419655159340',
    projectId: 'appdev-a37d3',
    authDomain: 'appdev-a37d3.firebaseapp.com',
    storageBucket: 'appdev-a37d3.appspot.com',
  );

}