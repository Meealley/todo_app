import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(
          "Forgot Password?",
          style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 17)),
        )
      ],
    );
  }
}
