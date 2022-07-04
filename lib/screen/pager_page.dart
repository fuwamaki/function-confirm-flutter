import 'package:flutter/material.dart';

class PagerPage extends StatefulWidget {
  PagerPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PagerPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  var _pages = [
    TestPage1(),
    TestPage2(),
    TestPage3(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PagerView"),
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages));
  }
}

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.redAccent,
                child: Text("Test1", style: TextStyle(fontSize: 80)))));
  }
}

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.greenAccent,
                child: Text("Test2", style: TextStyle(fontSize: 80)))));
  }
}

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.greenAccent,
                child: Text("Test3", style: TextStyle(fontSize: 80)))));
  }
}
