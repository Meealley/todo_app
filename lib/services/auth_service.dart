import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/pages/home/home_screen.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/utils/utils.dart';

import '../utils/constants.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String mobile,
  }) async {
    try {
      User user = User(
          id: "",
          firstname: firstname,
          lastname: lastname,
          email: email,
          mobile: mobile,
          password: password,
          token: "");

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}user/register'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account registration successfully!!");
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      // final User user =
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}user/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "Login successful");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('Bearer', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  //Get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Bearer");

      if (token == null) {
        prefs.setString('Bearer', '');
      }
      var tokenRes = await http.get(
        Uri.parse('${Constants.uri}/:id'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          'Bearer': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=utf-8",
            'Bearer': token,
          },
        );
        userProvider.setUser(userRes.body);
      }
    } catch (e) {}
  }
}
