import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/shared/components/account_comp.dart';
import 'package:grocery_app/shared/components/general_button.dart';
import 'package:grocery_app/shared/components/login_comp.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "About Me",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Container(
              width: 381,
              height: 290,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 381,
                    height: 220,
                    child: Column(
                      children: [
                        buildInputAccount(
                            icon: Icons.account_circle, text: "Russell Austin"),
                        buildInputAccount(
                            text: "russell.partner@gmail.com",
                            icon: Icons.email),
                        buildInputAccount(
                            text: "+1  202  555  0142 ", icon: Icons.call)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 381,
              height: 290,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 381,
                    height: 220,
                    child: Column(
                      children: [
                        buildInputAccount(
                            icon: Icons.lock, text: "Current password"),
                        buildInputAccount(text: "* * * *", icon: Icons.lock),
                        buildInputAccount(
                            text: "Confirm password ", icon: Icons.lock)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(top: 20),
              child: generalButton(
                  title: "Save Setting",
                  screen: HomePage(),
                  contextNow: context),
            )
          ],
        ),
      ),
    );
  }
}
