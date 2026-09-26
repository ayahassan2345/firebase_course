import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/components/custombuttonauth.dart';
import 'package:firebase_course/core/components/customlogoauth.dart';
import 'package:firebase_course/core/components/textformfield.dart';
import 'package:firebase_course/auth/screen/login/login_function.dart';
import 'package:firebase_course/auth/validator.dart';
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
            formField(
              controller: email,
              hint: 'Enter your Email',
              validator: (value) {
                return FormValidation.emailValidator(value);
              },
              label: 'Email',
            ),
            formField(
              controller: password,
              hint: 'Enter your Password',
              validator: (value) {
                return FormValidation.passValidator(value);
              },
              label: 'Password',
            ),
            forgotPass(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                title: "login",
                onPressed: () {
                  login(context, email: email, password: password);
                },
              ),
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
      onPressed: () {
        signInWithGoogle(context);
      },
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

  Widget forgotPass() {
    return InkWell(
      onTap: () {
        context.push(AppRoute.resetPassword);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        alignment: Alignment.topRight,
        child: const Text("Forgot Password ?", style: TextStyle(fontSize: 14)),
      ),
    );
  }

  Widget formField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        CustomTextForm(
          validator: validator,
          hinttext: hint,
          controller: controller,
        ),
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
