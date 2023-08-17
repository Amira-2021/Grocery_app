import 'package:flutter/material.dart';
import 'package:grocery_app/shared/components/login_comp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 51),
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: buildInputField(
                  color: Colors.grey.shade300,
                  hint: "Search keywords..",
                  icon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/img/home.png",
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 180,
                  left: 20,
                  child: Text(
                    "20% off on your \n first purchase",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            ListView.separated(
                itemBuilder: itemBuilder(),
                separatorBuilder: separatorBuilder,
                itemCount: itemCount)
          ],
        ),
      ),
    );
  }
}
