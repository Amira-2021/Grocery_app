import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

var key = GlobalKey();

class orderItem extends StatefulWidget {
  @override
  State<orderItem> createState() => _orderItemState();
}

class _orderItemState extends State<orderItem> {
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
              // height: 250,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListTile(
                  leading: const Icon(
                    Icons.card_travel_sharp,
                    size: 30,
                    color: Colors.green,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Order #90897 "),
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
                            height: 5,
                          ),
                          Text("Items: ${16.90}"),
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
              color: Colors.grey.shade200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: DotStepper(
                        spacing: 8,
                        indicator: Indicator.blink,
                        direction: Axis.vertical,
                        activeStep: index,
                        fixedDotDecoration:
                            const FixedDotDecoration(color: Colors.grey),
                        dotRadius: 10,
                        shape: Shape.circle,
                        dotCount: 4,
                        tappingEnabled: true,
                        indicatorDecoration: const IndicatorDecoration(
                          color: Colors.green,
                        ),
                        lineConnectorDecoration: const LineConnectorDecoration(
                          color: Colors.green,
                          strokeWidth: 5,
                          linePadding: 9,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: const Column(
                      children: [
                        Text("Title"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Title"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Title"),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Title"),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
