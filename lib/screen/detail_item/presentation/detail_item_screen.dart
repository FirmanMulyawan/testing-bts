import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/base/base_view.dart';
import '../../../components/config/app_const.dart';
import '../../../components/widgets/app_bar_widget.dart';
import 'detail_item_controller.dart';

class DetailItemScreen extends BaseView<DetailItemController> {
  const DetailItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        title: 'Detail Item',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        child: SizedBox(
          width: 80,
          height: 80,
          child: RawMaterialButton(
            onPressed: () async {},
            child: SvgPicture.asset(
              AppConst.iconPlusButton,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: Text("Helo World"),
      ),
    );
  }
}
