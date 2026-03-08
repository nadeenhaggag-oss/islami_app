import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/hadeth_model.dart';
import '../../hadeth_details/hadeth_details.dart';


class AhadithTab extends StatefulWidget {
  AhadithTab({super.key});

  @override
  State<AhadithTab> createState() => _AhadithTabState();
}

class _AhadithTabState extends State<AhadithTab> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadith_bg.png"),
          fit: BoxFit.cover,
          opacity: .2,
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: .75,
        ),
        items: allAhadeth.map((item) {
          return Column(
            children: [
              SizedBox(height: 165),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetailsScreen.routeName,
                      arguments: item,
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset("assets/images/hadeth_bg.png"),
                      Column(
                        children: [
                          SizedBox(height: 40),
                          Text(
                            item.title,
                            style: GoogleFonts.elMessiri(fontSize: 18),
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemCount: item.content.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                    vertical: 12,
                                  ),
                                  child: Text(
                                    item.content[index],
                                    maxLines: 8,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.elMessiri(fontSize: 18),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // trim ,  trimLeft , trimRight
  String x1 = "   MOhamed   "; // "MOhamed"
  String x2 = "MOhamed   "; // "MOhamed"
  String x3 = "   MOhamed"; // "MOhamed"
  String x4 = "   M   ohamed   "; // "M   ohamed"

  loadHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadeth = hadethFile.split("#");

    for (int i = 0; i < ahadeth.length; i++) {
      String hadethOne = ahadeth[i];
      List<String> hadethLines = hadethOne.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      print("Title :$title");
      allAhadeth.add(HadethModel(title: title, content: content));
    }

    setState(() {});
  }
}
