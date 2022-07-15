import 'package:flutter/material.dart';

Widget githubRepoInput(void Function(String text) function) {
  return Container(
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'repository name',
            labelText: "search"),
        onSubmitted: (text) {
          function(text);
        },
      ));
}
