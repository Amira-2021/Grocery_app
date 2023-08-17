import 'package:flutter/material.dart';
import 'package:grocery_app/screens/login_signIn/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool("showHome") ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final showHome;
  MyApp({required this.showHome});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: showHome ? HomeScreen() : IntoScreen(),
      home: LoginScreen(),
    );
  }
}
