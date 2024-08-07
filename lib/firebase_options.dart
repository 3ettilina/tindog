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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp5ctPXoJlNg21MdSeHmquaPqjunQGIXY',
    appId: '1:945523259593:android:939f6715e6fa269c45b518',
    messagingSenderId: '945523259593',
    projectId: 'tindog-4edd4',
    storageBucket: 'tindog-4edd4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpFfrg0QGWDa_oukKYy0Bt08ktP9CB5os',
    appId: '1:945523259593:ios:6554ba0b82a2aedb45b518',
    messagingSenderId: '945523259593',
    projectId: 'tindog-4edd4',
    storageBucket: 'tindog-4edd4.appspot.com',
    androidClientId: '945523259593-2jglieckd6phq9d57vonnvv0oete9gmj.apps.googleusercontent.com',
    iosClientId: '945523259593-s76hgc9p5emrek970cn3srpr6jfgipip.apps.googleusercontent.com',
    iosBundleId: 'com.tindog.app',
  );

}