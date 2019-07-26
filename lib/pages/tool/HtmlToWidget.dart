import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter/material.dart';

class HtmlToWidget extends StatelessWidget {
  final String data;
  const HtmlToWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: parse(data),);
  }
  static List<Widget> pList = [];
  static const _supportedElements = [
    'p',
    'div',
    'span',
    'table',
    'thead',
    'tbody',
    'td',
    'tr',
    'img',
    'image',
    'u',
    'i',
    'strong',
    'sub',
    'sup',
    'br',
    'em'
  ];
  List<Widget> parse(String data) {
    List<Widget> widgetList = new List<Widget>();
    data = data.replaceAll('\n', '<br />').replaceAll('&nbsp;', ' ').replaceAll('&nbsp', ' ');
    dom.Document document = parser.parse(data);
    widgetList.add(_parseNode(document.body));
    return widgetList;
  }

  Widget _parseNode(dom.Node node) {
    if (node is dom.Element) {
      if (!_supportedElements.contains(node.localName)) {
        return Container();
      }
      switch (node.localName) {
        case 'div':
        case 'p':
          return Container(
            child: Column(
              children: _parseNodeList(node.nodes),
            ),
          );
        case 'span':
          return Wrap(
            children: _parseNodeList(node.nodes),
          );
      }
    } else if (node is dom.Text) {
      if (node.text.trim() == "" && node.text.indexOf(" ") == -1) {
        return Wrap();
      }
      if (node.parent.attributes['class'] != null &&
          node.parent.attributes['class'].indexOf('singleDot') != -1) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(node.text),
            ),
            Positioned(
              top: 10,
              child: Text(
                '·',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        );
      }
      if (node.parent.attributes['class'] != null &&
              node.parent.attributes['class'].indexOf('underline') != -1 ||
          node.parent.localName == 'u') {
        return Container(
          padding: EdgeInsets.only(top: 6),
          child: Text(node.text,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid)),
        );
      }
      if (node.parent.attributes['class'] != null &&
          node.parent.attributes['class'].indexOf('wavy') != -1) {
        return Container(
          padding: EdgeInsets.only(top: 6),
          child: Text(node.text,
              style: TextStyle(color: Colors.blue, fontSize: 14)),
        );
      }
      if (node.parent.localName == 'sub') {
        return Container(
          padding: EdgeInsets.only(top: 16),
          child: Text(node.text,
              style: TextStyle(color: Colors.blue, fontSize: 8)),
        );
      }
      if (node.parent.localName == 'sup') {
        return Container(
          padding: EdgeInsets.only(top: 6),
          child: Text(node.text,
              style: TextStyle(color: Colors.blue, fontSize: 8)),
        );
      }
      if (node.parent.localName == 'em' || node.parent.localName == 'i') {
        return Container(
          padding: EdgeInsets.only(top: 6),
          child: Text(node.text,
              style: TextStyle(color: Colors.blue, fontSize: 14, fontStyle: FontStyle.italic)),
        );
      }
      if (node.parent.localName == 'strong') {
        return Container(
          padding: EdgeInsets.only(top: 6),
          child: Text(node.text,
              style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w800)),
        );
      }
    }
    return Wrap();
  }

  List<Widget> _parseNodeList(List<dom.Node> nodeList) {
    return nodeList.map((node) {
      return _parseNode(node);
    }).toList();
  }
}
