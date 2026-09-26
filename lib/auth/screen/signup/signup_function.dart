import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> register(
  BuildContext context, {
  required TextEditingController email,
  required TextEditingController password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    SnackBarUtils.showSuccess(context, message: 'register success');
    Future.delayed(Duration(seconds: 4), () {
      context.pushReplacement(AppRoute.home);
    });
  } on FirebaseAuthException catch (e) {
    
    if (e.code == 'weak-password') {
      SnackBarUtils.showError(
        context,
        message: 'The password provided is too weak.',
      );
    } else if (e.code == 'email-already-in-use') {
      SnackBarUtils.showError(
        context,
        message: 'The account already exists for that email.',
      );
    }
  }
}
