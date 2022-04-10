import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends LeafRenderObjectWidget {
  const Gap(
    this.mainAxisExtent, {
    Key? key,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        super(key: key);

  final double mainAxisExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGap(mainAxisExtent: mainAxisExtent);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderGap renderObject) {
    renderObject.mainAxisExtent = mainAxisExtent;
  }
}

class _RenderGap extends RenderBox {
  _RenderGap({
    required double mainAxisExtent,
  }) : _mainAxisExtent = mainAxisExtent;

  double get mainAxisExtent => _mainAxisExtent;
  double _mainAxisExtent;

  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final AbstractNode? flex = parent;
    if (flex is RenderFlex) {
      if (flex.direction == Axis.horizontal) {
        size = constraints.constrain(Size(mainAxisExtent.h, 0));
      } else {
        size = constraints.constrain(Size(0, mainAxisExtent.h));
      }
    } else {
      throw FlutterError(
        'A Gap widget must be placed directly inside a Flex widget',
      );
    }
  }
}
