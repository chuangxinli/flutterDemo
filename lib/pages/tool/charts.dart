import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text('canvas 表格'),
        centerTitle: true,
      ),
      body: Container( 
        padding: EdgeInsets.all(20),
        child: CustomPaint( 
          painter: LinePainter(),
        ),
      ),
    );
  }
}
Map DealData(num maxNUm, num minNum) {
  Map map = Map();
  num referNum = 0;
  num maxRow = 8;
  num rowLength = 24;
  num diffNum = 0;  //分段间隔
  if(minNum < 0){
    if(maxNUm * maxNUm > minNum * minNum){
      referNum = maxNUm;
    }else{
      referNum = -minNum;
    }
  }
  diffNum = (referNum / 4).ceil();
  map['lineList'] = [];

  

}
class LinePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.red //画笔颜色
    ..strokeCap = StrokeCap.square //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..strokeWidth = 2 //画笔的粗细
    ..style = PaintingStyle.fill //绘画样式默认为填充  fill
    ..blendMode = BlendMode.hardLight //颜色混合模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 0.0) //模糊遮罩效果
    ..filterQuality = FilterQuality.high; //颜色渲染模式的质量
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawLine(Offset(20, 20), Offset(20, 400), _paint);
    canvas.drawLine(Offset(20, 400), Offset(400, 400), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
