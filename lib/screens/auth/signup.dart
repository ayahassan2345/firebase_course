import 'package:firebase_course/core/app_route.dart';
import 'package:firebase_course/core/components/custombuttonauth.dart';
import 'package:firebase_course/core/components/customlogoauth.dart';
import 'package:firebase_course/core/components/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLogoAuth(),
            signupTitle(),
            loginDescription(),
            formField(label: "User Name", hint: 'Enter your User Name'),
            formField(label: "Email", hint: 'Enter your Email'),
            formField(label: "Password", hint: 'Enter your Password'),
            forgotPass(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(title: "SignUp", onPressed: () {}),
            ),
            haveAcc(context),
          ],
        ),
      ),
    );
  }

  InkWell haveAcc(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacement(AppRoute.login);
      },
      child: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Have An Account ? "),
              TextSpan(
                text: "Login",
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

  Widget formField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        CustomTextForm(hinttext: hint, mycontroller: email),
      ],
    );
  }

  Text loginDescription() {
    return const Text(
      "SignUp To Continue Using The App",
      style: TextStyle(color: Colors.grey),
    );
  }

  Text signupTitle() {
    return const Text(
      "SignUp",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
