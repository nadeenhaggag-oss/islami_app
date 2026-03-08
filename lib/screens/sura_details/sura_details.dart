import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_colors.dart';
import '../../core/styles.dart';
import '../../models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  String sura = "";

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }

    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: Color(0xFF202020),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text(model.nameEn, style: AppStyles.bodyStyle),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/sura_details_bg.png", fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 30),
              Text(model.nameAr, style: AppStyles.bodyStyle),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            sura,
                            textAlign: TextAlign.center,
                            style: AppStyles.large,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: verses.length,
              //     itemBuilder: (context, index) {
              //       return Directionality(
              //         textDirection: TextDirection.rtl,
              //         child: Text(
              //           "${verses[index]}(${index + 1})",
              //           textAlign: TextAlign.center,
              //           style: AppStyles.large,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 120),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    // await Future.delayed(Duration(seconds: 5));
    String suraFile = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    List<String> lines = suraFile.split("\n");

    for (int i = 0; i < lines.length; i++) {
      sura = sura + lines[i] + "(${i + 1})";
    }
    verses = lines;
    // sura = suraFile.replaceAll("\n", "");
    print(verses);
    setState(() {});
  }
}
