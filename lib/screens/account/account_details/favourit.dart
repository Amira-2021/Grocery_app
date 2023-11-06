import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/delete_cubit.dart';
import 'package:grocery_app/cubit/item_cubit.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/shared/components/categories.dart';
import 'package:grocery_app/shared/components/favorite_item.dart';
import 'package:grocery_app/shared/components/item_column_catagory.dart';

class FavouritScreen extends StatefulWidget {
  final ItemModelColumn model;

  const FavouritScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  void updatefav() {
    setState(() {});
    // BlocProvider.of<ItemCubit>(context).addItem(widget.itemModelColumn);
  }

  void initState() {
    BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          actions: [
            BlocBuilder<DeleteCubit, DeleteState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<DeleteCubit>(context).removeAllNotes();
                      BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
                    },
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.black,
                      ),
                    ));
              },
            )
          ],
        ),
        body: BlocBuilder<ReadItemCubit, ReadItemState>(
          builder: (context, state) {
            List<ItemModelColumn> items =
                BlocProvider.of<ReadItemCubit>(context).list ?? [];

            BlocProvider.of<ReadItemCubit>(context).fetchAllItem();

            return Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              child: ListView.builder(
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: Icon(Icons.check),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (DismissDirection direction) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm delete"),
                            content: Text("Are Sure you want to delete"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("Delete")),
                            ],
                          );
                        });
                  },
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      items.removeAt(index).delete();
                      BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
                    }
                  },
                  secondaryBackground: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.red,
                      width: 100,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 350),
                        child: Icon(
                          Icons.delete,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  child: favoriteItem(
                    itemModelColumn: items[index],
                    weight: 20,
                  ),
                ),
                itemCount: items.length,
              ),
            );
          },
        ));
  }
}
