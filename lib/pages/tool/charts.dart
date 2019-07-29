import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
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
  //宽高
  int canvasWidth = 600;
  int canvasHeight = 800;
  //横坐标
  List coordX = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
  //数据
  List <List> scoreList = [
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
    [-14, 30, 20, -10, -20, 10],
    [-44, -44, 22, 20, -40, -15],
    [34, -66, -30, -20, 66, -5],
    [10, -30, 30, 20, -40, 15],
    [200, 30, 20, -10, -20, 10],
    [44, -44, 212, 20, -40, -15],
    [34, -66, -30, -20, 66, -5],
    [100, -30, 30, 20, -40, 15],
    [14, 30, 20, -10, -20, 10],
    [44, -44, 22, 20, -40, -15],
    [34, 66, 30, 20, 66, 5],
  ];

 
  void dealData() {
    List maxList = [];
    List minList = [];
    int maxNum;
    int minNum;
    for(int i = 0; i < scoreList.length; i++) {
      int minSum = 0;
      int maxSum = 0;
      for(int j = 0; j < scoreList[i].length; j++) {
        if(scoreList[i][j] > 0) {
          maxSum += scoreList[i][j];
        } else {
          minSum += scoreList[i][j];
        }
      }
      minList.add(minSum);
      maxList.add(maxSum);
    }
    maxList.sort((a, b) => b - a);
    minList.sort((a, b) => a - b);
    maxNum = maxList[0];
    minNum = minList[0];

    var times;
    int type = 0; 
    var temNum;
    int chartWidth;
    int chartHeight; 
    List origin;
    List <Map> coordY = [];
    if(maxNum > -minNum) {
      type = 1;
      temNum = maxNum;
      times = maxNum / (-minNum);
    }else{
      type = 2;
      temNum = -minNum;
      times = (-minNum) / maxNum;
    }
    if(times > 5) {

    }else if(times > 4) {

    }else if(times > 3) {
      
    }else if(times > 2) {

    }else if(times > 1) {
      var diff = temNum / 2;
      origin = [20, chartHeight / 2];
      for(int i = -3; i < 4; i++) {
        coordY.add({
          'value': (-3 * diff).toString(),
          'coord': [
            20,
            
          ]
        });
      }
    }

  }

  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //绘制纵坐标（线）
    canvas.drawLine(Offset(20, 20), Offset(20, 820), _paint);
    //绘制横坐标（线）
    canvas.drawLine(Offset(20, 500), Offset(500, 500), _paint);
    //绘制横坐标（刻度）
    for(int i = 0; i < coordX.length; i++){
      canvas.drawLine(Offset((20 + i * 20).toDouble(), 500), Offset((20 + i * 20).toDouble(), 500 + 4.0), _paint);
    }
    //绘制纵坐标（刻度）
    for(int i = -3; i < 5; i++){
      canvas.drawLine(Offset( 20, (500 - i * 100).toDouble()), Offset((20 - 4).toDouble(), (500 - i * 100).toDouble()), _paint);
      canvas.drawLine(Offset( 20, (500 - i * 100).toDouble()), Offset((20 + 8).toDouble(), (500 - i * 100 -8).toDouble()), _paint);
      canvas.drawLine(Offset( (20 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), Offset((500 + 8).toDouble(), (500 - i * 100 - 8).toDouble()), _paint);
    }
    //绘制圆柱体
    for(int i = 0; i < scoreList.length; i++) {
      int minAll = 0;
      int maxAll = 0;
      Color color1, color2; //color1代表第一个分数为大于0时对应学科的颜色；color2当分数小于0时上一个小于0的分数对应学科的颜色
      for(int j = 0; j < scoreList[i].length; j++) {
        switch (j) {
          case 0:
            _paint.color = Color(0xffff0000);
            break;
          case 1:
            _paint.color = Color(0xff00ff00);
            break;
          case 2:
            _paint.color = Color(0xff0000ff);
            break;
          case 3:
            _paint.color = Color(0xffffff00);
            break;
          case 4:
            _paint.color = Color(0xff00ffff);
            break;
          case 5:
            _paint.color = Color(0xff000000);
            break;
        }
        Rect rect;
        if(scoreList[i][j] > 0) {
          if(maxAll == 0) {
            color1 = _paint.color;
          }
          rect = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - maxAll -4).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - maxAll - scoreList[i][j] -4).toDouble()));
          canvas.drawRect(rect, _paint);
          Rect rectOvalBtm = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - maxAll -4 -2).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - maxAll -4 + 2).toDouble()));
          canvas.drawOval(rectOvalBtm, _paint);
          Rect rectOvalTop = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - maxAll - scoreList[i][j] -4 -2).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - maxAll - scoreList[i][j] -4 + 2).toDouble()));
          canvas.drawOval(rectOvalTop, _paint);
          maxAll += scoreList[i][j];
        }else if(scoreList[i][j] < 0){
          rect = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - minAll - 4).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - minAll - scoreList[i][j] - 4).toDouble()));
          canvas.drawRect(rect, _paint);
          Rect rectOvalBtm = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - minAll - scoreList[i][j] - 4 - 2).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - minAll - scoreList[i][j] - 4 + 2).toDouble()));
          canvas.drawOval(rectOvalBtm, _paint);
          Color temlColor = _paint.color;
          //确保相连的柱子视觉是凹陷的
          if(minAll == 0 && color1 != null) {
            _paint.color = color1;
          }else if(minAll < 0 && color2 != null){
            _paint.color = color2;
          } else {
           _paint.color = temlColor;
          }
          Rect rectOvalTop = Rect.fromPoints(Offset((20 + 20 * i + 5).toDouble(), (500 - minAll - 4 - 2).toDouble()), Offset((20 + 20 * i + 15).toDouble(), (500 - minAll - 4 + 2).toDouble()));
          canvas.drawOval(rectOvalTop, _paint);
          color2 = temlColor;
          minAll += scoreList[i][j];
        }
      }
      //绘制字体
      
      //横坐标的文字
      for(int i = 0; i <= coordX.length; i++){
        ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 10,
        ))
        ..pushStyle(
          ui.TextStyle(color: Color(0xff000000))
        );
        ui.ParagraphConstraints pc;
        if(i == coordX.length) {
          pb.addText('单位：小时');
          pc = ui.ParagraphConstraints(width: 60); //文字在内居中
        }else {
          pb.addText(coordX[i].toString());
          pc = ui.ParagraphConstraints(width: 20); //文字在内居中
        }
        ui.Paragraph paragraph = pb.build()..layout(pc);
        canvas.drawParagraph(paragraph, Offset((20 + i * 20 - 10).toDouble(), (500 + 10).toDouble()));
      }
      //纵坐标文字
      for(int i = -3; i <= 5; i++){
        ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 10,
          ))
          ..pushStyle(
            ui.TextStyle(color: Color(0xff000000))
          );
          ui.ParagraphConstraints pc;
          if(i == 5) {
            pb.addText('单位：分数');
            pc = ui.ParagraphConstraints(width: 60); //文字在内居中
          }else {
            pb.addText((500 - (500 + i * 100)).toString());
            pc = ui.ParagraphConstraints(width: 40); //文字在内居中
          }
          ui.Paragraph paragraph = pb.build()..layout(pc);
          canvas.drawParagraph(paragraph, Offset( -20, (500 - i * 100).toDouble()));
      }
    }
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}