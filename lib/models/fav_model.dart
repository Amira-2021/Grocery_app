import 'package:flutter/material.dart';

class FavModel {
  final bool isFav;
  final String urlImage;
  final String name;
  final String price;
  VoidCallback? function;

  FavModel({
    required this.isFav,
    required this.urlImage,
    required this.name,
    required this.price,
  });
}
