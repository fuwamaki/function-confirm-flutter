import 'package:flutter/material.dart';

class TestList3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト"),
      ),
      body: Scrollbar(
          child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text("item ${index + 1}"),
                  ),
              separatorBuilder: (context, index) => Divider(
                    height: 1.0,
                  ),
              itemCount: 30)),
    );
  }
}
