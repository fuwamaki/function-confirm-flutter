import 'package:flutter/material.dart';
import 'home_list_item.dart';
import '../screen/sample_page.dart';
import '../screen/test_list_page.dart';
import '../screen/typography_page.dart';
import '../screen/color_palette_page.dart';
import '../screen/segue_animation_page.dart';
import '../screen/cupertino_tab_page.dart';

Widget homeList(BuildContext context) {
  return ListView(children: [
    homeListItem("sample", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SamplePage()));
    }),
    homeListItem("test list", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestListPage()));
    }),
    homeListItem("typography", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TypographyPage()));
    }),
    homeListItem("color palettes", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ColorPalettePage()));
    }),
    homeListItem("segue animation", () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SegueAnimationPage()));
    }),
    homeListItem("cupertino tab", () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CupertinoTabBarDemo()));
    }),
  ]);
}
