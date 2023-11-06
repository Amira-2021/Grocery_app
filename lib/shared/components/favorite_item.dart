import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/home.dart';

class favoriteItem extends StatelessWidget {
  final ItemModelColumn itemModelColumn;
  final int weight;

  const favoriteItem(
      {Key? key, required this.itemModelColumn, required this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      shadowColor: Colors.green,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        leading: CircleAvatar(
          child: Image.asset(
            itemModelColumn.urlImage,
            fit: BoxFit.cover,
          ),
          radius: 40,
          backgroundColor: Color(itemModelColumn.color!),
        ),
        minLeadingWidth: 10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${itemModelColumn.price}",
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              itemModelColumn.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("${weight}"),
          ],
        ),
      ),
    );
  }
}

//
//
// Container(
//   width: 381,
//   height: 150,
//   color: Colors.white,
//   margin: EdgeInsets.symmetric(vertical: 20),
//   padding: EdgeInsets.only(top: 20),
//   child: Row(
//     children: [
//       CircleAvatar(
//         child: Image.asset(itemModelColumn.urlImage),
//         radius: 50,
//         backgroundColor: itemModelColumn.color,
//       ),
//       Column(
//         children: [
//           Text(itemModelColumn.name),
//           Text("${itemModelColumn.price}"),
//           Text("${weight}"),
//         ],
//       )
//     ],
//   ),
// );
