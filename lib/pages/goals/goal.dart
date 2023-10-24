import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Goals",
          style: GoogleFonts.epilogue(
              textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
