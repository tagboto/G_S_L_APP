import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9iDnH6dUT8jzFVhGolAtNtmFGQ4OCNbE",
            authDomain: "gsl-app-ca76d.firebaseapp.com",
            projectId: "gsl-app-ca76d",
            storageBucket: "gsl-app-ca76d.appspot.com",
            messagingSenderId: "892008815756",
            appId: "1:892008815756:web:3d751a9ec23b9522466fa9",
            measurementId: "G-GJ37YN9XC1"));
  } else {
    await Firebase.initializeApp();
  }
}
