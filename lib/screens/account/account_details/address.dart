import 'package:flutter/material.dart';
import 'package:grocery_app/shared/components/address_comp.dart';
import 'package:grocery_app/shared/components/order_comp.dart';

class AddressScreen extends StatefulWidget {
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> orders = [
      addressItem(),
      addressItem(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade200,
        child: ListView.builder(
          itemBuilder: (context, index) => orders[index],
          itemCount: orders.length,
        ),
      ),
    );
  }
}
