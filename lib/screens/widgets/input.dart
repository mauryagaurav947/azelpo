import 'package:azelpo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      this.inputDecoration,
      this.margin,
      this.style,
      this.width,
      this.textAlign = TextAlign.start,
      this.controller,
      this.onTap,
      this.obscureText = false,
      this.readOnly = false,
      this.textInputAction,
      this.focusNode,
      this.keyboardType,
      this.minLines,
      this.maxLength,
      this.buildCounter,
      this.onChanged,
      this.height,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.label,
      this.labelStyle,
      this.hintText,
      this.autofocus = false,
      this.hintStyle,
      this.maxLines = 1,
      this.expands = false})
      : super(key: key);
  final InputDecoration? inputDecoration;
  final EdgeInsets? margin;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? label;
  final TextStyle? labelStyle;
  final double? width;
  final double? height;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final bool obscureText;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool autofocus;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    Widget child = TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      textAlign: textAlign,
      controller: controller,
      onTap: onTap,
      obscureText: obscureText,
      readOnly: readOnly,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      buildCounter: buildCounter,
      onChanged: onChanged,
      autofocus: autofocus,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        fontSize: 12.0.sp,
        decoration: TextDecoration.none,
        color: Palette.blackColor,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ).merge(style),
      cursorHeight: 18.0.sp,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0.h,
          horizontal: 10.0.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          gapPadding: 0.0,
          borderSide: const BorderSide(
            width: 2.0,
            color: Palette.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          gapPadding: 0.0,
          borderSide: const BorderSide(
            width: 2.0,
            color: Palette.borderColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Palette.inputHintColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.0.sp,
          height: 1.5,
        ).merge(hintStyle),
      ).copyWith(
        hintStyle: inputDecoration?.hintStyle,
        hintText: inputDecoration?.hintText,
        border: inputDecoration?.border,
        icon: inputDecoration?.icon,
        isDense: inputDecoration?.isDense,
        alignLabelWithHint: inputDecoration?.alignLabelWithHint,
        contentPadding: inputDecoration?.contentPadding,
        counter: inputDecoration?.counter,
        counterStyle: inputDecoration?.counterStyle,
        counterText: inputDecoration?.counterText,
        disabledBorder: inputDecoration?.disabledBorder,
        enabled: inputDecoration?.enabled,
        enabledBorder: inputDecoration?.enabledBorder,
        errorBorder: inputDecoration?.errorBorder,
        errorMaxLines: inputDecoration?.errorMaxLines,
        errorStyle: inputDecoration?.errorStyle,
        errorText: inputDecoration?.errorText,
        fillColor: inputDecoration?.fillColor,
        filled: inputDecoration?.filled,
        floatingLabelBehavior: inputDecoration?.floatingLabelBehavior,
        focusColor: inputDecoration?.focusColor,
        focusedBorder: inputDecoration?.focusedBorder,
        focusedErrorBorder: inputDecoration?.focusedErrorBorder,
        helperMaxLines: inputDecoration?.helperMaxLines,
        helperStyle: inputDecoration?.helperStyle,
        helperText: inputDecoration?.helperText,
        hintMaxLines: inputDecoration?.hintMaxLines,
        hintTextDirection: inputDecoration?.hintTextDirection,
        hoverColor: inputDecoration?.hoverColor,
        isCollapsed: inputDecoration?.isCollapsed,
        labelStyle: inputDecoration?.labelStyle,
        labelText: inputDecoration?.labelText,
        prefix: inputDecoration?.prefix,
        prefixIcon: inputDecoration?.prefixIcon,
        prefixIconConstraints: inputDecoration?.prefixIconConstraints,
        prefixStyle: inputDecoration?.prefixStyle,
        prefixText: inputDecoration?.prefixText,
        semanticCounterText: inputDecoration?.semanticCounterText,
        suffix: inputDecoration?.suffix,
        suffixIcon: inputDecoration?.suffixIcon,
        suffixIconConstraints: inputDecoration?.suffixIconConstraints,
        suffixStyle: inputDecoration?.suffixStyle,
        suffixText: inputDecoration?.suffixText,
      ),
    );

    if (label != null && label!.isNotEmpty) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: TextStyle(
              fontSize: 10.0.sp,
              color: Palette.inputHintColor,
              fontWeight: FontWeight.w500,
            ).merge(labelStyle),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          child
        ],
      );
    }

    return Container(
      width: width ?? 1.0.sw,
      height: height,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 10.0.h,
      ).copyWith(
        left: margin?.left,
        right: margin?.right,
        top: margin?.top,
        bottom: margin?.bottom,
      ),
      child: child,
    );
  }
}
