import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/shared/components/general_button.dart';

class DetailsView extends StatelessWidget {
  final ItemModelColumn model;

  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(model.color!),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: const Icon(
      //     Icons.arrow_back,
      //     color: Colors.green,
      //     size: 30,
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(model.color!),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        )),
                    width: double.infinity,
                    height: 250,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                  ),
                  Positioned(
                    height: 400,
                    bottom: 40,
                    right: 5,
                    left: 5,
                    child: CircleAvatar(
                      backgroundColor: Color(model.color!),
                      radius: 400,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        model.urlImage!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${model.price}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 22),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      model.name,
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Organic Mountain works as a "
                        "seller for many organic growers of"
                        " organic lemons. Organic lemons are easy "
                        "to spot in your produce aisle. They are just "
                        "like regular lemons, but they will usually have"
                        " a few more scars on the outside of the lemon skin. "
                        "Organic lemons are considered to be the world's finest lemon for "
                        "juicing"),
                    const SizedBox(
                      height: 50,
                    ),
                    generalButton(
                        title: "Add to Card",
                        screen: HomeScreen(),
                        contextNow: context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
