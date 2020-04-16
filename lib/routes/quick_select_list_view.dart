import 'package:flukitdemo/widgets/index.dart';
import 'package:flutter/material.dart';
import 'quick_select_listview/city_select.dart';
import 'quick_select_listview/city_select_custom_header.dart';
import 'quick_select_listview/contact_list.dart';
import 'quick_select_listview/index_suspension.dart';

class QuickSelectListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPage([
      PageInfo("城市选择器", (ctx) => CitySelectRoute()),
      PageInfo("城市选择器（自定义）", (ctx) => CitySelectCustomHeaderRoute()),
      PageInfo("联系人列表", (ctx) => ContactListRoute()),
      PageInfo("城市选择器高级", (ctx) => IndexSuspensionRoute()),
    ]);
  }
}
