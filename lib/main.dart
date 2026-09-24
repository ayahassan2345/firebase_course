import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FirebaseCourse());
}

class FirebaseCourse extends StatelessWidget {
  const FirebaseCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.pinkAccent),
      ),
    );
  }
}
