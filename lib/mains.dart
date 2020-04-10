import 'package:flutter/material.dart';
import 'HotWidget.dart';
import 'MoviesWidget.dart';
import 'MineWidget.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: '豆瓣电影'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int _selectedIndex = 0;

final _widgetItems = [HotWidget(), MoviesWidget(), MineWidget()];

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetItems[_selectedIndex],//选中不同的选项显示不同的界面
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映')),
          BottomNavigationBarItem(icon: Icon(Icons.panorama_fish_eye), title: Text('照片')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],// BottomNavigationBarItem 的 icon 用的是Icon Widget实现的
        currentIndex: _selectedIndex, // 默认选中的index
        fixedColor: Colors.blue, // 选中时的颜色
        type: BottomNavigationBarType.fixed, // 类型为fixed
        onTap: _onItemTapped,
      ),
      
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 刷新界面
    });
  }
}



