import 'package:flutter/material.dart';
import 'package:todo_app/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    firstname: "",
    lastname: "",
    email: "",
    password: "",
    mobile: "",
    token: "",
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
