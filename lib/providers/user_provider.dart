import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:http/http.dart' as http;

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

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('Bearer') && prefs.containsKey('userId')) {
      final userId = prefs.getString('userId');
      // http.get(url)
    }
  }
}
