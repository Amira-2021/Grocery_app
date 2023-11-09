import 'package:flutter/material.dart';
import 'package:grocery_app/shared/components/login_comp.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/img/signIn.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Welcome"),
            centerTitle: true,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          body: buildLoginRegisterForm(
              title: "Create Account",
              hint: "Quickly create Account",
              islogin: false,
              titleButtonText: "Login",
              hintButtonText: "Already have an account ?",
              titleButton: "Register",
              swt: false,
              contextNow: context),
        )
      ],
    );
  }
}
