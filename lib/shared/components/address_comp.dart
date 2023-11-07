import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

var key = GlobalKey();

class addressItem extends StatefulWidget {
  @override
  State<addressItem> createState() => _addressItemState();
}

class _addressItemState extends State<addressItem> {
  bool isShow = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              isShow = isShow ? false : true;
              setState(() {});
            },
            child: Container(
              width: 400,
              height: 200,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.green,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Amira Ahmed "),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Placed on Octobar 19 2021 "),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Order #90897 "),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("Items: 10"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("phone 01009919971"),
                        ],
                      )
                    ],
                  ),
                  trailing: isShow
                      ? const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.green,
                        )),
            ),
          ),
          Visibility(
            visible: isShow,
            child: Container(
              width: 400,
              height: 200,
              color: Colors.green.shade200,
            ),
          )
        ],
      ),
    );
  }
}
