import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/services/shared_prefs.dart';
import 'package:firebase_course/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> login(
  BuildContext context, {
  required TextEditingController email,
  required TextEditingController password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    SnackBarUtils.showSuccess(context, message: 'Login success');
    Future.delayed(Duration(seconds: 4), () {
      context.pushReplacement(AppRoute.home);
    });
    SharedPrefs.setIsLoggedIn(isLoggedIn: true);
  } on FirebaseAuthException catch (e) {
    SnackBarUtils.showError(context, message: e.toString());
  }
}

Future<UserCredential?> signInWithGoogle(BuildContext context) async {
  try {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '969147271546-ulp3e2ek75ummen5c8sh6jrv4a4afivc.apps.googleusercontent.com',
    );
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    SnackBarUtils.showSuccess(context, message: 'Login success');
    Future.delayed(Duration(seconds: 4), () {
      context.pushReplacement(AppRoute.home);
    });
    SharedPrefs.setIsLoggedIn(isLoggedIn: true);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    log('$e');
    SnackBarUtils.showError(context, message: e.toString());
    return null;
  }
}
