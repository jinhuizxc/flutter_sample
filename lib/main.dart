import 'package:flutter/material.dart';
import 'package:flutter_sample/Home.dart';

/*
 * Flutter学习一：最简单的Flutter应用
 * https://blog.csdn.net/sinat_29256651/article/details/81277916
 *
 */
//void main() => runApp(MyApp());
void main() {
  //顶层容器，相当于rootview
  runApp(
    // Center为容器，展示控件为Text 需要添加TextDirection
    new Center(
      child: new Text(
        "Flutter",
        textDirection: TextDirection.ltr,  // rtl/ltr
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    ),
  );
}

/*
 * Flutter Sample
 *
 * Flutter-Samples
 * https://github.com/MeFelixWang/Flutter-Samples
 *
 * 设置图片配置到pubspec.yaml
 *
 * Flutter学习-基础组件Widgets
 * https://blog.csdn.net/skycnlr/article/details/86068812
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
          primarySwatch: Colors.red, // 设置导航栏与状态栏颜色
          appBarTheme: AppBarTheme(
//              brightness: Brightness.dark,
            color: Colors.blue, // 设置appBarTheme的颜色;
//              elevation: 20.0,  // 添加阴影
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
                // 设置标题栏字体、颜色大小
                title: TextStyle(color: Colors.white, fontSize: 18.0)),
          )),
      debugShowCheckedModeBanner: true,
      home: new HomePage(),
    );
  }
}
