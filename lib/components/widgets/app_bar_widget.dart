import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../config/app_const.dart';
import '../config/app_style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed ??
            () {
              Get.back();
            },
        icon: SvgPicture.asset(AppConst.iconBack),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: AppStyle.styleBold(textColor: AppStyle.blackReal, size: 16),
      ),
    );
  }
}
