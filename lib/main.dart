import 'package:flutter/material.dart';
import 'pages/Loading.dart';

import 'routes/Routes.dart';

void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter Demo',
  routes: routes,
  onGenerateRoute: onGenerateRoute,  //和routes两个用一个就行
  theme: mDefaultTheme,
  home: LoadingPage()
));

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.green
);