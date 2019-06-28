import 'package:flutter/material.dart';

// 设置GridItem 的item项
class GridItem extends StatelessWidget {
  // 定义常量用final
  final String cover;
  final String title;
  final String path;
  final Color color;

  // 定义构造方法, 可以为某个参数设置数据
  GridItem({this.cover, this.title, this.path, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    // 手势操作
    return GestureDetector(
      child: Container(
          alignment: Alignment.bottomCenter,
          // alignment：对齐方式，是相对于父容器位置（含义同Android的align一样，参数值不一样）
          // decoration：英文含义是装饰，在这里就是指背景图案
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image:
                  DecorationImage(image: AssetImage(cover), fit: BoxFit.cover)),
          child: Text(title, style: TextStyle(height: 1.5, color: color))),
      // 设置点击事件
      onTap: (){
        Navigator.pushNamed(context, path);
      }
    );
  }
}
