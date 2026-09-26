import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/services/shared_prefs.dart';
import 'package:firebase_course/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      var isLoggedIn = SharedPrefs.getIsLoggedIn();
      if (isLoggedIn) {
        context.pushReplacement(AppRoute.home);
        SnackBarUtils.showSuccess(context, message: 'user is logedin');
      } else {
        context.pushReplacement(AppRoute.login);
        SnackBarUtils.showSuccess(context, message: 'uset is not logedin');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/logo.png')],
        ),
      ),
    );
  }
}
