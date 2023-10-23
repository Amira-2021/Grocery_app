import 'package:flutter/material.dart';
import 'package:grocery_app/screens/account/account_details/favourit.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/intro_screen.dart';
import 'package:grocery_app/shared/components/categories.dart';
import 'package:grocery_app/shared/components/login_comp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<ItemModelRow> itemRow = [
    ItemModelRow(
        name: "Vegetables",
        background: Color(0xFFE6F2EA),
        urlImage: "assets/img/veg.png"),
    ItemModelRow(
        name: "Fruits",
        background: Color(0xFFFFE9E5),
        urlImage: "assets/img/fru.png"),
    ItemModelRow(
        name: "Vegetables",
        background: Color(0xFFE6F2EA),
        urlImage: "assets/img/veg.png"),
    ItemModelRow(
        name: "Beverages",
        background: Color(0xFFFFF6E3),
        urlImage: "assets/img/bev.png"),
    ItemModelRow(
        name: "Grocery",
        background: Color(0xFFF3EFFA),
        urlImage: "assets/img/gro.png"),
    ItemModelRow(
        name: "Edible oil",
        background: Color(0xFFDCF4F5),
        urlImage: "assets/img/edi.png"),
    ItemModelRow(
        name: "Household",
        background: Color(0xFFFFE8F2),
        urlImage: "assets/img/flo.png"),
  ];

  static List<ItemModelColumn> categoryItem = [
    ItemModelColumn(
      name: "Fresh Peach",
      color: Color(0xFFFFCEC1),
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Avacoda",
      price: "\$ 220",
      color: Color(0xFFFCFFD9),
      urlImage: "assets/img/avacoda.png",
    ),
    ItemModelColumn(
      name: "Pineapple",
      price: "\$ 250",
      color: Color(0xFFFFE6C2),
      urlImage: "assets/img/pine.png",
    ),
    ItemModelColumn(
      name: "Black Grapes",
      price: "\$ 400",
      color: Color(0xFFFEE1ED),
      urlImage: "assets/img/black.png",
    ),
    ItemModelColumn(
      name: "Pomegranate",
      price: "\$ 220",
      color: Color(0xFFFFE3E2),
      urlImage: "assets/img/pom.png",
    ),
    ItemModelColumn(
      name: "Fresh B Roccoli",
      price: "\$ 220",
      color: Color(0xFFD2FFD0),
      urlImage: "assets/img/freb.png",
    ),
  ];

  void update() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 41,
            left: 17,
            right: 17,
          ),
          width: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: buildInputField(
                    color: Colors.grey.shade300,
                    hint: "Search keywords..",
                    icon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      "assets/img/home.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 120,
                    left: 20,
                    child: Text(
                      "20% off on your \n first purchase",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      size: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Expanded(
                flex: 2,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        itemRowCategory(itemRow[index]),
                    separatorBuilder: (context, index) => Container(
                          width: 10,
                        ),
                    itemCount: itemRow.length),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      size: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 6 / 5,
                            crossAxisSpacing: 5,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 5),
                    itemCount: categoryItem.length,
                    itemBuilder: (context, index) => itemColumnCategory(
                        categoryItem[index], index, update, context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
