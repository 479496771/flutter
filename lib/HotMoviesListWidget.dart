import 'package:flutter/material.dart';

class HotMoviesListWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('正在热映！'),
    );
  }
}