import 'package:flutter/material.dart';
import 'package:function_confirm/repository/localhost_repository.dart';

class AccessLocalhostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Page")),
        body: Center(
          child: TextButton(
            child: Text("Localhostにリクエスト"),
            onPressed: () {
              LocalhostRepository().fetch().then((response) {
                print(response);
              });
            },
          ),
        ));
  }
}
