import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/login_signIn/login_screen.dart';
import 'package:grocery_app/shared/components/intro_comp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntoScreen extends StatefulWidget {
  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  final controller = PageController();

  bool isFirstPage = true;
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (click) {
            setState(() {
              isFirstPage = click == 0;
              isLastPage = click == 2;
            });
          },
          children: [
            PagesIntro(
                image: "assets/img/intro1.png",
                title: "Get Grocery",
                details:
                    "Grocery app development aids in providing a user-friendly and attractive app to a mobile user."),
            PagesIntro(
                image: "assets/img/intro2.png",
                title: "Benefits from Using",
                details:
                    "Businesses can customize the app by considering additional functionality and features."
                    " It can also take into consideration featured stores, maps, and shopping carts."),
            PagesIntro(
                image: "assets/img/intro3.png",
                title: "Reach to goals on Time",
                details:
                    "Grocery delivery app are highly popular for delivering services at the minimum expected time. "
                    "It helps the users achieve their goals,"
                    " such as maximum customer reach and increased potential sales."),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isFirstPage
                ? TextButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                      final pref = await SharedPreferences.getInstance();
                      pref.setBool("showHome", true);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ))
                : TextButton(
                    onPressed: () {},
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  dotColor: Colors.grey, activeDotColor: Colors.green),
            ),
            TextButton(
                onPressed: () async {
                  isLastPage == true
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()))
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool("showHome", true);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
