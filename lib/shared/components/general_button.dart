import 'package:flutter/material.dart';

Widget generalButton(
        {required String title,
        required Widget screen,
        required BuildContext contextNow}) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            contextNow, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xFFEBFFD5),
              Color(0xFFAEDC81),
              Color(0xFF6CC51D),
            ])),
        width: double.infinity,
        height: 60,
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
