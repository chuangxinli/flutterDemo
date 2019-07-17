import 'package:flutter/material.dart';

class StudyTask extends StatefulWidget {
  StudyTask({Key key}) : super(key: key);

  _StudyTaskState createState() => _StudyTaskState();
}

class _StudyTaskState extends State<StudyTask> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        FlatButton(
          child: Text('webview 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/web_view');
          },
        ),
        FlatButton(
          child: Text('canvas 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/canvas');
          },
        ),
        FlatButton(
          child: Text('自定义事件 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/AddEvent');
          },
        ),
        FlatButton(
          child: Text('flutter html 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/flutterHtml');
          },
        ),
        FlatButton(
          child: Text('查看设备的宽高'),
          onPressed: () {
            print(MediaQuery.of(context).size.height);
            print(MediaQuery.of(context).size.width);
          },
        ),
        FlatButton(
          child: Text('charts 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/charts');
          },
        ),
        FlatButton(
          child: Text('charts_flutter 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/chartsFlutter');
          },
        ),
      ],
    );
  }
}