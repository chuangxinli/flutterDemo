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
      ],
    );
  }
}