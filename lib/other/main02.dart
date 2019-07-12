
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_html/flutter_html.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      //改标题出现在安卓（任务管理器的程序快照上） IOS（程序切换管理器中）
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      //注册路由表
      routes: {
        "new_page": (content) => NewRoute(),
        "pageA": (context) => PageA(),
        "pageB": (context) => PageB()
      },
      onGenerateRoute: (settings) {
        print('onGenerateRoute');
        print(settings);
      }, 
      onUnknownRoute: (val) {
        print('onUnknownRoute');
        print(val);
      },
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}): super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    //print(widget.title);
    setState(() {
     _counter++; 
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this may tiems',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new NewRoute();
                }, settings: RouteSettings(arguments: Args('这个是方式一', 1111))));
              }
            ),
            FlatButton(
              child: Text('open new route by routeName'),
              textColor: Colors.blue,
              onPressed: () {
                //Navigator.pushNamed(context, 'new_page');
                Navigator.of(context).pushNamed('new_page', arguments: Args('这个是方式二', 2222));
              }
            ),
            FlatButton(
              child: Text('进入 PageA'),
              textColor: Colors.blue,
              onPressed: () {
                //Navigator.pushNamed(context, 'new_page');
                Navigator.of(context).pushNamed('pageA', arguments: Args('这个是方式二', 2222));
              }
            ),
            FlatButton(
              child: Text('进入 PageB'),
              textColor: Colors.blue,
              onPressed: () {
                //Navigator.pushNamed(context, 'new_page');
                Navigator.of(context).pushNamed('pageB', arguments: Args('这个是方式二', 2222));
              }
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Args args = ModalRoute.of(context).settings.arguments;
    print(args.name);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New route'),
      ),
      body: Center(
        //child: Text('This is new route'),
        child: Column(children: <Widget>[
          Text('This is new route'),   
          Text('from ${args.name}'),
          
        ],)
      )
    );
  }
}


class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Args args = ModalRoute.of(context).settings.arguments;
    print(args.name);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New route PageA'),
      ),
      body: Center(
        //child: Text('This is new route'),
        child: Column(children: <Widget>[
          Text('This is new route PageA', ),
          Text('from ${args.name}'),
          RandomWordsWidget(),
          Row(
            
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Wrap(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Text('Hello'),
            Text(' World..'),
            Text('World..aerdasddaadadadadasdadadddddddddddddddddddddddddddsadadadqweqweqweqweqw'),
            Image.network('https://b-ssl.duitang.com/uploads/item/201509/20/20150920065256_W25cC.jpeg', width: 14, height: 14,),
            Text('Hello'),
            Text(' World..'),
            Text('World..aerdasddaadadadadasdadadddddddddddddddddddddddddddsadadadqweqweqweqweqw'),
          ],),
          ),
        ],),
      )
    );
  }
}
class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Args args = ModalRoute.of(context).settings.arguments;
    print(args.name);
    // TODO: implement buildr
    return Scaffold(
      appBar: AppBar(
        title: Text('New route PageB'),
      ),
      body: Center(
        //child: Text('This is new route'),
        child: Column(children: <Widget>[
          Text('This is new route PageB'),
          Text('from ${args.name}'),
          Container(
            child: Image.network(
              'https://www.baidu.com/img/baidu_jgylogo3.gif',
              alignment: Alignment.topLeft,  //配置显示方位
              color: Colors.blue,
              colorBlendMode: BlendMode.screen, //混合模式
              fit: BoxFit.contain,  //图片的显示模式
              repeat: ImageRepeat.repeatY,
              /* 
              cover 不变行
              contain原图显示
              fitWidth横向充满
              fitHeight纵向充满
              fill 充满变行
               */
            ),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(150)
              ),
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.baidu.com/img/baidu_jgylogo3.gif',
                ),
                fit: BoxFit.contain
              )
              //borderRadius: BorderRadius.circular(150)
            ),
          ),
          Container(
            child: ClipOval(
              child: Image.network(
                'https://www.baidu.com/img/baidu_jgylogo3.gif',
                //width: 100,
                //height: 100,
                //fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: ClipOval(
              child: Image.asset(
                'images/01.jpeg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],)
      )
    );
  }
}
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(200.0), 
      child: Text(wordPair.asCamelCase,),
    );
  }
  
}
class Args {
  String name;
  int id;
  Args(this.name, this.id);
}