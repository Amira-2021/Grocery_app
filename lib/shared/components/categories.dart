import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/screens/account/account_details/favourit.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/shared/components/favorite_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget? itemRowCategory(
  ItemModelRow? itemModel,
) =>
    Container(
      width: 90,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: itemModel!.background,
                  radius: 25,
                ),
              ),
              Align(
                child: CircleAvatar(
                  backgroundColor: itemModel.background,
                  backgroundImage: AssetImage(itemModel!.urlImage),
                ),
              ),
            ],
          ),
          Text(
            itemModel!.name,
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
Widget? itemColumnCategory(ItemModelColumn? itemModel, int indexFav,
        VoidCallback fun, BuildContext context) =>
    GestureDetector(
      onTap: () {
        itemModel.isFavorite == true
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritScreen(
                    itemModelColumn: ItemModelColumn(
                        color: itemModel.color,
                        name: itemModel.name,
                        price: itemModel.price,
                        urlImage: itemModel.urlImage),
                  ),
                ))
            : Navigator();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'New',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                IconButton(
                    onPressed: () async {
                      fun();
                      itemModel!.isFavorite == true
                          ? itemModel!.isFavorite = false
                          : itemModel!.isFavorite = true;
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: itemModel!.isFavorite == true
                          ? Colors.red
                          : Colors.white,
                    ))
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: itemModel.color)),
                Image.asset(
                  itemModel!.urlImage,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              itemModel!.name,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              itemModel.price!,
              style: const TextStyle(fontSize: 15, color: Colors.green),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
              thickness: .5,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                    size: 25,
                  ),
                  Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
