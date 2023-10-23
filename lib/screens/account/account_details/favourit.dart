import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/shared/components/categories.dart';
import 'package:grocery_app/shared/components/favorite_item.dart';

class FavouritScreen extends StatefulWidget {
  ItemModelColumn itemModelColumn;
  FavouritScreen({required this.itemModelColumn});

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  void updatefav() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> favItem = [
      favoriteItem(
        itemModelColumn: ItemModelColumn(
          name: widget.itemModelColumn.name,
          color: widget.itemModelColumn.color,
          price: widget.itemModelColumn.price,
          urlImage: widget.itemModelColumn.urlImage,
        ),
        weight: 20,
      ),
      favoriteItem(
        itemModelColumn: ItemModelColumn(
          name: widget.itemModelColumn.name,
          color: widget.itemModelColumn.color,
          price: widget.itemModelColumn.price,
          urlImage: widget.itemModelColumn.urlImage,
        ),
        weight: 20,
      ),
      favoriteItem(
        itemModelColumn: ItemModelColumn(
          name: widget.itemModelColumn.name,
          color: widget.itemModelColumn.color,
          price: widget.itemModelColumn.price,
          urlImage: widget.itemModelColumn.urlImage,
        ),
        weight: 20,
      ),
      favoriteItem(
        itemModelColumn: ItemModelColumn(
          name: widget.itemModelColumn.name,
          color: widget.itemModelColumn.color,
          price: widget.itemModelColumn.price,
          urlImage: widget.itemModelColumn.urlImage,
        ),
        weight: 20,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Favorites",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade200,
        child: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: ValueKey(favItem[index]),
            child: favItem[index],
            background: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              child: Icon(Icons.check),
            ),
            direction: DismissDirection.endToStart,
            secondaryBackground: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 350),
                  child: Icon(
                    Icons.delete,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
          itemCount: favItem.length,
        ),
      ),
    );
  }
}
