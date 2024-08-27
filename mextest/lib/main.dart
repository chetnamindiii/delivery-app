import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mextest/screens/payment.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3cHNlaYXiJib4fnqluWcPNBoS2WyGLqk",
          authDomain: "mextest-c214b.firebaseapp.com",
          projectId: "mextest-c214b",
          storageBucket: "mextest-c214b.appspot.com",
          messagingSenderId: "401011444316",
          appId: "1:401011444316:web:2da6db24ce127e075d7499"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/payment': (context) => PaymentScreen(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }




