import 'dart:async';
import 'package:flutter_yiyangs/Pages/index/index.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Intro extends Model with BaseModel {
  BuildContext context;
  Intro(this.context){
    _getPages().then((_){
      _timeDown();
    });
  }
  //事件状态
  //1单图2轮播
  int pageStatus = 1;
  String paperA = "assets/images/guide_logo.png";
  String paperI = "assets/images/guide_logo_iphonex.png";
  Timer _countDownTimer;
  int _count = 3;
  //数据请求
  Future _getPages()async{
    pageStatus = 1;
    notifyListeners();
  }
  _timeDown(){
    _countDownTimer=
      Timer.periodic(Duration(seconds: 1), (timer){
        _count--;
        notifyListeners();
        if(_count == 0){
          _countDownTimer.cancel();
          pageTo(this.context);
        }
      });
  }
  pageTo(BuildContext context){
    _countDownTimer.cancel();
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>BottomNav() ), (Route<dynamic> rout)=>false);
  }
  @override
  void dispose(){
    _countDownTimer?.cancel();
  }
  int get pageStatusz => pageStatus;
  String get paperAs => paperA;
  String get paperIs => paperI;
  int get count => _count;
}
abstract class BaseModel {
  void dispose();
}