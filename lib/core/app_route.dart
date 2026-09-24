import 'package:firebase_course/screens/auth/login.dart';
import 'package:firebase_course/screens/auth/signup.dart';
import 'package:firebase_course/screens/edit.dart';
import 'package:firebase_course/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  //paths
  static String login = '/';
  static String signUp = '/signup';
  static String home = '/home';
  static String edit = '/edit';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
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
