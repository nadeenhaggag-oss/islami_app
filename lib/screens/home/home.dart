import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/ahadith_tab.dart';
import 'package:islami_app/screens/home/tabs/quran_tab.dart';
import 'package:islami_app/screens/home/tabs/radio_tab.dart';
import 'package:islami_app/screens/home/tabs/sebha_tab.dart';
import 'package:islami_app/screens/home/tabs/time_tab.dart';

import '../../core/app_colors.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF202020),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        backgroundColor: AppColors.primary,

        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: getImageIcon("ic_quran", 0),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: getImageIcon("ahadith", 1),
            label: "Ahadeth",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: getImageIcon("ic_sebha", 2),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: getImageIcon("ic_radio", 3),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: getImageIcon("ic_time", 4),
            label: "Time",
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          tabs[selectedIndex],
          Image.asset("assets/images/islami_top.png"),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  Widget getImageIcon(String imageName, int index) {
    return selectedIndex == index
        ? Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 19),
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 32, 32, .6),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage("assets/images/$imageName.png")),
          )
        : ImageIcon(AssetImage("assets/images/$imageName.png"));
  }
}
