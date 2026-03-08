import 'package:flutter/material.dart';

import '../../../core/styles.dart';
import '../../../models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel model;

  SuraItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/img_sur_number_frame.png"),

          Text(
            "${model.index}",
            style: AppStyles.bodyStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
      title: Text(
        model.nameEn,
        style: AppStyles.bodyStyle.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        "${model.versesCount} Verses",
        style: AppStyles.bodyStyle.copyWith(color: Colors.white, fontSize: 14),
      ),
      trailing: Text(
        model.nameAr,
        style: AppStyles.titleStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
