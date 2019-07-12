import 'package:flutter/material.dart';
import 'BottomTab/Discover.dart';
import 'BottomTab/My.dart';
import 'BottomTab/KnowledgeMap.dart';
import 'BottomTab/StudyTask.dart';


class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
    
  int _selectedIndex = 0;
  final _titleList = [
    '学习任务',
    '知识图谱',
    '发现',
    '我'
  ];
  final _backgroundColorList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Color(0xffcdcdcd)
  ];
  final _pageList = [
    StudyTask(),
    KnowledgeMap(),
    Discover(),
    My(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[_selectedIndex]),
        centerTitle: true,
      ),
      body: _pageList[_selectedIndex],
      backgroundColor: _backgroundColorList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? Image.asset('images/bottomtabs/studytask_active.png', width: 32.0, height: 28.0,) : Image.asset('images/bottomtabs/studytask.png', width: 32.0, height: 28.0,),
            title: Text('学习任务', style: TextStyle(
              color: _selectedIndex == 0 ? Color(0xff1afa29) : Color(0xff707070)
            ),), 
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Image.asset('images/bottomtabs/knowledgemap_active.png', width: 32.0, height: 28.0,) : Image.asset('images/bottomtabs/konwledgemap.png', width: 32.0, height: 28.0,),
            title: Text('知识图谱', style: TextStyle(
              color: _selectedIndex == 1 ? Color(0xff1afa29) : Color(0xff707070)
            ),), 
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? Image.asset('images/bottomtabs/discover_active.png', width: 32.0, height: 28.0,) : Image.asset('images/bottomtabs/discover.png', width: 32.0, height: 28.0,),
            title: Text('发现', style: TextStyle(
              color: _selectedIndex == 2 ? Color(0xff1afa29): Color(0xff707070)
            ),), 
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3 ? Image.asset('images/bottomtabs/my_active.png', width: 32.0, height: 28.0,) : Image.asset('images/bottomtabs/my.png', width: 32.0, height: 28.0,),
            title: Text('我', style: TextStyle(
              color: _selectedIndex == 3 ? Color(0xff1afa29) : Color(0xff707070)
            ),), 
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}