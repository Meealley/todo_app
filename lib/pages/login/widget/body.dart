import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/login/widget/login_form.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/todo_logo.png',
              height: 150,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Login",
              style: GoogleFonts.epilogue(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Login to your account to continue",
              style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 40,
            ),
            LoginForm()
          ],
        ),
      ),
    ));
  }
}
