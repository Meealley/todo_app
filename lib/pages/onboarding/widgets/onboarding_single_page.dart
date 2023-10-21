import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/onboarding/models/onboarding_model.dart';

class OnboardingSinglePage extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingSinglePage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Image.asset(
            page.image,
            height: 350,
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              children: page.title
                  .map(
                    (text) => TextSpan(
                      text: text.text,
                      style: GoogleFonts.epilogue(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: text.color,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            page.description,
            style: GoogleFonts.epilogue(
              textStyle: TextStyle(fontSize: 16, height: 1.5),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
