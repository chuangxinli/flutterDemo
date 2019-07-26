import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'RealRichText.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var kHtml2 = """
<h1>Heading</h1>
<p>A paragraph with <strong>strong</strong> <em>emphasized</em> text.</p>
<ol>
  <li>List item number one</li>
  <li>
    Two
    <ul>
      <li>2.1 (nested)</li>
      <li>2.2</li>
    </ul>
  </li>
  <li>Three</li>
</ol>
<table bordert="1"><tr bordert="1"><td bordert="1">wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td bordert="1">qqqqqqqqqqqqqqqqqq</td></tr></table>
<p>12312312312312312312312313132231</p>
<p>And YouTube video!</p>

""";

  var data = """
    <div>
      <div id="header_set">
      <h1>Header 1</h1>
      <h2>Header 2</h2>
      <h3>Header 3</h3>
      <h4>Header 4</h4>
      <h5>Header 5</h5>
      <h6>Header 6</h6>
      <hr />
      Below hr
      <b>Bold</b>
      </div>
      <h1>Demo Page</h1>
      <p>This is a <u>fantastic</u> nonexistent product that you should really really really consider buying!</p>
      <a href="https://github.com">https://github.com</a><br />
      <br />
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <center>
        This is some center text... <abbr>ABBR</abbr> and <acronym>ACRONYM</acronym>
      </center>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <h2>Don't ask me to find <em>x</em> in</h2>
      <p>log<sub>2</sub>(<em>x</em><sup>2</sup> - 6<em>x</em>) = 3 + log<sub>2</sub>(1 - <em>x</em>)</p>
      <div id="bdi_test">
        <h3><code>bdi</code> and <code>bdo</code> Test:</h3>
        <p>
        In the example below, usernames are shown along with the number of points in a contest.
        If the bdi element is not supported in the browser, the username of the Arabic user would confuse the text (the bidirectional algorithm would put the colon and the number "90" next to the word "User" rather than next to the word "points").
        </p>
        
        <ul>
         <li>User <bdi>hrefs</bdi>: 60 points</li>
         <li>User <bdi>jdoe</bdi>: 80 points</li>
         <li>User <bdi>إيان</bdi>: 90 points</li>
         <bdo dir="rtl">Swapped!</bdo>
         <bdo dir="ltr">This text will go left to right!</bdo>
         <bdo dir="rtl">With bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="rtl">Without bdi: User إيان: 90 points</bdo>
         <bdo dir="ltr">ltr w/ bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="ltr">ltr w/o bdi: User إيان: 90 points</bdo>
        </ul>
      </div>
            <div>
              <table>
              <caption>This is the table's caption</caption>
                <tr><th>Head 1<sup>*</sup></th><th>Head 2</th><th>Head 3</th></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long <b>Data</b> 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Different 1</td><td>Different reallllllly long 2</td><td>Diff 3</td></tr>
                <tr><td colspan="2">This spans 2 columns</td><td>Normal td</td></tr>
                <tfoot>
                <tr><td>In foot 1</td><td>In foot 2</td><td>In foot long 2</td></tr>
                </tfoot>
              </table>
            </div>
            <div>Nested div</div>
            <div>
            <pre>
            jQuery("#monkey");
            </pre>
            <br />
            <p><q>This is a fancy quote</q></p>
            <br />
            <br />
            Second nested div<br />
            <figure>
            <img src="https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png" />
            <figcaption>Available on GitHub</figcaption>
            </figure>
            </div>
            <div>Third nested div</div>
          </div>
          <h1>Second header</h1>
          <h1>Third header</h1>
          <div>Fourth div</div>
  """;
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter html'),
        centerTitle: true,
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[
            FlatButton(
              textColor: Colors.blue,
              onPressed: () {},
              child: Text('获取html'),
            ),
            HtmlWidget(
              kHtml2,
              webView: true,
            ),
            RealRichText([
              TextSpan(text: 'hello', style: TextStyle(color: Colors.red)),
              ImageSpan(
                  NetworkImage(
                      'http://img2.51youpu.com/Public2/pic/82eedceceddd49928042f7bd970e1a3f.png'),
                  imageHeight: 40,
                  imageWidth: 100),
              TextSpan(
                text: 'world',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                  text:
                      'worldqeqwrwerqwewrqwqweqweqwqeqwrqewrwetweqrtewwewqerwrqw',
                  style: TextStyle(color: Colors.green)),
            ]),
            Image.network(
                'http://img2.51youpu.com/Public2/pic/82eedceceddd49928042f7bd970e1a3f.png'),
            Wrap(
              children: <Widget>[
                Text(
                  'adadadsd',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(children: [
                        Center(
                          child: Text('姓名dwdeweweeqw'),
                        ), 
                        Text('性别'),
                        Text('年龄'),
                        Text('身高'),
                      ]),
                      TableRow(children: [
                        Text('张三'),
                        Text('男'),
                        Text('26'),
                        Text('172'),
                      ]),
                      TableRow(children: [
                        Text('李四'),
                        Text('男'),
                        Text('28'),
                        Text('178'),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('dadsadasdasddasdad',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('dadsadasdasddasdad',
                      style: TextStyle(color: Colors.blue, fontSize: 8)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('666',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('234',
                      style: TextStyle(color: Colors.blue, fontSize: 8)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('666',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '23443241453412312343214135435324123424231545343244324',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 8,
                    ),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text('大'),
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
                  ),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/a496959ec0d140178ca383c48738b536.png',
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/82eedceceddd49928042f7bd970e1a3f.png',
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/87e95451b64d4df6b83029ad0fb004ab.png',
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/0ec7ac56d9244be295849b06041ab746.png',
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/960b5029c61e49bb8eaa210a47f573dd.png',
                  height: 30,
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/e20351b452ce4a90b412088156f52123.png',
                  height: 30,
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                      color: Colors.red,
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/973141d3fe3f48568f59c3669d405dd9.png',
                  height: 30,
                ),
                Text(
                  'adadadsd',
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy),
                ),
                Image.network(
                  'http://img2.51youpu.com/Public2/pic/191c0ba9fa184909939dabc4dfa09c39.png',
                  height: 30,
                ),
              ],
            ),
            Wrap(
              children: <Widget>[Text('hello..')],
            ),
            Wrap(
              children: <Widget>[Text('hello..')],
            ),
            Wrap(
              children: <Widget>[Text('hello..')],
            ),
            SingleChildScrollView(
              child: Html(
                data:
                    '''<P><FONT color="0000FF"></FONT>证明：（1）由柯西不等式得：（a+b）（a<SUP>531</SUP>+b<SUP>5</SUP>）≥（<img src="http://img2.51youpu.com/Public2/pic/87e95451b64d4df6b83029ad0fb004ab.png">+<img src="http://img2.51youpu.com/Public2/pic/0ec7ac56d9244be295849b06041ab746.png">）<SUP>2</SUP>=（a<SUP>3</SUP>+b<SUP>3</SUP>）<SUP>2</SUP>≥4，</P><P>当且仅当<img src="http://img2.51youpu.com/Public2/pic/960b5029c61e49bb8eaa210a47f573dd.png">=<img src="http://img2.51youpu.com/Public2/pic/e20351b452ce4a90b412088156f52123.png">，即a=b=1时取等号，</P><P>（2）∵a<SUP>3</SUP>+b<SUP>3</SUP>=2，</P><P>∴（a+b）（a<SUP>2</SUP>﹣ab+b<SUP>2</SUP>）=2，</P><P>∴（a+b）[（a+b）<SUP>2</SUP>﹣3ab]=2，</P><P>∴（a+b）<SUP>3</SUP>﹣3ab（a+b）=2，</P><P>∴<img src="http://img2.51youpu.com/Public2/pic/973141d3fe3f48568f59c3669d405dd9.png">=ab，</P><P>由均值不等式可得：<img src="http://img2.51youpu.com/Public2/pic/191c0ba9fa184909939dabc4dfa09c39.png">=ab≤（<img src="http://img2.51youpu.com/Public2/pic/83d03f74ef324ec881d20d081f8ef6a2.png">）<SUP>2</SUP>，</P><P>∴（a+b）<SUP>3</SUP>﹣2≤<img src="http://img2.51youpu.com/Public2/pic/82eedceceddd49928042f7bd970e1a3f.png">，</P><P>∴<img src="http://img2.51youpu.com/Public2/pic/a496959ec0d140178ca383c48738b536.png">（a+b）<SUP>3</SUP>≤2，</P><P>∴a+b≤2，当且仅当a=b=1时等号成立．</P><table border="1"><tr><td>wwwwwwwwwwwwwwwwwwwwwwwwwwww</td><td>qqqqqqqqqqqqqqqqqq</td></tr></table>''',
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
          ],
        ),
      ),
    );
  }
}
