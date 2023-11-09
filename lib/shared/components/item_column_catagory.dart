import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/delete_cubit.dart';
import 'package:grocery_app/cubit/item_cubit.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/account/account_details/favourit.dart';
import 'package:grocery_app/screens/details_item.dart';

class ItemColumnCategory extends StatelessWidget {
  final ItemModelColumn itemModel;
  final int indexFav;
  final VoidCallback fun;

  const ItemColumnCategory(
      {required this.indexFav, required this.fun, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    var model = ItemModelColumn(
      name: itemModel.name,
      color: itemModel.color,
      price: itemModel.price,
      urlImage: itemModel.urlImage,
    );
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsView(
                          model: model,
                        )));
            if (itemModel.isFavorite == true) {
              BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
            } else {
              BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
            }
            // itemModel.isFavorite == true
            //     ? BlocProvider.of<ItemCubit>(context).addItem(model)
            //     :
            // BlocProvider.of<ReadItemCubit>(context).fetchAllItem();

            // itemModel.isFavorite == true
            //     ? Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => FavouritScreen(
            //                   model: model,
            //                 )),
            //       )
            //     : Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => DetailsView(
            //                   model: model,
            //                 )));
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
                              ? itemModel.isFavorite = false
                              : itemModel!.isFavorite = true;
                          BlocProvider.of<ItemCubit>(context).addItem(model);
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
                            color: Color(itemModel.color!))),
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
      },
    );
  }
}
