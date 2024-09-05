import 'package:cart_provider/Screens/cart_screen.dart';
import 'package:cart_provider/provider/cart_provider.dart';
import 'package:cart_provider/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProvider>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${value.nameUser}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'How is your health?',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const CartScreen()));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 40,
                  )),
              Positioned(
                  right: 3,
                  top: 5,
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) => Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: Text(
                        '${value.counter}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ],
          )
        ],
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
                child: Consumer<UserProvider>(
                  builder: (context, value, child) => Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${value.nameUser}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('Your Email is: ${value.emailUser}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Your Phone is: ${value.phoneUser}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Your Password is: ${value.passwordUser}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add To Cart',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) => Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (value.counter > 0) {
                                  value.removeItem();
                                }
                              },
                              icon: const Icon(Icons.remove)),
                          Text(
                            '${value.counter}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                value.addItem();
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
