import 'package:flutter/material.dart';
import 'package:todo_app/pages/onboarding/data/onboarding_page_data.dart';
import 'package:todo_app/pages/onboarding/widgets/onboarding_pages.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController pageController = PageController();
  int _indexselected = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  _onPageChanged(index) {
    setState(() {
      _indexselected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: OnboardingPages(
          controller: pageController,
          pages: onboardingPages,
          onPageChanged: _onPageChanged,
        )),
      ],
    ));
  }
}
