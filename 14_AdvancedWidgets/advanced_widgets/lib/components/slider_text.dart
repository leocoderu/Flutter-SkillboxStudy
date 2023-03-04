import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliderText extends SingleChildRenderObjectWidget {
  final String? text;
  final Color color;

  const SliderText({super.key, super.child, this.text, required this.color,});

  @override
  RenderSliderText createRenderObject(BuildContext context) {
    return RenderSliderText(
      color: color,
    );
  }
}

class RenderSliderText extends RenderProxyBox{
  final Color _color;

  RenderSliderText({
    Color color = Colors.transparent,
    RenderBox? child,
  }) : _color = color, super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    //Paint testSun = Paint()..color = _color.withOpacity(50)..style = PaintingStyle.fill;
    //context.canvas.drawCircle(Offset(5, 5), 1.0, testSun);
    context.canvas.drawColor(_color, BlendMode.darken);

    if(child != null) {
      context.paintChild(child!, offset);
    }

    super.paint(context, offset);
  }
}
