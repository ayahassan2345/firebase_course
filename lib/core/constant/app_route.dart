import 'package:firebase_course/auth/screen/login/login.dart';
import 'package:firebase_course/auth/screen/reset_password.dart';
import 'package:firebase_course/auth/screen/signup/signup.dart';
import 'package:firebase_course/auth/screen/verify_email.dart';
import 'package:firebase_course/screens/edit.dart';
import 'package:firebase_course/screens/home.dart';
import 'package:firebase_course/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  //paths
  static String splash = '/';
  static String login = '/login';
  static String signUp = '/signup';
  static String verifyEmail = '/verifyemail';
  static String resetPassword = '/reset_password';
  static String home = '/home';
  static String edit = '/edit';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return const Login();
        },
      ),
      GoRoute(
        path: signUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUp();
        },
      ),
      GoRoute(
        path: verifyEmail,
        builder: (BuildContext context, GoRouterState state) {
          return const VerifyEmail();
        },
      ),
      GoRoute(
        path: resetPassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPassword();
        },
      ),
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: edit,
        builder: (BuildContext context, GoRouterState state) {
          return const Edit();
        },
      ),
    ],
  );
}
