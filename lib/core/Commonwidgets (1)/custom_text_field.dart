import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.suffixIcon,
    this.borderRaduis,
    this.validator,
    this.textEditingController,
    this.keyboardType,
    this.obscureText,
    this.suffixIconPadding,
    this.labelStyle,
    this.suffixIconColor,
    this.isFilled,
    this.textFormFieldHeight,
    this.onChanged,
    this.onFieldSubmitted,
    this.isBuildCounterWantd = false,
    this.maxLength,
    this.prefixIcon,
    this.fillColor,
    this.fontColor,
    this.verticalPadding,
    this.minLines,
    this.labelWidget,
    this.readOnly,
    this.maxLines,
  });
  final double? suffixIconPadding;
  final String? Function(String?)? validator;
  final String label;
  final double? borderRaduis;
  final double? verticalPadding;
  final TextInputType? keyboardType;
  final Color? fontColor;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget suffixIcon;
  final TextStyle? labelStyle;
  final Color? suffixIconColor;
  final Color? fillColor;
  final bool? readOnly;
  final bool? isFilled;
  final double? textFormFieldHeight;
  final void Function(String val)? onChanged;
  final void Function(String val)? onFieldSubmitted;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool isBuildCounterWantd;
  final int? minLines;
  final int? maxLines;
  final Widget? labelWidget;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isFoucsed = false;
  Widget? prefixIconReturn() {
    if (isFoucsed) {
      setState(() {});

      return widget.prefixIcon;
    }
    setState(() {});
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
        isFoucsed = false;
        setState(() {
          //isFoucsed = false;
        });
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      maxLength: widget.maxLength ?? 100,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 2,
      readOnly: widget.readOnly ?? false,
      onTap: () {
        setState(() {
          isFoucsed = !isFoucsed;
        });
      },
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) {
        return !widget.isBuildCounterWantd
            ? null
            : Transform(
                transform: Matrix4.translationValues(0, -32.h, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$currentLength',
                        style: getRegularStyle(
                          fontSize: 10,
                          color: ConstantColors.appMainColor,
                          fontFamily: FontConstants.poppinsFontFamily,
                        ),
                      ),
                      TextSpan(
                        text: '/$maxLength',
                        style: getRegularStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontFamily: FontConstants.poppinsFontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
      cursorColor: ConstantColors.appMainColor,
      cursorHeight: 20.h,
      cursorWidth: 1.5.w,
      autocorrect: true,
      obscuringCharacter: '*',
      style: getRegularStyle(
          fontSize: 14,
          color: isFoucsed
              ? widget.fontColor ?? ConstantColors.appMainColor
              : Colors.grey,
          fontFamily: FontConstants.poppinsFontFamily),
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? Colors.grey.withOpacity(0.22),
        suffixIconConstraints: BoxConstraints(minHeight: 16.h, minWidth: 16.w),
        constraints: BoxConstraints(
          maxHeight: widget.textFormFieldHeight?.h ?? 52.h,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w, vertical: widget.verticalPadding ?? 2.h),
        label: widget.labelWidget ??
            Text(
              widget.label,
              style: widget.labelStyle ??
                  getRegularStyle(
                      fontSize: 14,
                      color: isFoucsed && isKeyboard
                          ? ConstantColors.appMainColor
                          : Colors.grey,
                      fontFamily: FontConstants.poppinsFontFamily),
            ),
        prefixIcon: //prefixIconReturn(),
            widget.prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.only(
              right: widget.suffixIconPadding ?? 14.0.w, left: 8.w),
          child: widget.suffixIcon,
        ),
        suffixIconColor: isFoucsed && isKeyboard
            ? ConstantColors.appMainColor
            : widget.suffixIconColor ?? Colors.grey,
        filled: widget.isFilled ?? true,
        focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ConstantColors.appMainColor,
          ),
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
        ),
        isDense: false,
        // enabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: AppColors.primaryColor),
        //   borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
        // ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
