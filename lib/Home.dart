import 'package:flutter/material.dart';
import 'package:flutter_sample/GridItem.dart';

/*
 * 设置有状态的Widget
 */
//class HomePage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _HomePage();
//  }
//}

//class _HomePage extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text('sample'),
//      ),
//      // Column纵向排列;
//      body: new Column(
//        children: <Widget>[
//          Text('test'),
//          Text('test'),
//          Text('test'),
//        ],
//      ),
//    );
//  }
//}

/*
 * 设置无状态的Widget
 * 
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter Effects'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(), // 弹跳
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(10.0), // 设置间距
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              children: <Widget>[
                GridItem(
                  cover: 'images/float_navigator.png',
                  title: 'Float Navigator',
                  path: '/navigator',
                ),
                GridItem(
                    cover: 'images/carousel.gif',
                    title: 'Carousel',
                    color: Colors.red,
                    path: '/carousel')
              ],
              crossAxisSpacing: 10.0,  // 纵轴方向子元素的间距
              childAspectRatio: 0.78,  // 子元素在纵轴长度和主轴长度的比例。由于crossAxisCount指定后子元素纵轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度
              mainAxisSpacing: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
