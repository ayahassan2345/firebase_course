import 'package:firebase_course/core/app_route.dart';
import 'package:firebase_course/core/components/custombuttonauth.dart';
import 'package:firebase_course/core/components/customlogoauth.dart';
import 'package:firebase_course/core/components/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLogoAuth(),
            loginTitle(),
            loginDescription(),
            emailTxt(),
            pass(),
            forgotPass(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(title: "login", onPressed: () {}),
            ),
            google(),
            haveAcc(context),
          ],
        ),
      ),
    );
  }

  MaterialButton google() {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.pinkAccent,
      textColor: Colors.white,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login With Google  "),
          Image.asset("assets/images/4.png", width: 20),
        ],
      ),
    );
  }

  InkWell haveAcc(BuildContext context) {
    return InkWell(
      onTap: () {
      context.push(AppRoute.signUp);
      },
      child: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Don't Have An Account ? "),
              TextSpan(
                text: "Register",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container forgotPass() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      alignment: Alignment.topRight,
      child: const Text("Forgot Password ?", style: TextStyle(fontSize: 14)),
    );
  }

  Widget pass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        CustomTextForm(hinttext: "ُEnter Your Password", mycontroller: email),
      ],
    );
  }

  Widget emailTxt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        CustomTextForm(hinttext: "ُEnter Your Email", mycontroller: email),
      ],
    );
  }

  Text loginDescription() {
    return const Text(
      "Login To Continue Using The App",
      style: TextStyle(color: Colors.grey),
    );
  }

  Text loginTitle() {
    return const Text(
      "Login",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
