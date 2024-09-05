import 'package:cart_provider/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  get nameUser => _user!.name;
  get emailUser => _user!.email;
  get phoneUser => _user!.mobile;
  get passwordUser => _user!.password;

  void saveUser(User user) {
    _user = user;
    notifyListeners();
  }
}
