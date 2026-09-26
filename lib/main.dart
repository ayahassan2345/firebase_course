import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/services/shared_prefs.dart';
import 'package:firebase_course/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  runApp(FirebaseCourse());
}

class FirebaseCourse extends StatefulWidget {
  const FirebaseCourse({super.key});

  @override
  State<FirebaseCourse> createState() => _FirebaseCourseState();
}

class _FirebaseCourseState extends State<FirebaseCourse> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.pinkAccent),
      ),
    );
  }
}
