import 'package:flutter/material.dart';

import '../../../../components/base/base_view.dart';
import '../../../../components/config/app_style.dart';
import '../../../../components/widgets/center_dotted_popup.dart';
import 'add_detail_checklist_controller.dart';

class AddDetailChecklist extends BaseView<AddDetailChecklistController> {
  const AddDetailChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                margin: MediaQuery.of(context).viewInsets,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CenterDottedPopup(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                'Menambahkan Todo',
                                style: AppStyle.styleExtraBold(
                                    size: 16, textColor: AppStyle.blackPure),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Name',
                              style: AppStyle.styleBold(
                                  size: 14, textColor: AppStyle.blackPure),
                            ),
                            const SizedBox(height: 4),
                            _textInputUsername(),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppStyle.buttonPrimary(
                                      width: double.infinity,
                                      hasLoading: false,
                                      title: "Close",
                                      onTap: () {
                                        controller.closeTodo();
                                      }),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: AppStyle.buttonPrimary(
                                      width: double.infinity,
                                      hasLoading: true,
                                      title: "Add Todo",
                                      onTap: () async {
                                        await controller.addTodo();
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    ))))));
  }

  Widget _textInputUsername() => TextField(
        controller: controller.nameController,
        style: AppStyle.styleRegular(),
        decoration: AppStyle.textInputDecorator(
          hint: "Name",
        ),
      );
}
