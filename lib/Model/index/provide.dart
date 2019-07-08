import 'package:flutter_yiyangs/Pages/Tab0/firstTab.dart';
import 'package:flutter_yiyangs/Pages/Tab1/myCard.dart';
import 'package:flutter_yiyangs/Pages/Tab2/thirdTab.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Index extends Model  {
  BuildContext context;
  List<Widget> list = List();
  //默认选中的首页
  int currentIndex = 0;
  Index(this.context,{this.currentIndex = 0}){
    _listenNet();
    list
      ..add(firstTab())
      ..add(MyCard())
      ..add(thirdTab());
      notifyListeners();
  }
  //添加监听网络状态
  _listenNet(){
    print(11114);
  }
  //切换页面
  changePage(int index){
    currentIndex = index;
    notifyListeners();
  }
  int get currentIndexs =>currentIndex;
  Widget get lists => list[currentIndex];
  @override
  void dispose(){
  }

}
abstract class BaseModel {
  void dispose();
}