import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_yiyangs/styles/style.dart';
import 'Component/Internationalization/localeCommon.dart';
import 'Pages/introduction/introduction.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('zh', 'CN'),
      debugShowCheckedModeBanner: false, //关闭debug显示条
      title: 'MyApp',
      theme: ThemeData(
        platform: TargetPlatform.iOS, //手势滑动关闭页面
        primaryColor: YYColors.primarySwatch,
        accentColor: YYColors.primarySwatch,
        backgroundColor: Colors.white,
      ),
      home: LauchPage(),
      //home: BottomNav(),
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CommonLocalizationsDelegate(),
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

