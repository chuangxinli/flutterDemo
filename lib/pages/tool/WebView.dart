import 'package:flutter/material.dart';

class WebView extends StatefulWidget {
  WebView({Key key}) : super(key: key);

  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center( 
        child: Text('webview..'),
      ),
    );
  }
}