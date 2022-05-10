import 'package:flutter/material.dart';
import 'home_list_item.dart';
import '../screen/sample_page.dart';
import '../screen/test_list_page.dart';

Widget homeList(BuildContext context) {
  return ListView(children: [
    homeListItem("sample page", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SamplePage()));
    }),
    homeListItem("test list page", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestListPage()));
    }),
  ]);
}
