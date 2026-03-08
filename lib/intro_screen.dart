import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/screens/home/home.dart';

import 'core/app_colors.dart';
import 'core/cache_helper.dart';
import 'core/styles.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "intro";

  IntroScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleStyle),
      body: "",
      image: Image.asset("assets/images/intro0.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro4.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: AppColors.black,
      showNextButton: true,
      bodyPadding: EdgeInsets.only(top: 266),
      showSkipButton: true,
      onSkip: () async {
        await CacheHelper.saveBool("introScreenFlag", true);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      skip: Text("Skip", style: AppStyles.bodyStyle),
      showBackButton: true,
      back: Text("Back", style: AppStyles.bodyStyle),

      dotsDecorator: DotsDecorator(
        color: AppColors.grey,

        activeColor: AppColors.primary,

        activeSize: Size(22, 7),
        activeShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      globalHeader: Image.asset("assets/images/islami_top.png"),
      next: Text("Next", style: AppStyles.bodyStyle),
      done: Text("Done", style: AppStyles.bodyStyle),
      onDone: () async {
        await CacheHelper.saveBool("introScreenFlag", true);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }
}
