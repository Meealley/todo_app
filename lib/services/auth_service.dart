import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/pages/home/home_screen.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/utils/utils.dart';

import '../utils/constants.dart';

class AuthService extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
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
      _isLoading = true;
      notifyListeners();
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}user/register'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
      );
      Future.delayed(
        const Duration(seconds: 4),
        () {
          _isLoading = false;
          notifyListeners();
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
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // String? token = prefs.getString("Bearer");
      _isLoading = true;
      notifyListeners();
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}user/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          // 'authorization': 'Bearer ${token!}',
        },
      );
      Future.delayed(
        const Duration(seconds: 4),
        () {
          _isLoading = false;
          notifyListeners();
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "Login successful");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('Bearer', jsonDecode(res.body)['token']);
          await prefs.setString('userId', jsonDecode(res.body)['_id']);
          // print(jsonDecode(res.body)['token']);
          String? token = prefs.getString("Bearer");
          // String? useId = prefs.getString("userId");

          // print(res.body);
          // print(token);
          // print(useId);

          final userId = jsonDecode(res.body)['_id'];
          log(userId);
          // print(userId);
          if (token != null) {
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false,
            );
            // var userRes = await http.get(
            //   Uri.parse('${Constants.uri}user/$userId'),
            //   headers: <String, String>{
            //     "Content-Type": "application/json; charset=utf-8",
            //     'Authorization': 'Bearer $token',
            //   },
            // );
            // if (userRes.statusCode == 200) {
            //   // var userData = jsonDecode(userRes.body);
            //   userProvider.setUser(jsonDecode(userRes.body));
            // } else {
            //   navigator.push(
            //     MaterialPageRoute(
            //       builder: (context) => LoginPage(),
            //     ),
            //   );
            // }
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

//Get User data;
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // userProvider.setUser(res.body);
      String? token = prefs.getString("Bearer");
      String? userId = prefs.getString("userId");
      print(token);
      print(userId);
      if (token == null) {
        prefs.setString('Bearer', '');
      }

      var userRes = await http.get(
        Uri.parse('${Constants.uri}user/$userId'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          'authorization': 'Bearer $token',
        },
      );
      if (userRes.statusCode == 200) {
        // var userData = jsonDecode(userRes.body);
        userProvider.setUser(jsonDecode(userRes.body));
      }
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}

  //Get user data
  // void getUserData(
  //   BuildContext context,
  // ) async {
  //   try {
  //     var userProvider = Provider.of<UserProvider>(context, listen: false);
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString("Bearer");

  //     if (token == null) {
  //       prefs.setString('Bearer', '');
  //     }
  //     var tokenRes = await http.post(
  //       Uri.parse('${Constants.uri}user/login'),
  //       headers: <String, String>{
  //         "Content-Type": "application/json; charset=utf-8",
  //         'Authorization': 'Bearer ${token!}',
  //       },
  //     );

  //     var response = jsonDecode(tokenRes.body);
  //     if (response == true) {
  //       http.Response userRes = await http.get(
  //         Uri.parse('${Constants.uri}user/:id'),
  //         headers: <String, String>{
  //           "Content-Type": "application/json; charset=utf-8",
  //           'Authorization': 'Bearer $token',
  //         },
  //       );
  //       print(userRes);

  //       userProvider.setUser(userRes.body);
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }