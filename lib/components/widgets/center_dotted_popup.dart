import 'package:flutter/material.dart';

import '../config/app_style.dart';

class CenterDottedPopup extends StatelessWidget {
  const CenterDottedPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 7,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            color: AppStyle.blackGray,
            border: Border.all(color: AppStyle.blackGray)),
      ),
    );
  }
}
