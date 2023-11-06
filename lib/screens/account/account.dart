import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/read_item_cubit.dart';
import 'package:grocery_app/models/item_modal_column.dart';
import 'package:grocery_app/screens/home.dart';
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
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  top: 70,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/img/profile.png"),
                          radius: 60,
                        ),
                        Positioned(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
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
                    Text(
                      "Amira Ahmed",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "amira123@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey.shade200,
                ),
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
                        goToScreen: AccountScreen()),
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
          ],
        ),
      ),
    );
  }
}
