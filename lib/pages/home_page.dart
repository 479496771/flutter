import 'package:flutter/material.dart';
import '../service/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic showContent = '正在输入数据';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('请求数据')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  _jike();

                },
                child: Text('请求数据'),
              ),
              Text(showContent),
            ]
          )
        ),
      ),
    );
  }

  void _jike(){
    print('开始像极客时间请求数据.............');
    getTestData().then((res) {
      setState(() {
        res ??= '暂无数据';
        showContent =  res["total"].toString();
        print(res);
      });
    });
  }

}