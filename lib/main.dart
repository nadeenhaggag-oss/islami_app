import 'package:flutter/material.dart';
import 'package:islami_app/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_app/screens/home/home.dart';
import 'package:islami_app/screens/sura_details/sura_details.dart';
import 'core/cache_helper.dart';
import 'intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool? value = CacheHelper.getBool("introScreenFlag");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: value == true
          ? HomeScreen.routeName
          : IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }
}
