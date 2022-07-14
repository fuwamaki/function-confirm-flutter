import 'package:flutter/material.dart';

Widget githubRepoInput(void Function(String text) function) {
  return Container(
      margin: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Please enter a search repository name.',
            labelText: "search"),
        onSubmitted: (text) {
          function(text);
        },
      ));
}
