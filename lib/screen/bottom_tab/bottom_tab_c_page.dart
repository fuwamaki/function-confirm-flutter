import 'package:flutter/material.dart';

class BottomTabCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: Container(
        margin: EdgeInsets.only(top: 24.0),
        child: Center(
          child: Column(
            children: [
              ActionChip(
                onPressed: () {},
                avatar: const Icon(
                  Icons.brightness_5,
                  color: Colors.black54,
                ),
                label: Text("ライトを設定"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
