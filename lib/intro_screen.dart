import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/home_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "intro";

  IntroScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleSmall),
      bodyWidget: Text(""),
      image: Image.asset("assets/images/intro0.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleSmall),
      bodyWidget: Text(
        "Welcome to the app! This is a description of how it works",
        style: AppStyles.bodySmall,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.titleSmall),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        style: AppStyles.bodySmall,
        textAlign: TextAlign.center,
      ),

      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.titleSmall),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        style: AppStyles.bodySmall,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyles.titleSmall),
      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        style: AppStyles.bodySmall,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro4.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: Color(0xFF202020),
      bodyPadding: EdgeInsets.only(top: 266),
      showBackButton: true,
      back: Text("Back", style: AppStyles.bodySmall),
      globalHeader: Image.asset("assets/images/islami_top.png"),
      dotsFlex: 3,
      showSkipButton: true,
      onSkip: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      skip: Text("Skip", style: AppStyles.bodySmall),
      showNextButton: true,
      dotsDecorator: DotsDecorator(
        color: AppColors.grey,
        activeColor: AppColors.gold,
        activeSize: Size(18, 7),
        activeShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
      next: Text("Next", style: AppStyles.bodySmall),
      done: Text("Done", style: AppStyles.bodySmall),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }
}
