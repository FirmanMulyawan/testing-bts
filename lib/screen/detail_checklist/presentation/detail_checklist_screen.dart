import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/base/base_view.dart';
import '../../../components/config/app_const.dart';
import '../../../components/widgets/app_bar_widget.dart';
import 'widgets/add_detail_checklist.dart';
import 'detail_checklist_controller.dart';

class DetailChecklistScreen extends BaseView<DetailChecklistController> {
  const DetailChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        title: 'Detail Todo',
      ),
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
                      child: const AddDetailChecklist(),
                    );
                  }).then((onValue) {
                if (onValue == true) {
                  controller.apiGetAllChecklistItem(controller.checklistId);
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
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<DetailChecklistController>(builder: (ctrl) {
          if (ctrl.isLoadingData == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (ctrl.listChecklistItem?.isEmpty == true) {
            return const Text("data kosong");
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0),
            itemCount: ctrl.listChecklistItem?.length,
            itemBuilder: (context, index) {
              final item = ctrl.listChecklistItem?[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Card(
                  color: item?.itemCompletionStatus == true
                      ? Colors.white
                      : Colors.amber,
                  margin: const EdgeInsets.all(4),
                  child: ListTile(
                    onTap: () => controller.toDetailItem(item?.id),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    title: Text(item?.name ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Skeleton.shade(
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onPressed: () =>
                                controller.toEditChecklist(item?.id),
                          ),
                        ),
                        Skeleton.shade(
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () =>
                                controller.toDeleteChecklist(item?.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      )),
    );
  }
}
