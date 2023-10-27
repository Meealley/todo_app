import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/register/register_page.dart';
import 'package:todo_app/theme/app_colors.dart';

class LogRegister extends StatelessWidget {
  const LogRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(color: AppConst.kBkDark),
              ),
            ),
            TextSpan(
              text: "Register",
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(color: AppConst.kPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
