import 'package:flutter/material.dart';
import 'package:grocery_app/shared/components/categories.dart';
import 'package:grocery_app/shared/components/login_comp.dart';

class HomePage extends StatelessWidget {
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
  List<ItemModelColumn> categoryItem = [
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
    ItemModelColumn(
      name: "Fresh Peach",
      price: "\$ 220",
      urlImage: "assets/img/fresh.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 51),
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: 10,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/img/home.png",
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 180,
                  left: 20,
                  child: Text(
                    "20% off on your \n first purchase",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              flex: 1,
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
              flex: 2,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 6 / 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 5),
                  itemCount: categoryItem.length,
                  itemBuilder: (context, index) =>
                      itemColumnCategory(categoryItem[index])),
            ),
          ],
        ),
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

class ItemModelColumn {
  String urlImage;
  String name;
  String? price;

  ItemModelColumn(
      {required this.name, required this.price, required this.urlImage});
}
