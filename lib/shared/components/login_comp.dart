import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/login_signIn/login_screen.dart';
import 'package:grocery_app/screens/login_signIn/sginIn_screen.dart';
import 'package:grocery_app/shared/components/general_button.dart';

Widget buildLoginRegisterForm({
  required String title,
  required String hint,
  required BuildContext contextNow,
  required String titleButton,
  required String titleButtonText,
  required String hintButtonText,
  bool islogin = false,
  bool swt = false,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: 440,
          color: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  hint,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildInputField(
                    hint: "Email Address",
                    icon: const Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 10,
                ),
                islogin
                    ? Container()
                    : buildInputField(
                        hint: "Enter your phone", icon: Icon(Icons.phone)),
                const SizedBox(
                  height: 10,
                ),
                islogin
                    ? buildInputField(
                        hint: "* * * * * * * *",
                        icon: const Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.grey,
                        ),
                        eye: const Icon(Icons.remove_red_eye))
                    : Container(),
                islogin
                    ? Row(
                        children: [
                          Switch(
                              value: swt,
                              onChanged: (value) {
                                swt = value;
                              }),
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 17),
                          ),
                          const Spacer(),
                          const Text(
                            "forget password",
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          ),
                        ],
                      )
                    : buildInputField(
                        hint: "* * * * * * * *",
                        icon: const Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.grey,
                        ),
                        eye: const Icon(Icons.remove_red_eye)),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: generalButton(
                      title: titleButton,
                      contextNow: contextNow,
                      screen: HomePage()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      hintButtonText,
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              contextNow,
                              MaterialPageRoute(
                                  builder: (context) => islogin
                                      ? SignInScreen()
                                      : LoginScreen()));
                        },
                        child: Text(
                          titleButtonText,
                          style: TextStyle(fontSize: 17, color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
Widget buildInputField(
        {required String hint,
        required Icon icon,
        Icon? eye,
        Color color = Colors.white}) =>
    Container(
      width: double.infinity,
      height: 60,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon,
            suffixIcon: eye,
            border: InputBorder.none,
          ),
        ),
      ),
    );
