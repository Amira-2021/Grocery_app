import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
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
