import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/custom_button.dart';

class OnboardingControls extends StatelessWidget {
  final bool isLastPage;
  final Function() onSkipPressed;
  final Function() onNextPressed;

  const OnboardingControls(
      {super.key,
      required this.isLastPage,
      required this.onSkipPressed,
      required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    if (isLastPage) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomButton(
                title: "Get Started",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                })),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onSkipPressed,
            child: Text(
              "Skip",
              style:
                  GoogleFonts.epilogue(fontSize: 17, color: AppConst.kGreyDk),
            ),
          ),
          CustomButton(
            onPressed: onNextPressed,
            title: "Next",
          )
        ],
      ),
    );
  }
}
