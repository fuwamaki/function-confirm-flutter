import 'package:flutter/material.dart';
import 'screen/sample_page.dart';

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
        _homeListItem("メニュー1", () {
          print("onTap called.");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SamplePage()));
        })
      ]),
    );
  }
}

Widget _homeListItem(String title, void Function() function) {
  return Container(
    decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
    child: ListTile(
      title: Text(
        title,
      ),
      onTap: function,
    ),
  );
}
