import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  final Map arguments;
  Setting({Key key,this.arguments}) : super(key: key);
  _SettingState createState() => _SettingState(arguments: this.arguments);
}

class _SettingState extends State<Setting> {
  Map arguments;
  _SettingState({this.arguments});
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    Map args = ModalRoute.of(context).settings.arguments;
    print(args['id']);
    print('+++++++++++++++++++++++++++++');
    print(arguments);
    return  Scaffold(
      appBar: AppBar(
        title: Text('设置中心'),
        centerTitle: true,
      ),
      body: Container(child: Text('设置中心${args["id"]}----${args['value']}',), color: Colors.red,),
    );
  }
}