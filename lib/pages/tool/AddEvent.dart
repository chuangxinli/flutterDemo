import 'package:flutter/material.dart';
import 'SelfEvent.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义事件'),
        centerTitle: true,
      ),
      body: Container(
        width: 200,
        height: 100,
        color: Colors.blue,
        child: SelfEvent(
          text: '这个字定义按钮',
          icon: Icons.settings,
          onTap: () {
            print('触发了字定义事件');
          },
        ),
      ),
    );
  }
}
