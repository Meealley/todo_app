import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(50, 40),
          backgroundColor: AppConst.kPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: GoogleFonts.epilogue(
                    textStyle:
                        const TextStyle(fontSize: 18, color: AppConst.kLight)),
              ));
  }
}
