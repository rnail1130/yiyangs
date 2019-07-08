import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_yiyangs/Model/introduction/provide.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LauchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<Intro>(
        model: Intro(context),
        child:Stack(
          children: <Widget>[
            ScopedModelDescendant<Intro>(
              builder: (context,_,model){
                if(model.pageStatusz == 1){
                  if(Platform.isAndroid){
                    return Offstage(
                      offstage: false,
                      child: Image.asset( model.paperAs,
                        fit:BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    );
                  };
                  if(Platform.isIOS){
                    return Offstage(
                      offstage: false,
                      child: Image.asset(model.paperIs,
                        fit:BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    );
                  }
                };
                if(model.pageStatusz == 2){
                  return Offstage(
                    offstage: false,
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (BuildContext context,int index){
                        if(Platform.isIOS){
                          //ios相关代码
                          return Image.asset( model.paperIs,fit:BoxFit.fill,);
                        }else if(Platform.isAndroid){
                          //android相关代码
                          return Image.asset( model.paperAs,fit:BoxFit.fill,);
                        }
                      },
                      pagination: SwiperPagination(),
                      loop: false,
                      control: SwiperControl(),
                    )
                  );
                }
              }
            ),
            ScopedModelDescendant<Intro>(
                builder: (context,_,model){
                  if(model.pageStatusz == 1){
                    return Offstage(
                        offstage: false,
                        child: Container(
                          alignment: Alignment(0.9,0.95),
                          child: InkWell(
                            onTap:()=>model.pageTo(context),
                            child: new Container(
                                padding: EdgeInsets.all(12.0),
                                child: new Text(
                                  '跳过 ${model.count}',
                                  style: new TextStyle(fontSize: 14.0, color: Colors.white),
                                ),
                                decoration: new BoxDecoration(
                                    color: Color(0x66000000),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    border: new Border.all(
                                        width: 0.33, color: Colors.white))),
                          ),
                        )
                    );
                  };
                }
            ),
          ],
        )
      ),
    );
  }
}
