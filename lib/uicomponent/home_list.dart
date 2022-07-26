import 'package:flutter/material.dart';
import 'package:function_confirm/screen/logic_page.dart';
import 'package:function_confirm/screen/sample_page.dart';
import 'package:function_confirm/screen/bloc_sample_page.dart';
import 'package:function_confirm/screen/bloc_github/bloc_github_page.dart';
import 'package:function_confirm/screen/test_list_page.dart';
import 'package:function_confirm/screen/test_list2_page.dart';
import 'package:function_confirm/screen/test_list3_page.dart';
import 'package:function_confirm/screen/test_list4_page.dart';
import 'package:function_confirm/screen/typography_page.dart';
import 'package:function_confirm/screen/color_palette_page.dart';
import 'package:function_confirm/screen/segue_animation_page.dart';
import 'package:function_confirm/screen/cupertino_tab_page.dart';
import 'package:function_confirm/screen/bottom_tab_page.dart';
import 'package:function_confirm/screen/pager_page.dart';
import 'package:function_confirm/screen/dialog_page.dart';
import 'package:function_confirm/screen/snackbar_page.dart';
import 'package:function_confirm/screen/divider1_page.dart';
import 'package:function_confirm/screen/divider2_page.dart';
import 'package:function_confirm/screen/grid_page.dart';
import 'package:function_confirm/screen/menu_page.dart';
import 'package:function_confirm/screen/menu_simple_page.dart';
import 'package:function_confirm/screen/menu_stateful_page.dart';
import 'package:function_confirm/screen/indicator_page.dart';
import 'package:function_confirm/screen/date_selector_page.dart';
import 'package:function_confirm/screen/select_control_page.dart';
import 'package:function_confirm/screen/github_repo_list_page.dart';
import 'package:function_confirm/screen/access_localhost_page.dart';
import 'package:function_confirm/uicomponent/home_list_item.dart';

Widget homeList(BuildContext context) {
  return ListView(children: [
    homeListItem("sample", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SamplePage()));
    }),
    homeListItem("logic page", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LogicPage()));
    }),
    homeListItem("bloc sample", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BlocSamplePage()));
    }),
    homeListItem("github repo list", () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => GithubRepoListPage()));
    }),
    homeListItem("bloc github repo list", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BlocGithubPage()));
    }),
    homeListItem("test list", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestListPage()));
    }),
    homeListItem("test list2", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestList2Page()));
    }),
    homeListItem("test list3", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestList3Page()));
    }),
    homeListItem("test list4", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TestList4Page()));
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
    homeListItem("pager", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PagerPage()));
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
    homeListItem("grid list", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GridPage()));
    }),
    homeListItem("menu", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuPage()));
    }),
    homeListItem("menu simple", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuSimplePage()));
    }),
    homeListItem("menu check list", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuStatefulPage()));
    }),
    homeListItem("indicator", () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IndicatorPage()));
    }),
    homeListItem("date selector", () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DateSelectorPage(type: PickerDemoType.date)));
    }),
    homeListItem("time selector", () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DateSelectorPage(type: PickerDemoType.time)));
    }),
    homeListItem("range selector", () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DateSelectorPage(type: PickerDemoType.range)));
    }),
    homeListItem("select control", () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectControlPage()));
    }),
    homeListItem("access localhost", () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AccessLocalhostPage()));
    }),
  ]);
}
