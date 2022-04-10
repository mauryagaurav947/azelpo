import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.child,
    @required this.label,
    this.isInAsync = false,
    @required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.circularProgressIndicatorColor,
    this.inAsyncColor,
    this.borderRadius,
    this.labelStyle,
    this.height,
    this.width,
    this.isDense = false,
    this.circularProgressIndicatorSize,
  }) : super(key: key);

  final Widget? child;
  final String? label;
  final bool isInAsync;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? circularProgressIndicatorColor;
  final Color? inAsyncColor;
  final double? borderRadius;
  final TextStyle? labelStyle;
  final double? height;
  final double? width;
  final bool isDense;
  final double? circularProgressIndicatorSize;

  @override
  Widget build(BuildContext context) {
    Widget _child = child!;
    Color _backgroundColor = backgroundColor ?? Palette.primaryColor;

    if (isInAsync) {
      _child = AppProgressIndicator(
        size: circularProgressIndicatorSize!,
      );
      _backgroundColor = inAsyncColor!;
    } else {
      if (child == null) {
        _child = Text(
          label!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14.0.sp,
          ).merge(labelStyle),
        );
      }
      if (onPressed == null) {
        _backgroundColor = Colors.grey.shade400;
      }
    }

    Widget button = TextButton(
      child: _child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(_backgroundColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
        ),
        overlayColor:
            MaterialStateProperty.all<Color>(Palette.buttonOverlayColor),
        alignment: Alignment.center,
      ),
      onPressed: !isInAsync ? onPressed : null,
    );

    if (!isDense) {
      return Container(
        width: width ?? 1.sw,
        height: height ?? 40.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h).copyWith(
          bottom: margin?.vertical,
          top: margin?.vertical,
          left: margin?.horizontal,
          right: margin?.horizontal,
        ),
        child: button,
      );
    } else {
      return button;
    }
  }
}
