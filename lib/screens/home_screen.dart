import 'package:flutter/material.dart';
import 'package:grocery_app/screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setBool("showHome", false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => IntoScreen()));
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Container(
          child: const Text(
            "Home Page",
            style: TextStyle(color: Colors.green, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
