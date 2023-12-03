import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCYBL_vQ_-UIoOeyARk-C_JKcnwJ8DNPDo",
            authDomain: "amygdala-dev.firebaseapp.com",
            projectId: "amygdala-dev",
            storageBucket: "amygdala-dev.appspot.com",
            messagingSenderId: "1065945532417",
            appId: "1:1065945532417:web:b97df5f3298c358372d800",
            measurementId: "G-2RR1KW3NW3"));
  } else {
    await Firebase.initializeApp();
  }
}
