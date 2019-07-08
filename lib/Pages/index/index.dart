import 'package:flutter/material.dart';
import 'package:flutter_yiyangs/Model/index/provide.dart';
import 'package:scoped_model/scoped_model.dart';
class BottomNav extends StatelessWidget {
  final int count;
  BottomNav({this.count = 0});
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Index>(
      model: Index(context,currentIndex: count),
      child: ScopedModelDescendant<Index>(
        builder: (context,_,model) {
          return Scaffold(
            body: Center(
              child: model.lists,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndexs,
              onTap: (index)=> model.changePage(index),
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("首页")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card),
                    title: Text("我的虚拟卡")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text("我的")
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
