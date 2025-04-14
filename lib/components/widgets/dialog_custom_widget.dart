import 'package:flutter/material.dart';

import '../config/app_style.dart';
import 'button_dialog_left_widget.dart';
import 'button_dialog_right_widget.dart';

class DialogCustomWidget extends StatelessWidget {
  const DialogCustomWidget(
      {super.key,
      required this.title,
      required this.decs,
      required this.titleLeftBtn,
      required this.titleRightBtn,
      this.onTapRightBtn,
      this.onTapLeftBtn,
      this.onTapRightLoadingBtn,
      this.childWidget});

  final String title;
  final String decs;
  final String titleLeftBtn;
  final String titleRightBtn;
  final Widget? childWidget;

  final void Function()? onTapRightBtn;
  final void Function()? onTapLeftBtn;
  final Function()? onTapRightLoadingBtn;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -4,
                    blurRadius: 8,
                    color: const Color(0xFF101828).withOpacity(0.03),
                  ),
                  BoxShadow(
                    offset: const Offset(0, 20),
                    spreadRadius: -4,
                    blurRadius: 24,
                    color: const Color(0xFF101828).withOpacity(0.08),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppStyle.styleMedium(
                      size: 18,
                    ),
                  ),
                  decs.isEmpty == false
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              decs,
                              textAlign: TextAlign.center,
                              style: AppStyle.styleRegular(
                                size: 14,
                                textColor: const Color(0xFF667085),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  childWidget ?? Container(),
                  const SizedBox(
                    height: 32,
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      if (titleLeftBtn.isEmpty) {
                        return SizedBox(
                          width: 150,
                          child: ButtonDialogRightWidget(
                            onTap: onTapRightBtn,
                            title: titleRightBtn,
                          ),
                        );
                      }

                      return Row(
                        children: [
                          Expanded(
                            child: ButtonDialogLeftWidget(
                              onTap: onTapLeftBtn,
                              title: titleLeftBtn,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: AppStyle.buttonPrimary(
                                  width: double.infinity,
                                  hasLoading: true,
                                  title: titleRightBtn,
                                  onTap: onTapRightLoadingBtn ?? () {}))
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
