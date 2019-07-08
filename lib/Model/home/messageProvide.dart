import 'dart:convert';

import 'package:flutter_yiyangs/Component/detilePage/hub.dart';
import 'package:flutter_yiyangs/Component/net/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_yiyangs/Config/apiHost.dart';
import 'package:flutter/material.dart';
class Mess extends Model {
  BuildContext context;
  Mess(this.context){
    _getData();
  }
  String titleMessage = "暂无数据";
  int id;
  Future _getData()async{
    var res = await httpManager.netFetch(HostAddres.getNewMessageUrl(),{"pageIndex":1}, null,  null);
    Map NewMap = json.decode(res.data.toString());
    titleMessage = NewMap["d"]["Result"][0]["Title"];
    id = NewMap["d"]["Result"][0]["Id"];
    notifyListeners();
    print(res.data);
  }
  //详情组件
  toDeatile(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Deatile(
          titleMessage,
          id: id,
          url: HostAddres.getNewMessage(),
        )));
  }
  String get titleMessages => titleMessage;
}