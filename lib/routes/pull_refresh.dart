import 'package:flutter/material.dart';
import '../widgets/index.dart';
import 'pull_refresh/pull_refresh.dart';
import 'pull_refresh/pull_refresh_with_custom_header.dart';
import 'pull_refresh/pull_refresh_with_scrollview.dart';

class PullRefreshBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPage([
      PageInfo("下拉刷新",(ctx)=>PullRefreshRoute()),
      PageInfo("下拉刷新（自定义header）",(ctx)=>PullRefreshWithCustomHeaderRoute()),
      PageInfo("下拉刷新结合滚动列表（自定义header）",(ctx)=>PullRefreshWithScrollView(), false),
    ]);
  }
}


