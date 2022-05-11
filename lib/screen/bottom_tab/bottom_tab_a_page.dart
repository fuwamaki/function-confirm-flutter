import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomTabAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap1");
                },
                child: Text("Button"),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text("Button"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap2");
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap3");
                },
                child: Text("ElevatedButton"),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text("ElevatedButton"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap4");
                },
              ),
              OutlinedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap5");
                },
                child: Text("OutlinedButton"),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text("OutlinedButton"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "tap6");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
