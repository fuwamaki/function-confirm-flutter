import 'package:flutter/material.dart';
import 'screen/sample_page.dart';
import 'component/home_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // applicationのroot
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Function Confirm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        HomeListItem("メニュー1", () {
          print("onTap called.");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SamplePage()));
        })
      ]),
    );
  }
}
