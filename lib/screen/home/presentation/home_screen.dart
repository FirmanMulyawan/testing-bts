import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/base/base_view.dart';
import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import 'widgets/add_checklist.dart';
import 'home_controller.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        child: SizedBox(
          width: 80,
          height: 80,
          child: RawMaterialButton(
            onPressed: () async {
              await showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  enableDrag: false,
                  isScrollControlled: true,
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (ctx) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: const AddChecklist(),
                    );
                  }).then((onValue) {
                if (onValue == true) {
                  // _controller.paginationListController.reset();
                }
              });
            },
            child: SvgPicture.asset(
              AppConst.iconPlusButton,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: RefreshIndicator(
              color: AppStyle.bluePrimary,
              onRefresh: () {
                return Future.value();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AlignedGridView.count(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 4,
                  addRepaintBoundaries: false,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.all(4),
                      child: ListTile(
                        onTap: () => controller.toDetailChecklist(),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        title: const Text('The title goes here'),
                        // subtitle: const Text('Subtitle here'),
                        trailing: Skeleton.shade(
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () => controller.toDeleteChecklist(),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ))),
    );
  }
}
