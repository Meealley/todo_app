import 'package:flutter/material.dart';
import 'package:todo_app/pages/onboarding/models/onboarding_model.dart';
import 'package:todo_app/pages/onboarding/widgets/onboarding_single_page.dart';

class OnboardingPages extends StatelessWidget {
  final PageController controller;
  final List<OnboardingPageModel> pages;
  final Function(int) onPageChanged;

  const OnboardingPages(
      {super.key,
      required this.controller,
      required this.pages,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: pages.map((page) => OnboardingSinglePage(page: page)).toList(),
    );
  }
}
