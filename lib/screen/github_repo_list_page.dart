import 'package:flutter/material.dart';

class GithubRepoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Page")),
        body: Center(
          child: TextButton(
            child: Text("最初のページに戻る"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
