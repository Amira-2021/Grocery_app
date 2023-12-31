import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/account/account.dart';
import 'package:grocery_app/screens/account/account_details/favourit.dart';
import 'package:grocery_app/screens/account/account_details/order.dart';
import 'package:grocery_app/screens/card.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/shared/colors/color.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<dynamic> screens = [
    HomeScreen(),
    AccountScreen(),
    OrderScreen(),
    CardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {});
          index = value;
        },
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedIconTheme:
            IconThemeData(size: 30, color: ColorUse().primaryColor),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
    );
  }
}

class ItemModelRow {
  String urlImage;
  Color? background;
  String name;

  ItemModelRow(
      {required this.name, required this.background, required this.urlImage});
}
