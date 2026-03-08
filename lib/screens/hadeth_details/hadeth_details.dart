import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/styles.dart';
import '../../models/hadeth_model.dart';


class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: Color(0xFF202020),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text(model.title, style: AppStyles.bodyStyle),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/sura_details_bg.png", fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 30),

              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(18.0),
              //           child: Directionality(
              //             textDirection: TextDirection.rtl,
              //             child: Text(
              //               model.content,
              //               textAlign: TextAlign.center,
              //               style: AppStyles.large,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ListView.builder(
                    itemCount: model.content.length,
                    itemBuilder: (context, index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          model.content[index],
                          textAlign: TextAlign.center,
                          style: AppStyles.large,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ],
      ),
    );
  }
}
