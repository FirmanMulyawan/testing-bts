import 'package:flutter/material.dart';

import '../config/app_style.dart';

class ButtonDialogRightWidget extends StatelessWidget {
  const ButtonDialogRightWidget({
    super.key,
    required this.title,
    this.onTap,
    this.disableColor,
    this.disableTextColor,
  });

  final String title;
  final void Function()? onTap;
  final Color? disableColor;
  final Color? disableTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: disableColor ?? AppStyle.bluePrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: disableColor ?? AppStyle.bluePrimary,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
            child: Text(
              title,
              style: AppStyle.styleMedium(
                size: 14,
                textColor: disableTextColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
