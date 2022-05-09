import 'package:flutter/material.dart';

Widget HomeListItem(String title, void Function() function) {
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
