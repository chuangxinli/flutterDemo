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
    canvas.drawLine(Offset(20, 20), Offset(20, 820), _paint);
    canvas.drawLine(Offset(20, 500), Offset(500, 500), _paint);
    for(int i = 0; i < 24; i++){
      canvas.drawLine(Offset((20 + i * 20).toDouble(), 500), Offset((20 + i * 20).toDouble(), 500 + 4.0), _paint);
    }
    for(int i = -3; i < 5; i++){
      canvas.drawLine(Offset( 20, (500 + i * 100).toDouble()), Offset((20 - 4).toDouble(), (500 + i * 100).toDouble()), _paint);
      canvas.drawLine(Offset( 20, (500 - i * 100).toDouble()), Offset((20 + 8).toDouble(), (500 - i * 100 -8).toDouble()), _paint);
      canvas.drawLine(Offset( (20 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), Offset((500 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), _paint);
    }

    List scoreList = [
      [70, -30, 300, 20, -40, 15],
      [14, 30, 20, -10, -20, 310],
      [44, -44, 22, 20, -40, -15],
      [34, -66, -30, -120, 66, -5],
      [10, -130, 230, 20, -40, 15],
      [14, 30, 20, -10, -20, 10],
      [44, -44, 22, -220, -40, -15],
      [34, -66, -30, -20, 166, -5],
      [10, -30, 30, 20, -40, 15],
      [14, 30, 20, -10, -20, 10],
      [44, -44, 22, 20, -40, -15],
      [34, -66, -30, -20, 66, -5],
      [10, -30, 130, 20, -40, 15],
      [14, 30, 20, -10, -20, 10],
      [44, -44, 22, 20, -40, -15],
      [34, -66, -30, -20, 66, -5],
      [10, -30, 30, 20, -40, 15],
      [200, 30, 20, -10, -20, 10],
      [44, -44, 212, 20, -40, -15],
      [34, -66, -30, -20, 66, -5],
      [100, -30, 30, 20, -40, 15],
      [14, 30, 20, -10, -20, 10],
      [44, -44, 22, 20, -40, -15],
      [34, -66, -30, -20, 66, -5],
    ];
    for(int i = 0; i < scoreList.length; i++) {
      int minAll = 0;
      int maxAll = 0;
      for(int j = 0; j < scoreList[i].length; j++) {
        switch (j) {
          case 0:
            _paint.color = Colors.blue;
            break;
          case 1:
            _paint.color = Colors.pink;
            break;
          case 2:
            _paint.color = Colors.yellow;
            break;
          case 3:
            _paint.color = Colors.green;
            break;
          case 4:
            _paint.color = Colors.brown;
            break;
          case 5:
            _paint.color = Colors.black;
            break;
        }
        
        if(scoreList[i][j] > 0) {
          Rect rect = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - maxAll).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - maxAll - scoreList[i][j]).toDouble()));
          canvas.drawRect(rect, _paint);
          maxAll += scoreList[i][j];
        }else{
          Rect rect = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - minAll).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - minAll - scoreList[i][j]).toDouble()));
          canvas.drawRect(rect, _paint);
          minAll += scoreList[i][j];
        }
      }
    }

  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class CirclePainter extends CustomPainter {
  Color color;
  CirclePainter(
    this.color, 
  );
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
    canvas.drawLine(Offset(20, 20), Offset(20, 820), _paint);
    canvas.drawLine(Offset(20, 500), Offset(500, 500), _paint);
    for(int i = 0; i < 24; i++){
      canvas.drawLine(Offset((20 + i * 20).toDouble(), 500), Offset((20 + i * 20).toDouble(), 500 + 4.0), _paint);
    }
    for(int i = -3; i < 5; i++){
      canvas.drawLine(Offset( 20, (500 + i * 100).toDouble()), Offset((20 - 4).toDouble(), (500 + i * 100).toDouble()), _paint);
      canvas.drawLine(Offset( 20, (500 - i * 100).toDouble()), Offset((20 + 8).toDouble(), (500 - i * 100 -8).toDouble()), _paint);
      canvas.drawLine(Offset( (20 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), Offset((500 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), _paint);
    }
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}