import 'package:flutter/material.dart';
import 'package:todo_app/pages/forgotten%20password/reset_password_form.dart';
import 'package:todo_app/theme/app_style.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _resetKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            Text(
              "Please enter your email address to request a password reset",
              style: appstyle(17, Colors.black, FontWeight.normal),
            ),
            SizedBox(
              height: 23,
            ),
            ResetPasswordForm(
                resetKey: _resetKey, emailController: _emailController),
          ],
        ),
      ),
    );
  }
}
