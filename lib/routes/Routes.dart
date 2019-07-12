

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../pages/App.dart';
import '../pages/My/AboutUs.dart';
import '../pages/My/AccountManager.dart';
import '../pages/My/Setting.dart';

import '../pages/tool/Canvas.dart';

//配置路由
final routes = {
  '/app': (context) => App(),
  '/my_aboutus': (content) => AboutUs(),
  '/my_accountmanager': (content) => AccountManager(),
  '/my_setting': (conent, {arguments}) => Setting(arguments: arguments),
  '/web_view': (_) => WebviewScaffold(
    url: 'https//www.baidu.com/',
    appBar: AppBar(
      title: Text('webview'),
      centerTitle: true,
    ),
    withZoom: true,
    withLocalStorage: true,
  ),
  '/canvas': (context) => ToolCanvas()
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  print('--------------------------------');
  print(settings);
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
