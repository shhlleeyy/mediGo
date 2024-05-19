import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA5Fwnov5jXUW-RSg2bV7-GzAHH3R5wKbo",
            authDomain: "medigo-409910.firebaseapp.com",
            projectId: "medigo-409910",
            storageBucket: "medigo-409910.appspot.com",
            messagingSenderId: "617323383504",
            appId: "1:617323383504:web:5c0ee96134a9482865ecd5",
            measurementId: "G-0948LD354K"));
  } else {
    await Firebase.initializeApp();
  }
}
