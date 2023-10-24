import 'package:flutter/material.dart';
import 'package:todo_app/theme/app_colors.dart';

class OnboardingDots extends StatelessWidget {
  final int dotsLength;
  final double size;
  final int indexSelected;
  final Function(int) onDotPressed;

  const OnboardingDots(
      {super.key,
      required this.dotsLength,
      this.size = 12,
      required this.indexSelected,
      required this.onDotPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          dotsLength,
          (index) => GestureDetector(
                onTap: () => onDotPressed(index),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      color: indexSelected == index
                          ? AppConst.kPurple
                          : AppConst.kGreyLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )),
    );
  }
}
