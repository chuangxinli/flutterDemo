import 'package:flutter/material.dart';

class AccountManager extends StatefulWidget {
  AccountManager({Key key}) : super(key: key);

  _AccountManagerState createState() => _AccountManagerState();
}

class _AccountManagerState extends State<AccountManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text('账号管理'),
        centerTitle: true,
      ),
      body: Center(child: Text('账号管理'),),
    );
  }
}