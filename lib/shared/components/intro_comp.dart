import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PagesIntro({
  required String image,
  required String title,
  required String details,
}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: Text(
            details,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        )
      ],
    ),
  );
}
