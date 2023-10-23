import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/forgotten%20password/forgot_password.dart';

class ForgotPasswordLabel extends StatelessWidget {
  const ForgotPasswordLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rember me",
          style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 17)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ForgotPassword()),
            );
            print("forgot password");
          },
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 17)),
          ),
        )
      ],
    );
  }
}
