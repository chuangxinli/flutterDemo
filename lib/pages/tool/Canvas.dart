import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';


class ToolCanvas extends StatefulWidget {
  ToolCanvas({Key key}) : super(key: key);

  _ToolCanvasState createState() => _ToolCanvasState();
}

class _ToolCanvasState extends State<ToolCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('canvas'),
          centerTitle: true,
        ),
        body: Container(
          child: CustomPaint(
            painter: LinePainter(),
            /* child: Center( 
              child: Text( 
                '绘制直线',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black
                ),
              ),
            ), */
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.red //画笔颜色
    ..strokeCap = StrokeCap.square //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..strokeWidth = 3 //画笔的粗细
    ..style = PaintingStyle.fill //绘画样式默认为填充  fill
    ..blendMode = BlendMode.hardLight //颜色混合模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 0.0) //模糊遮罩效果
    ..filterQuality = FilterQuality.high; //颜色渲染模式的质量

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    //绘制直线
    canvas.drawLine(Offset(20, 20), Offset(300, 20), _paint);

    //绘制圆，参数为中心点，半径，画笔
    //canvas.drawCircle(Offset(150, 150), 150, _paint);

    //绘制椭圆
    //使用一个裕兴来确定绘制的范围，椭圆实在这个矩形之中内切的，第一个参数为右上角坐标，第二个参数为右下角坐标
    //canvas.drawOval(Rect.fromPoints(Offset(80, 200), Offset(300, 300)), _paint);

    //绘制圆角矩形
    //中心点坐标为200，200边长为100
    //Rect rect = Rect.fromCircle(center: Offset(200, 200), radius: 100);
    //根据矩形创建一个角度为20的圆角矩形
    //RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20));
    //开始绘制圆角矩形
    //canvas.drawRRect(rrect, _paint);

    //绘制嵌套矩形
    //初始化两个矩形
    //Rect rect1 = Rect.fromCircle(center: Offset(150, 150), radius: 80);
    //Rect rect2 = Rect.fromCircle(center: Offset(150, 150), radius: 40);
    //再把这两个矩形转化为圆角矩形
    //RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(20));
    //RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(10));
    //canvas.drawDRRect(outer, inner, _paint);

    //绘制点
    //PointMode的枚举类型有三个，points点，lines隔点连线，polygon相邻连接线
    canvas.drawPoints(
        PointMode.polygon,
        [
          Offset(50, 60),
          Offset(40, 90),
          Offset(100, 100),
          Offset(350, 350),
          Offset(400, 80),
          Offset(200, 200)
        ],
        _paint);

    //绘制圆弧
    const PI = 3.1415296;
    //定义矩形
    Rect rect1 = Rect.fromCircle(center: Offset(100, 100), radius: 100);
    print(rect1.left);
    //画1/2PI弧度的圆弧
    canvas.drawArc(rect1, 0, PI / 2, true, _paint);
    canvas.drawArc(rect1, PI, PI / 2, true, _paint);

    //绘制路径
    /* 
    使用Canvas的drawPath方法理论上可以绘制任意矢量图
    moveTo:将路径起始点移动到指定的位置
    lineTo:将当前位置连接指定点
    arcTo:曲线
    conicTo:贝济埃曲线
    close:关闭路径，连接路径的起始点
     */
    Path path = Path()..moveTo(100, 100);
    path.lineTo(200, 300);
    path.lineTo(100, 200);
    path.lineTo(150, 250);
    path.lineTo(150, 500);
    canvas.drawPath(path, _paint);

    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 18,
    ))
      ..addText(
          'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。');
    ParagraphConstraints pc = ParagraphConstraints(width: 200);
    Paragraph paragraph = pb.build()..layout(pc);
    canvas.drawParagraph(paragraph, Offset(30, 30));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
