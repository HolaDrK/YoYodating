import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD_CEp8w4kooFcnzBPz6auXtaJTO4L5nDI",
            authDomain: "yoyodating-6fa37.firebaseapp.com",
            projectId: "yoyodating-6fa37",
            storageBucket: "yoyodating-6fa37.appspot.com",
            messagingSenderId: "1030666251928",
            appId: "1:1030666251928:web:29ef6552acc794cb4baaed",
            measurementId: "G-7F7XM3N5F7"));
  } else {
    await Firebase.initializeApp();
  }
}
