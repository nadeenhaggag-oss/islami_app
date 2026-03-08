import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/more_bg.png"),
          fit: BoxFit.cover, opacity: .2,
        ),
      ),
    );
  }
}
