import 'package:flutter/material.dart';
import 'package:grocery_app/models/item_modal_column.dart';

class DetailsView extends StatelessWidget {
  final ItemModelColumn model;

  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [],
      ),
    );
  }
}