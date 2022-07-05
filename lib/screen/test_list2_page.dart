import 'package:flutter/material.dart';

class TestList2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => ListTile(
            title: Text("item ${index + 1}"),
          ),
        ),
      ),
    );
  }
}
