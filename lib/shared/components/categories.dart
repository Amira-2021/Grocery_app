import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home.dart';

Widget? itemRowCategory(ItemModelRow? itemModel) => Container(
      width: 90,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: itemModel!.background,
                radius: 35,
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
Widget? itemColumnCategory(ItemModelColumn? itemModel) => Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New',
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
            ],
          ),
          Image.asset(itemModel!.urlImage, fit: BoxFit.cover),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                    size: 25,
                  )),
              Text(
                "Add to Cart",
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
