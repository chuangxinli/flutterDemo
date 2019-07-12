import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState(){
    super.initState();
    new Future.delayed(Duration(seconds: 20), () {
      print('APP 页面即将呈现');
      Navigator.of(context).pushReplacementNamed('/app');
    });
  }
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Image.asset('images/01.jpeg', fit: BoxFit.fill,), 
      constraints: BoxConstraints.expand(),
    );
  }
}