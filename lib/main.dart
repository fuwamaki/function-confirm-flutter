import 'package:flutter/material.dart';
import 'sample_page.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text('Map'),
              onTap: () {
                print('Map');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SamplePage()));
              },
            ),
            ListTile(
              title: Text('Album'),
              onTap: () {
                print('Album');
              },
            ),
            ListTile(
              title: Text('Phone'),
              onTap: () => {
                print('Phone'),
              },
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
