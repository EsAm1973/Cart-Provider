import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  addItem() {
    _counter++;
    notifyListeners();
  }

  removeItem() {
    _counter--;
    notifyListeners();
  }
}
