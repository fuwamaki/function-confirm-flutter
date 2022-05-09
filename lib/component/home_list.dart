import 'package:flutter/material.dart';
import 'home_list_item.dart';
import '../screen/sample_page.dart';

Widget homeList(BuildContext context) {
  return ListView(children: [
    homeListItem("メニュー1", () {
      print("onTap called.");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SamplePage()));
    }),
  ]);
}
