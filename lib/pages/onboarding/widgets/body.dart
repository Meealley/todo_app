import 'package:flutter/material.dart';
import 'package:todo_app/pages/onboarding/data/onboarding_page_data.dart';
import 'package:todo_app/pages/onboarding/widgets/onboarding_controls.dart';
import 'package:todo_app/pages/onboarding/widgets/onboarding_pages.dart';
import 'package:todo_app/pages/onboarding/widgets/onboardingdots.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController pageController = PageController();
  int _indexSelected = 0;
  bool get isLastPage => _indexSelected == onboardingPages.length - 1;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  _onPageChanged(index) {
    setState(() {
      _indexSelected = index;
    });
  }

  _onDotPressed(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  _onNexted() {
    setState(() {
      if (_indexSelected + 1 < onboardingPages.length) {
        _indexSelected = _indexSelected + 1;
      }
    });
    pageController.animateToPage(_indexSelected,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  _onskipped() {
    setState(() {
      _indexSelected = onboardingPages.length - 1;
      pageController.animateToPage(_indexSelected,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          flex: 3,
          child: OnboardingPages(
            controller: pageController,
            pages: onboardingPages,
            onPageChanged: _onPageChanged,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: Column(
          children: [
            OnboardingDots(
                dotsLength: onboardingPages.length,
                indexSelected: _indexSelected,
                onDotPressed: _onDotPressed),
            const SizedBox(
              height: 40,
            ),
            OnboardingControls(
              isLastPage: isLastPage,
              onNextPressed: _onNexted,
              onSkipPressed: _onskipped,
            )
          ],
        ))
      ],
    ));
  }
}
