import 'package:flutter/material.dart';

Widget ContainerView() {
  return Container();
}

Widget buildInputAccount(
        {required String text,
        required IconData icon,
        Icon? eye,
        Color color = Colors.white}) =>
    Container(
      width: 380,
      height: 60,
      color: color,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
        ],
      ),
    );
