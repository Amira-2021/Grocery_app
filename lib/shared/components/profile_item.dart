import 'package:flutter/material.dart';

Widget profileItemRow({
  required IconData icon,
  required String name,
  required Widget goToScreen,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => goToScreen,
          ));
    },
    child: Container(
      width: double.infinity,
      height: 40,
      padding: EdgeInsets.only(left: 25),
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: Colors.green,
              size: 22,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.navigate_next,
              color: Colors.green,
              size: 22,
            ),
          ),
        ],
      ),
    ),
  );
}
