import 'package:cart_provider/provider/cart_provider.dart';
import 'package:cart_provider/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProvider>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${value.nameUser}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '${value.emailUser}',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/chair.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.grey.shade300,
                elevation: 15,
                child: Consumer<CartProvider>(
                  builder: (context, value, child) => Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        '${value.counter}',
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
