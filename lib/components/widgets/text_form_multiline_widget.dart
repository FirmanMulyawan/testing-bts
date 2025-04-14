import 'package:flutter/material.dart';

import '../config/app_style.dart';

class TextFormMultiLineWidget extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool? readOnly;
  final Color? focusedBorder;
  final Color? enabledBorder;
  final Color? errorBorderColor;
  final Color? textStyleColor;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final String? errorText;
  // final bool? enableInteractiveSelection;
  final int? errorMaxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool? isEnable;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? hintColor;
  final Color? errorColor;
  final Color? borderColor;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final TextAlignVertical? textAlignVertical;
  final Color? fillColor;
  final double? heightMultilineTextForm;
  final FocusNode? focusNode;

  const TextFormMultiLineWidget({
    super.key,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.textInputAction,
    this.heightMultilineTextForm = 100,
    this.prefixIcon,
    this.controller,
    this.readOnly = false,
    this.focusedBorder = AppStyle.grayLight400,
    this.enabledBorder = AppStyle.grayLight400,
    this.errorBorderColor,
    this.textStyleColor,
    this.suffixIcon,
    this.onTap,
    this.onFieldSubmitted,
    this.obscureText,
    this.errorText,
    // this.enableInteractiveSelection = false,
    this.errorMaxLines,
    this.isEnable = true,
    this.onChanged,
    this.initialValue,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hintColor,
    this.errorColor,
    this.borderColor,
    this.maxLines,
    this.minLines,
    this.expands,
    this.textAlignVertical,
    this.fillColor = Colors.white,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: heightMultilineTextForm,
          child: TextFormField(
            initialValue: initialValue,
            // enableInteractiveSelection: enableInteractiveSelection,
            onTap: onTap,
            readOnly: readOnly ?? false,
            cursorColor: AppStyle.blackPure,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            focusNode: focusNode,
            style: AppStyle.styleRegular(
                size: 14, textColor: textStyleColor ?? AppStyle.blackPure),
            textAlignVertical: textAlignVertical ?? TextAlignVertical.top,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            // validator: (value) {},
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: isEnable! ? fillColor : AppStyle.grayLight400,
              prefixIcon: prefixIcon,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIconColor: prefixIconColor,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: borderColor ?? AppStyle.grayLight400, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: focusedBorder ?? Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: enabledBorder ?? AppStyle.grayDark, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: hintText,
              hintStyle: AppStyle.styleRegular(
                  size: 14, textColor: hintColor ?? AppStyle.grayDark),
              errorText: errorText,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: errorBorderColor ?? Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: errorBorderColor ?? Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorMaxLines: errorMaxLines,
              errorStyle: AppStyle.styleRegular(
                  size: 12, textColor: errorColor ?? AppStyle.red500),
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor,
            ),
            textInputAction: textInputAction,
            maxLines: null,
            expands: true,
            // minLines: ,
          ),
        ),
      ],
    );
  }
}
