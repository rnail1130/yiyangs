import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_yiyangs/Model/home/messageProvide.dart';
import 'package:flutter_yiyangs/Pages/home/style.dart';
import 'package:scoped_model/scoped_model.dart';
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        //最新消息
        NewMessages(),
        //轮播图
        Sliders(),
        //主模块功能
        MainModel(),
      ],
    );
  }
}
class NewMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Mess>(
      model: Mess(context),
      child: ScopedModelDescendant<Mess>(
      builder: (context,_,model){
        return InkWell(
          onTap: ()=>model.toDeatile(),
          child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/index/newNewsBgc.png")
                ),
              ),

              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: Text('最新消息：',style: HomeStyle().font1,)
                  ),
                  Flexible(
                      child: Text(model.titleMessages,style: HomeStyle().font2,overflow: TextOverflow.ellipsis,)
                  ),
                ],
              )
          ),
        );
      },
      ),
    );
  }
}
class Sliders extends StatelessWidget {
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://60.247.61.162:8019/Upload/Images/ModelImages/Img-20190419173341.jpg",
      fit: BoxFit.fill,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 1,
/*          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),*/
          loop: false,
          scrollDirection: Axis.vertical,
          autoplay: false,
          onTap: (index) => print('点击了第$index个'),
        )
    );
  }
}
class MainModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 30,
          runSpacing: 14.0,
          runAlignment: WrapAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/bianmin.png"),
                  Text("政务便民")
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/bianmin.png"),
                  Text("政务便民")
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/bianmin.png"),
                  Text("政务便民")
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/bianmin.png"),
                  Text("政务便民")
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/bianmin.png"),
                  Text("政务便民")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
