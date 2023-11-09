import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/account/account_details/address.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'account_details/aboutme.dart';
import 'account_details/nottify.dart';
import 'account_details/order.dart';
import 'account_details/favourit.dart';
import 'package:grocery_app/screens/intro_screen.dart';
import 'package:grocery_app/shared/components/profile_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void update() {
    setState(() {});
  }

  File? fileImage;
  _showOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Choose Options"),
              content: Container(
                width: 250,
                height: 150,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_photo_alternate_outlined),
                      title: const Text("Gallery"),
                      onTap: () => _photoFromGallery(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text("Camera"),
                      onTap: () => _photoFromCamera(context),
                    )
                  ],
                ),
              ),
            ));
  }

  Future _photoFromGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileImage = File(image!.path);
    });
    Navigator.pop(context);
  }

  Future _photoFromCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileImage = File(image!.path);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReadItemCubit>(context).fetchAllItem();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           final pref = await SharedPreferences.getInstance();
      //           pref.setBool("showHome", false);
      //           Navigator.pushReplacement(context,
      //               MaterialPageRoute(builder: (context) => IntoScreen()));
      //         },
      //         icon: const Icon(Icons.exit_to_app))
      //   ],
      // ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  children: [
                    Stack(
                      //AssetImage("assets/img/profile.png")fileImage!=null?
                      children: [
                        fileImage != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(fileImage!),
                                radius: 60,
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/img/profile.png"),
                                radius: 60,
                              ),
                        Positioned(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () => _showOption(context),
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                          ),
                          top: 85,
                          left: 90,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Amira Ahmed",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "amira123@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      profileItemRow(
                          icon: Icons.account_circle_outlined,
                          name: "About Me",
                          context: context,
                          goToScreen: AboutMe()),
                      profileItemRow(
                          icon: Icons.card_travel_sharp,
                          name: "My Orders",
                          context: context,
                          goToScreen: OrderScreen()),
                      profileItemRow(
                          icon: Icons.favorite_border,
                          name: "My Favorites",
                          goToScreen: FavouritScreen(
                              model: BlocProvider.of<ReadItemCubit>(context)
                                  .list!
                                  .first),
                          context: context),
                      profileItemRow(
                          icon: Icons.home_filled,
                          name: "My Address",
                          context: context,
                          goToScreen: AddressScreen()),
                      profileItemRow(
                          icon: Icons.credit_card,
                          name: "Credit Cards",
                          goToScreen: OrderScreen(),
                          context: context),
                      profileItemRow(
                          icon: Icons.recycling,
                          name: "Transactions",
                          context: context,
                          goToScreen: OrderScreen()),
                      profileItemRow(
                          icon: Icons.notifications,
                          name: "Notifications",
                          goToScreen: NotifiyScreen(),
                          context: context),
                      profileItemRow(
                          icon: Icons.logout,
                          name: "Sign out",
                          context: context,
                          goToScreen: IntoScreen()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
