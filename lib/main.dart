import 'package:flutter/material.dart';
import 'package:flutter_sample/Home.dart';

/*
 * Flutter学习一：最简单的Flutter应用
 * https://blog.csdn.net/sinat_29256651/article/details/81277916
 * 
 * Flutter学习二：最简单的Material Flutter应用
 * https://blog.csdn.net/sinat_29256651/article/details/81291751
 *
 * Flutter学习三：静态页面练习（Row&Column）
 * https://blog.csdn.net/sinat_29256651/article/details/81320840
 *
 * Flutter学习四：GridView练习
 * https://blog.csdn.net/sinat_29256651/article/details/81321263
 *
 * Flutter学习五：ListView&ScrollView练习
 * https://blog.csdn.net/sinat_29256651/article/details/81350217
 *
 * Flutter学习六：GestureDetector练习
 * https://blog.csdn.net/sinat_29256651/article/details/81368812
 *
 * Flutter学习七：TextField练习
 * https://blog.csdn.net/sinat_29256651/article/details/81369035
 *
 * Flutter学习八：Navigator页面跳转练习
 * https://blog.csdn.net/sinat_29256651/article/details/81394626
 *
 * Flutter学习九：Http练习
 * https://blog.csdn.net/sinat_29256651/article/details/81394923
 *
 *
 */
//void main() => runApp(MyApp());
void main() {
  //顶层容器，相当于rootview

  runApp(
//    firstWidget(),
//    MaterialAppWidget(),
//    RowAndColumnWidget(),
//    GridViewWidget(),
//    ListViewAndScrollView(),
//  GestureDetectorWidget(),
//    TestFieldWidget(),
//    NavigatorWidget(),
      HttpTest(),
  );
}

class HttpTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'sample app',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HttpTestPage(),
    );
  }
}

// 发送请求-->读取body中的数据-->解析完成-->设置状态
// http: 0.11.3+16
class HttpTestPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HttpTestState();
  }
}

class _HttpTestState extends State<HttpTestPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('HttpTestState'),
      ),
    );
  }
}

// 在Flutter中页面跳转使用的是Navigator和RactNative思想一样代码如下
class NavigatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'NavigatorWidget',
      home: new FirstPage(),
    );
  }
}

// 第一个页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: Text('点我进入第二个页面'),
          //跳转到新的页面我们需要调用navigator.push方法 这个和reactNative的方式相同
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage()));
          },
        ),
      ),
    );
  }
}

//  第二个页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: new Center(
        child: new RaisedButton(
          //onPressed  点击事件
          child: Text('点我回到第一个页面'),
            onPressed: (){
              //回到上一个页面 相当于finish
              Navigator.pop(context);
        }),
      ),
    );
  }
}

// TextField相当于Android中的EditText
class TestFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('TestFieldWidget'),
//          centerTitle: true,  // 设置居中
        ),
        body: new TestFieldPage(),
      ),
    );
  }
}

class TestFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestFieldPageState();
  }
}

class _TestFieldPageState extends State<TestFieldPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          new TextField(
            //相当于Android属性hint
            decoration: new InputDecoration(hintText: '请输入用户名'),
          ),
          new TextField(
            //相当于Android属性hint
            decoration: new InputDecoration(hintText: '请输入密码'),
          ),
        ],
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('GestureDetector'),
        ),
        body: new SampleAppPage(),
      ),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SampleAppPageState();
  }
}

/*
 * I/flutter: onTap
 * I/flutter: onLongPress
 * I/CatcherGestureDetector: start ContentCatcher
 * I/flutter: onDoubleTap
 */
class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      //双击
      onDoubleTap: () {
        print('onDoubleTap'); // I/flutter: onDoubleTap
      },
      //单击
      onTap: () {
        print('onTap'); //  I/flutter: onTap
      },
      //长按
      onLongPress: () {
        print('onLongPress'); // I/flutter: onLongPress
      },
      child: new Container(
        height: 36.0,
        padding: EdgeInsets.all(8.0),
//        margin: EdgeInsets.symmetric(horizontal: 8.0),
        margin: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.9),
          color: Colors.lightBlue,
        ),
        child: new Center(
          child: new Text('点我'),
        ),
      ),
    );
  }
}

class ListViewAndScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _buildView();
}

class _buildView extends State<ParentWidget> {
  //创建buildListView需要的控件
  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new Padding(
          padding: new EdgeInsets.all(10.0), child: new Text('Row $i')));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildListViewTwo(_getListData());
  }

  //创建ListView or ScrollView
  Widget buildListViewTwo(List<Widget> widgets) {
    return new ListView.builder(
        //listView的长度相当于getItemCount
        itemCount: widgets.length,
        //listView的子view，相当于adapter中的getView
        itemBuilder: (BuildContext context, int position) {
          return widgets[position];
        });
  }
}

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Flutter",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "AppBar",
          ),
        ),
        body: new MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildGridViewCount();
  }
}

//GridView.count 允许您指定列数
Widget buildGridViewCount() {
  return new GridView.count(
    crossAxisCount: 2,
    padding: const EdgeInsets.all(0.0),
    mainAxisSpacing: 0.0,
    // 控件纵向之间间距
    crossAxisSpacing: 0.0,
    // 控件横向之间间距
    children: <Widget>[
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
    ],
  );
}

//GridView.extent 允许您指定项的最大像素宽度
Widget buildGridViewExtent() {
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(0.0),
    mainAxisSpacing: 0.0,
    // 控件纵向之间间距
    crossAxisSpacing: 0.0,
    // 控件横向之间间距
    children: <Widget>[
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
      new Image.asset('images/float_navigator.png'),
    ],
  );
}

class RowAndColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //根布局
    return new MaterialApp(
      title: "Flutter",
      home: new Scaffold(
        appBar: AppBar(
          title: Text('静态页面练习'),
        ),
        body: new MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      // 横向排列
      child: Row(
        children: <Widget>[
          //将Column（列）放入Expanded中会拉伸该列以使用该行中的所有剩余空闲空间
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 定义控件排列位置
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('star 41'),
        ],
      ),
    );

    //抽取出 call 和 电话图标的布局
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      // 纵向排列
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceEvenly
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. ''',
        softWrap: true,
      ),
    );
    // 设置页面显示;
    return new ListView(
      children: <Widget>[
        // 设置图片: 路径, 图片宽/高
        Image.asset(
          'images/float_navigator.png', width: 600.0, height: 240.0, //图片展示的样式
          fit: BoxFit
              .cover, // BoxFit.none/scaleDown/fitWidth/fitHeight/fill/contain/cover
        ),
        //头部
        titleSection,
//          // 中部
        buttonSection,
//          // 底部
        textSection,
      ],
    );
  }
}

// ignore: non_constant_identifier_names
Widget MaterialAppWidget() {
  return new MaterialApp(
    //标题
    title: 'Flutter App',
    //主题
    theme: new ThemeData(
      primaryColor: Colors.red,
    ),
    //home内容区
    home: new MyScaffold(),
  );
}

// StatelessWidget是widget的无状态的子类，适合写静态widget。
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Scaffold(
        appBar: AppBar(
          title: Text('Title', style: Theme.of(context).primaryTextTheme.title),
        ),
        body: new Center(
          child: Text('Center'),
        ),
      ),
    );
  }
}

Widget firstWidget() {
  // Center为容器，展示控件为Text 需要添加TextDirection
  return new Center(
    child: new Text(
      "Flutter",
      textDirection: TextDirection.ltr, // TextDirection.rtl/TextDirection.ltr
      style: TextStyle(
        color: Colors.blue,
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
