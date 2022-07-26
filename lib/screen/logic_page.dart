import 'package:flutter/material.dart';

enum Type { comic, animation }

extension TypeExtension on Type {
  static final names = {Type.comic: 'マンガ', Type.animation: 'アニメ'};

  String get typeName => names[this]!;
}

class LogicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Page")),
        body: Center(
          child: TextButton(
            child: Text(Type.animation.typeName),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
