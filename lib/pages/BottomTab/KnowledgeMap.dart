import 'package:flutter/material.dart';

class KnowledgeMap extends StatefulWidget {
  KnowledgeMap({Key key}) : super(key: key);

  _KnowledgeMapState createState() => _KnowledgeMapState();
}

class _KnowledgeMapState extends State<KnowledgeMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text('知识图谱'),
        ),
    );
  }
}