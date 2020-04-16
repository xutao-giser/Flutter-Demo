import 'package:flutter/material.dart';
import 'widgets/index.dart';
import 'routes/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flukit',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flukit demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => gotoTarget(context,widget.title)),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () => gotoTarget(context,widget.title))
        ],
      ),
      body: ListPage([
        PageInfo("滚动列表", (ctx) => QuickScrollbarRoute()),
        PageInfo("翻转", (ctx) => TurnBoxRoute()),
        PageInfo("加载中", (ctx) => AnimatedRotationBoxRoute()),
        PageInfo("下拉刷新", (ctx) => PullRefreshBoxRoute()),
        PageInfo("滑动窗口", (ctx) => SwiperRoute()),
        PageInfo("滑动样式", (ctx) => SwiperStyleRoute()),
        PageInfo("图片浏览", (ctx) => PhotoViewRoute()),
        PageInfo("无限滚动条", (ctx) => InfiniteListViewRoute()),
        PageInfo("按钮", (ctx) => GradientButtonRoute()),
        PageInfo("环形进度条", (ctx) => GradientCircularProgressRoute()),
        PageInfo("综合列表", (ctx) => QuickSelectListViewRoute()),
        PageInfo("WebView", (ctx) => WebView())
      ]),
     
    );
  }
}

void gotoTarget(context,title){
  print('object');
  Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageScaffold(
          title: title,
        
      );
    }));
}
