import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'item_modal_column.g.dart';

@HiveType(typeId: 1)
class ItemModelColumn extends HiveObject {
  @HiveField(0)
  final String urlImage;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int? color;
  @HiveField(3)
  final String? price;
  @HiveField(4)
  bool isFavorite = false;

  ItemModelColumn({
    required this.name,
    required this.color,
    required this.price,
    required this.urlImage,
  });
}
