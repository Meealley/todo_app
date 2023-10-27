import 'package:flutter/material.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';

class RegLogin extends StatelessWidget {
  const RegLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: appstyle(15, Colors.black, FontWeight.normal),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ),
          child: Row(
            children: [
              Text(
                "Login",
                style: appstyle(15, AppConst.kPurple, FontWeight.normal),
              )
            ],
          ),
        )
      ],
    );
  }
}
