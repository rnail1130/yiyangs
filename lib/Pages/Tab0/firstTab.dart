import 'package:flutter/material.dart';
import 'package:flutter_yiyangs/Model/tab0/provide.dart';
import 'package:flutter_yiyangs/Pages/home/home.dart';
import 'package:scoped_model/scoped_model.dart';
import 'style.dart';
class firstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TabF>(
      model:TabF() ,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                title: HeaderTitle(),
                elevation: 0.0,
                backgroundColor:  Theme.of(context).backgroundColor,
              ),
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07)
          ),
          body: HomeBody()
        ),
      ),
    );
  }
}
class HeaderTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Image.asset("assets/img/index_pic47.png",width: 90,height: 40,),
          ),
          SizedBox(width: 10,),
          ScopedModelDescendant<TabF>(
            builder: (context,child,modle){
              if(modle.stats == "loading"){
                return Center(child: Text("数据获取中...",style: Tab0Style.fon2,));
              }
              if(modle.stats == "ok"){
                return Expanded(
                  flex: 7,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(modle.type,style: Tab0Style.fon1,),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child:Text(modle.high.toString()+'°C - '+modle.low.toString()+"°C",style:Tab0Style.fon2_1,)
                          ),
                          Flexible(
                              child: Text("空气质量:"+modle.aqi,style: Tab0Style.fon2,)
                          ),

                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Expanded(
            flex: 1,
            child: Text("|",style: Tab0Style.fon3,),
          ),
          Expanded(
            flex: 1,
            child:InkWell(
              onTap: (){},
              child: Icon(Icons.photo_camera,color: Colors.black,),
            )
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
