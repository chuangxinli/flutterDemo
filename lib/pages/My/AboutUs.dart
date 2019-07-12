import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('关于我们'),
      ),
    );
  }
}