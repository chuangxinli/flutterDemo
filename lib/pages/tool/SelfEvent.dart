import 'package:flutter/material.dart';
import 'PlatformTapWidget.dart';


class SelfEvent extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const SelfEvent({Key key, this.icon, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PlatformTapWidget(
        onTap: onTap,
        child: Row(children: <Widget>[
          Icon(icon),
          Text(text)
        ],),
      ),
    );
  }
}