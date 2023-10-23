import 'package:flutter/material.dart';

var key = GlobalKey();
Widget orderItem({
  bool isOpen = false,
}) {
  return Container(
    width: 390,
    height: 280,
    color: Colors.green,
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 381,
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.card_travel_sharp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order #90897 "),
                        Text("Placed on Octobar 19 2021 "),
                        Text("Order #90897 "),
                        Row(
                          children: [
                            Text("Items: 10"),
                            Text("Items: ${16.90}"),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          isOpen
                              ? Column(
                                  key: key,
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ],
                                )
                              : Container();
                        },
                        icon: Icon(Icons.arrow_circle_down))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
