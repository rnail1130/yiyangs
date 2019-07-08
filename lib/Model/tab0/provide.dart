import 'dart:convert';

import 'package:flutter_yiyangs/Component/net/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_yiyangs/Config/apiHost.dart';
class TabF extends Model{
  String status = "loading";
  TabF(){
    _getData().then((_){
      status = "ok";
      notifyListeners();
    });
  }
  String types = "多云";
  String highs = "0";
  String lows = "0";
  String aqis = "0";
  Future _getData()async{
    var res = await httpManager.netFetch(HostAddres.getWeatherUrl(),null, null,  null);
    Map weatherMap = json.decode(res.data.toString());
    RegExp exp = new RegExp(r'\d{1,2}');
    highs = exp.stringMatch(weatherMap['d']['high']);
    lows = exp.stringMatch(weatherMap['d']['low']);
    aqis = weatherMap["d"]["aqi"];
    types = weatherMap["d"]["type"];
    notifyListeners();
  }
  String get stats => status;
  String get type => types;
  String get high => highs;
  String get low => lows;
  String get aqi => aqis;
}