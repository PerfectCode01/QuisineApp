// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
      apiKey: 'AIzaSyCoZbwN1nQsnIeuLxeLDemCKWrY2amfBko',
      appId: '1:26231385987:android:03242e9fa8c6be280bd0b6',
      messagingSenderId: '26231385987',
      projectId: 'qusine-61a5f',
      authDomain: '// Replace from firebase_options.dart',
      storageBucket: '// Replace from firebase_options.dart',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
        apiKey: 'AIzaSyCoZbwN1nQsnIeuLxeLDemCKWrY2amfBko',
        appId: '1:26231385987:android:03242e9fa8c6be280bd0b6',
        messagingSenderId: '26231385987',
        projectId: 'qusine-61a5f',
        storageBucket: 'qusine-61a5f.firebasestorage.app',
      );
    case TargetPlatform.iOS:
      return FirebaseOptions(
        apiKey: 'AIzaSyCoZbwN1nQsnIeuLxeLDemCKWrY2amfBko',
        appId: '1:26231385987:android:03242e9fa8c6be280bd0b6',
        messagingSenderId: '26231385987',
        projectId: 'qusine-61a5f',
        storageBucket: 'qusine-61a5f.firebasestorage.app',
        iosBundleId: '// Replace from firebase_options.dart',
      );
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
