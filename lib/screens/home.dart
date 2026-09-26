import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/constant/app_text_style.dart';
import 'package:firebase_course/core/services/shared_prefs.dart';
import 'package:firebase_course/core/utils/snackbar_utils.dart';
import 'package:firebase_course/screens/edit.dart';
import 'package:firebase_course/screens/notes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Edit()),
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text('home', style: AppTextStyle.appTextStyle),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              SnackBarUtils.showSuccess(context, message: 'Logout success');
              SharedPrefs.setIsLoggedIn(isLoggedIn: false);
              Future.delayed(Duration(seconds: 4), () {
                context.pushReplacement(AppRoute.login);
              });
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(children: [card(context)]),
      ),
    );
  }

  Widget card(BuildContext context) {
    return InkWell(
      onLongPress: () {
        AwesomeDialog(
          context: context,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: 'are you sure delete',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
          btnOkColor: Colors.green,
          btnCancelColor: Colors.red,
        ).show();
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Notes()),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.folder, size: 100, color: Colors.pinkAccent),
              Text('Section', style: AppTextStyle.appTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
