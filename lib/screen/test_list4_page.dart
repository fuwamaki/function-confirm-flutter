import 'package:flutter/material.dart';

class TestList4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("リスト"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Input"),
              ),
            ),
            Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text("item ${index + 1}"),
                ),
              ),
            ),
          ],
        ));
  }
}
