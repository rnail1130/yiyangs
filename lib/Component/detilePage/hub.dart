import 'package:flutter/material.dart';
import 'package:flutter_yiyangs/Component/detilePage/api.dart';
import 'package:flutter_yiyangs/Component/detilePage/web.dart';
class Deatile extends StatefulWidget {
  String titleName;
  String url;
  int id;
  Deatile(this.titleName,{this.id,this.url});
  @override
  _DeatileState createState() => _DeatileState();
}

class _DeatileState extends State<Deatile> {
  //判断可选参数url是否存在
  Widget _widgetPage(){
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    setState(() {
      if(this.widget.id == null){
        content = WebHome(this.widget.url,this.widget.titleName);//内嵌网页
      }else{
        content = ApiHome(this.widget.id,this.widget.titleName,this.widget.url);
      }
    });
    return content;
  }
  @override
  Widget build(BuildContext context) {
    return _widgetPage();
  }
}
