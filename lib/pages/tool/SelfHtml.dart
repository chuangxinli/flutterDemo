import 'package:flutter/material.dart';
import 'flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
//import 'package:html/parser.dart' as parse;

class SelfHtml extends StatefulWidget {
  SelfHtml({Key key}) : super(key: key);

  _SelfHtmlState createState() => _SelfHtmlState();
}

class _SelfHtmlState extends State<SelfHtml> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Self Html'),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        SingleChildScrollView(
              child: Html(
                data:
                    '''<P><FONT color="0000FF"></FONT>证明：（1）由柯西不等式得：（a+b）（a<SUP>531</SUP>+b<SUP>5</SUP>）≥（<img src="http://img2.51youpu.com/Public2/pic/87e95451b64d4df6b83029ad0fb004ab.png">+<img src="http://img2.51youpu.com/Public2/pic/0ec7ac56d9244be295849b06041ab746.png">）<SUP>2</SUP>=（a<SUP>3</SUP>+b<SUP>3</SUP>）<SUP>2</SUP>≥4，</P><P>当且仅当<img src="http://img2.51youpu.com/Public2/pic/960b5029c61e49bb8eaa210a47f573dd.png">=<img src="http://img2.51youpu.com/Public2/pic/e20351b452ce4a90b412088156f52123.png">，即a=b=1时取等号，</P><P>（2）∵a<SUP>3</SUP>+b<SUP>3</SUP>=2，</P><P>∴（a+b）（a<SUP>2</SUP>﹣ab+b<SUP>2</SUP>）=2，</P><P>∴（a+b）[（a+b）<SUP>2</SUP>﹣3ab]=2，</P><P>∴（a+b）<SUP>3</SUP>﹣3ab（a+b）=2，</P><P>∴<img src="http://img2.51youpu.com/Public2/pic/973141d3fe3f48568f59c3669d405dd9.png">=ab，</P><P>由均值不等式可得：<img src="http://img2.51youpu.com/Public2/pic/191c0ba9fa184909939dabc4dfa09c39.png">=ab≤（<img src="http://img2.51youpu.com/Public2/pic/83d03f74ef324ec881d20d081f8ef6a2.png">）<SUP>2</SUP>，</P><P>∴（a+b）<SUP>3</SUP>﹣2≤<img src="http://img2.51youpu.com/Public2/pic/82eedceceddd49928042f7bd970e1a3f.png">，</P><P>∴<img src="http://img2.51youpu.com/Public2/pic/a496959ec0d140178ca383c48738b536.png">（a+b）<SUP>3</SUP>≤2，</P><P>∴a+b≤2，当且仅当a=b=1时等号成立．</P><table border="1"><tr><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td></tr><tr><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td></tr></table><p>请看下面的表格：</p><table><tr><td>11</td><td>22</td></tr><tr><td>33</td><td>44</td></tr></table><span class="wavy">你好啊！</span><span class="underline">你好啊！</span><span class="singleDot">大</span><span class="singleDot">家</span><span class="singleDot">好</span><span class="singleDot">啊</span><span class="singleDot">A</span><span class="singleDot">a</span><span class="singleDot">B</span><span class="singleDot">b</span><span class="singleDot">C</span><span class="singleDot">c</span><span class="singleDot">1</span><span class="singleDot">2</span><span class="singleDot">3</span><span>念佛爱上你高i索尼官方哦i事发当时宽泛的时刻哦恩人泊尔夫摩洛哥你Jeri哦奖品为方吉奥i身体和你发i额突然hi哦v每次rope为人民，而非我批热潮日期从饿哦无人机饿哦乳胶漆排位v可是妇女iew偶尔从未如此i嗯我怕如此肉viojcrop问清楚让人家啊power v</span>''',
                //Optional parameters:
                padding: EdgeInsets.all(8.0),
                linkStyle: const TextStyle(
                  color: Colors.redAccent,
                  decorationColor: Colors.redAccent,
                  decoration: TextDecoration.underline,
                ),
                useRichText: false,
                onLinkTap: (url) {
                  print("Opening $url...");
                },
                onImageTap: (src) {
                  print(src);
                },
                //Must have useRichText set to false for this to work
                customRender: (node, children) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "custom_tag":
                        return Column(children: children);
                    }
                  }
                  return null;
                },
                customTextAlign: (dom.Node node) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "p":
                        return TextAlign.justify;
                    }
                  }
                  return null;
                },
                customTextStyle: (dom.Node node, TextStyle baseStyle) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "p":
                        return baseStyle
                            .merge(TextStyle(height: 2, fontSize: 20));
                    }
                  }
                  return baseStyle;
                },
              ),
            ),
      ],),
    );
  }
}