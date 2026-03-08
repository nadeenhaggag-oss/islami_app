import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> azkar = ["ألله اكبر", "الحمد لله", "سبحان الله"];
  int index = 0;
  double angel = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
          opacity: .2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  counter++;
                  if (counter % 33 == 0) {
                    index = (index + 1) % azkar.length;
                    counter = 0;
                  }
                  angel += 0.3;
                  setState(() {});
                },
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/sepha_head.png",
                        width: 130,
                        height: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Transform.rotate(
                        angle: angel,
                        child: Image.asset(
                          "assets/images/SebhaBody.png",
                          width: 380,
                          height: 390,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              azkar[index],
                              style: GoogleFonts.elMessiri(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
