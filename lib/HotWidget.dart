import 'package:flutter/material.dart';
// 热映页面
class HotWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState(); 
  }
}

class HotWidgetState extends State<HotWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Text (
          '深圳',
          style: TextStyle(fontSize: 16),
        ),
        Icon(Icons.arrow_drop_down),
        Expanded(
          flex: 1,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: '\uE8b6 电影 / 电视剧 / 影人',
              hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
              contentPadding: EdgeInsets.only(top: 8, bottom: 8),
              border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
              filled: true,
              fillColor: Colors.black12
            ),
          ),
        )
      ],
    );
  }
}