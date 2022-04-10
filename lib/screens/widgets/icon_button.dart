import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key,
      this.isInAsync = false,
      required this.icon,
      this.onPressed,
      this.circularProgressIndicatorSize = const Size(17, 17),
      this.iconSize = 24.0,
      this.padding = const EdgeInsets.all(8.0),
      this.color})
      : super(key: key);

  final bool isInAsync;
  final Widget icon;
  final VoidCallback? onPressed;
  final Size circularProgressIndicatorSize;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget child = icon;
    if (isInAsync) {
      child = SizedBox.fromSize(
        size: circularProgressIndicatorSize,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    return IconButton(
      icon: child,
      onPressed: isInAsync ? null : onPressed,
      iconSize: iconSize,
      alignment: Alignment.center,
      splashRadius: 22.0,
      color: color,
      padding: padding,
      visualDensity: VisualDensity.compact,
    );
  }
}
