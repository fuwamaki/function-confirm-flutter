import 'package:flutter/material.dart';
import 'home_list_item.dart';
import '../screen/sample_page.dart';
import '../screen/test_list_page.dart';
import '../screen/typography_page.dart';
import '../screen/color_palette_page.dart';
import '../screen/segue_animation_page.dart';
import '../screen/cupertino_tab_page.dart';
import '../screen/bottom_tab_page.dart';
import '../screen/dialog_page.dart';
import '../screen/snackbar_page.dart';
import '../screen/divider1_page.dart';
import '../screen/divider2_page.dart';

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
    homeListItem("bottom tab", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomTabPage()));
    }),
    homeListItem("dialog", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DialogPage()));
    }),
    homeListItem("snackbar", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SnackbarPage()));
    }),
    homeListItem("divider horizontal", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Divider1Page()));
    }),
    homeListItem("divider vertical", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Divider2Page()));
    }),
  ]);
}
