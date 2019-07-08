import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_yiyangs/Component/net/api.dart';

class ApiHome extends StatefulWidget {
  int id;
  String title;
  String url;
  ApiHome(this.id, this.title, this.url);
  @override
  _ApiHomeState createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {
  String dz;
  bool status = false;
  var _futureBuilderFuture;
  @override
  void initState() {
    super.initState();

    ///用_futureBuilderFuture来保存_gerData()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = getPageData.getdata(widget.id, widget.url);
  }

  //加载中的小部件
  Widget _loadingWidget() {
    Widget content;
    content = new Center(
      child: SpinKitCubeGrid(
        color: Colors.orange,
        size: 50.0,
      ),
    );
    return content;
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none: //还没有开始网络请求

      case ConnectionState.active: //正在链接

      case ConnectionState.waiting: //等待阶段
        return Center(child: Text(""),);
      case ConnectionState.done: //请求成功
        Map userMap = json.decode(snapshot.data.toString());
        var trrs = userMap['d']['Result']['Content'];
        dz = trrs.toString();
        setState(() {
          status = true;
        });
        return Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(userMap['d']['Result']['Title']),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "来源：" + userMap['d']['Result']['Cite'],
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                ),
                Text(
                  userMap['d']['Result']['DateTime'],
                  style:
                  TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Html(
                  data: dz,
                ),
              ],
            ));
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: status?_loadingWidget():SingleChildScrollView(
          child: FutureBuilder(
            builder: _buildFuture,
            future: _futureBuilderFuture,
          )),
    );
  }
}

//页面获取数据
class getPageData {
  static getdata(id, url) async {
    var res = await httpManager.netFetch(url, {"ArticleId": id}, null, null);
    return res.data;
  }
}
