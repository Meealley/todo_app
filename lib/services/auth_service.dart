import 'package:flutter/material.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:http/http.dart' as http;
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
        Uri.parse('${Constants.uri}/user/register'),
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
}
