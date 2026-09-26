import 'package:firebase_course/core/constant/app_route.dart';
import 'package:firebase_course/core/components/custombuttonauth.dart';
import 'package:firebase_course/core/components/customlogoauth.dart';
import 'package:firebase_course/core/components/textformfield.dart';
import 'package:firebase_course/auth/screen/signup/signup_function.dart';
import 'package:firebase_course/auth/validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomLogoAuth(),
              signupTitle(),
              loginDescription(),
              Form(
                key: formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    formField(
                      validator: (value) {
                        return FormValidation.nameValidator(value);
                      },
                      controller: user,
                      label: "User Name",
                      hint: 'Enter your User Name',
                    ),
                    formField(
                      validator: (value) {
                        return FormValidation.emailValidator(value);
                      },
                      controller: email,
                      label: "Email",
                      hint: 'Enter your Email',
                    ),
                    formField(
                      validator: (value) {
                        return FormValidation.passValidator(value);
                      },
                      controller: password,
                      label: "Password",
                      hint: 'Enter your Password',
                    ),
                  ],
                ),
              ),

              forgotPass(),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  title: "SignUp",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      register(context, email: email, password: password);
                    }
                  },
                ),
              ),
              haveAcc(context),
            ],
          ),
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

  Widget formField({
    required String label,
    required String hint,
    required TextEditingController controller,
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
