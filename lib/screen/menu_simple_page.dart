import 'package:flutter/material.dart';

enum SimpleValue { one, two, three }

class MenuSimplePage extends StatefulWidget {
  const MenuSimplePage({Key? key}) : super(key: key);

  @override
  _SimpleMenuDemoState createState() => _SimpleMenuDemoState();
}

class _SimpleMenuDemoState extends State<MenuSimplePage> {
  late SimpleValue _simpleValue;

  void showAndSetMenuSelection(BuildContext context, SimpleValue value) {
    setState(() {
      _simpleValue = value;
    });
  }

  String simpleValueToString(BuildContext context, SimpleValue value) {
    return {
      SimpleValue.one: "メニュー1",
      SimpleValue.two: "メニュー2",
      SimpleValue.three: "メニュー3",
    }[value]!;
  }

  @override
  void initState() {
    super.initState();
    _simpleValue = SimpleValue.two;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Menu Checklist")),
        body: Center(
            child: PopupMenuButton<SimpleValue>(
          padding: EdgeInsets.zero,
          initialValue: _simpleValue,
          onSelected: (value) => showAndSetMenuSelection(context, value),
          itemBuilder: (context) => <PopupMenuItem<SimpleValue>>[
            PopupMenuItem<SimpleValue>(
              value: SimpleValue.one,
              child: Text(simpleValueToString(
                context,
                SimpleValue.one,
              )),
            ),
            PopupMenuItem<SimpleValue>(
              value: SimpleValue.two,
              child: Text(simpleValueToString(
                context,
                SimpleValue.two,
              )),
            ),
            PopupMenuItem<SimpleValue>(
              value: SimpleValue.three,
              child: Text(simpleValueToString(
                context,
                SimpleValue.three,
              )),
            ),
          ],
          child: ListTile(
            title: Text("Simple Menu"),
            subtitle: Text(simpleValueToString(context, _simpleValue)),
          ),
        )));
  }
}
