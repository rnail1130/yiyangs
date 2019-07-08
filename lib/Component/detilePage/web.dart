import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebHome extends StatefulWidget {
  String url;
  String name;
  WebHome(this.url, this.name);
  @override
  _WebHomeState createState() => _WebHomeState(this.url, this.name);
}

class _WebHomeState extends State<WebHome> {
  String url;
  String name;
  bool loading = false;
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;
  int progress = 0;
  Timer _timer;
  _WebHomeState(this.url, this.name);

  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        //加载完成
        setState(() {
          isLoading = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoading = true;
        });
      }
    });

    _simulateProgress();
  }

  /// 模拟异步加载
  Future _simulateProgress() async {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(milliseconds: 50), (time) {
        progress++;
        if (progress > 98) {
          _timer.cancel();
          _timer = null;
          return;
        } else {
          setState(() {});
        }
      });
    }
  }

  Widget _progressBar() {
    return SizedBox(
      height: isLoading ? 2 : 0,
      child: LinearProgressIndicator(
        value: isLoading ? progress / 100 : 1,
        backgroundColor: Color(0xfff3f3f3),
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterWebviewPlugin.dispose();
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: _progressBar(),
          preferredSize: Size.fromHeight(2.0),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          this.name,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      url: this.url,
      withJavascript: true,
      withLocalStorage: true,
      withZoom: true,
    );
  }
}
