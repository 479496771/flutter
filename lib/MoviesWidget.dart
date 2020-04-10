import 'package:flutter/material.dart';
// 找片页面
class MoviesWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MoviesWidgetState();
  }
}

class MoviesWidgetState extends State<MoviesWidget> {

  @override
  Widget build(BuildContext context ) {
    return Center(
      child: Text("照片"),
    );
  }
}