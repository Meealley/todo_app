import 'package:todo_app/pages/onboarding/models/onboarding_model.dart';
import 'package:todo_app/theme/app_colors.dart';

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(text: "Welcome to \n", color: AppConst.kBkDark),
      OnboardingPageTitle(text: "Todooo", color: AppConst.kPurple)
    ],
    description: "Keep tabs of all your daily activitiy",
    image: "assets/images/slide1.png",
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
          text: "Get familiar with all \n", color: AppConst.kBkDark),
      OnboardingPageTitle(text: "tasks", color: AppConst.kPurple)
    ],
    description: "Keep tabs of all your daily activitiy",
    image: "assets/images/slide2.png",
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
          text: "Be ahead of everyone by \n", color: AppConst.kBkDark),
      OnboardingPageTitle(text: "Getting todo", color: AppConst.kPurple)
    ],
    description: "Keep tabs of all your daily activitiy",
    image: "assets/images/slide3.png",
  ),
];
