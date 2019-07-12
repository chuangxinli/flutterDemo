import 'package:flutter/material.dart';

class My extends StatefulWidget {
  My({Key key}) : super(key: key);

  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.line_weight),
                title: Text('账号管理'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  print('账号管理。。');
                  Navigator.of(context).pushNamed('/my_accountmanager');
                },
              ),
              Divider(
                height: 2,
                indent: 74,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置中心'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  print('设置中心。。');
                  Map args = {
                    'id': 222,
                    'value': "我是传过来的参数"
                  }; 
                  Navigator.of(context).pushNamed('/my_setting', arguments: args);
                },
              ),
              Divider(
                height: 2,
                indent: 74,
              ),
              ListTile(
                leading: Icon(Icons.more),
                title: Text('关于我们'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  print('关于我们。。');
                  Navigator.of(context).pushNamed('/my_aboutus');
                },
              ),
              Divider(
                height: 2,
                indent: 74,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(
              '退出登录',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              print('退出登录。。');
            },
          ),
        ),
      ],
    );
  }
}
