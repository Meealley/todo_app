import 'package:flutter/material.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';

import 'body.dart';
// import 'package:todo_app/pages/register/widgets/body.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.kPurple,
          title: Text(
            "Reset Password",
            style: appstyle(23, Colors.white, FontWeight.normal),
          ),
        ),
        body: Body());
  }
}
