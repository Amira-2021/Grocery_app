import 'package:flutter/material.dart';
import 'package:grocery_app/shared/components/login_comp.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/img/login.png",
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
              title: "Welcome Back!",
              hint: "Sign in to your account",
              swt: false,
              islogin: true,
              titleButton: "Login",
              hintButtonText: "Don't have an account ?",
              titleButtonText: "Register",
              contextNow: context),
        )
      ],
    );
  }
}
