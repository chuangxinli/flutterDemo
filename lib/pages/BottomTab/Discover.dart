import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  Discover({Key key}) : super(key: key);
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('发现'),
       ),
    );
  }
}
