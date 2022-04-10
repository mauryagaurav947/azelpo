import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/palette.dart';
import 'package:azelpo/screens/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar<T> extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;
  final Color leadingColor;
  final Color backgroundColor;
  final Widget? titleWidget;
  final VoidCallback? onBackPressed;
  final TextStyle? titleStyle;
  final T? data;
  final PreferredSizeWidget? bottom;
  final bool automaticallyImplyLeading;

  MyAppBar(
      {Key? key,
      this.title,
      this.actions,
      this.leading,
      this.centerTitle = true,
      this.leadingColor = Colors.white,
      this.titleWidget,
      this.onBackPressed,
      this.titleStyle,
      this.data,
      this.bottom,
      this.backgroundColor = Palette.primaryColor,
      this.automaticallyImplyLeading = true})
      : preferredSize =
            Size.fromHeight(56.0 + (bottom?.preferredSize.height ?? 0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? _leading = leading;
    Widget? _title = titleWidget;

    if (!automaticallyImplyLeading && leading == null) {
      _leading = AppIconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        color: leadingColor,
        onPressed: () {
          if (onBackPressed != null) {
            onBackPressed!();
          }
          // Utils.unFocus(context);
          Navigate.mayClose<T>(data);
        },
      );
    }

    if (title != null && title!.isNotEmpty) {
      _title = Text(
        title!,
        style: TextStyle(
          fontSize: 15.sp,
          height: 1.3,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ).merge(titleStyle),
      );
    }

    return AppBar(
      leading: _leading,
      title: _title,
      backgroundColor: backgroundColor,
      bottom: bottom,
      centerTitle: centerTitle,
      actions: actions,
      titleSpacing: 10,
      iconTheme: IconThemeData(
        color: leadingColor,
      ),
      elevation: 0.0,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
