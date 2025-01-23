import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBpi2ur8tsszEA91xDFWpA-ebUXcfo5Si8",
            authDomain: "qusine-61a5f.firebaseapp.com",
            projectId: "qusine-61a5f",
            storageBucket: "qusine-61a5f.firebasestorage.app",
            messagingSenderId: "26231385987",
            appId: "1:26231385987:web:5211e3c390d427700bd0b6",
            measurementId: "G-CV1RX7MCG5"));
  } else {
    await Firebase.initializeApp();
  }
}
