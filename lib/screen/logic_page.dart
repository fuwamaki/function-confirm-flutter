import 'package:flutter/material.dart';

enum Gender {
  male(name: "男性"),
  female(name: "女性"),
  other(name: "その他");

  const Gender({required this.name});

  final String name;
}

enum Fruit implements Comparable<Fruit> {
  apple(name: "りんご", color: Colors.red),
  peach(name: "もも", color: Colors.pink),
  mikan(name: "みかん", color: Colors.orange),
  orange(name: "オレンジ", color: Colors.orange);

  const Fruit({required this.name, required this.color});

  final String name;
  final MaterialColor color;

  bool isEqual(Comparable other) => this.compareTo(other) == 1;

  @override
  int compareTo(Comparable other) {
    if ((this == Fruit.apple && other == Fruit.apple) ||
        (this == Fruit.peach && other == Fruit.peach) ||
        (this == Fruit.mikan && other == Fruit.mikan) ||
        (this == Fruit.orange && other == Fruit.orange) ||
        (this == Fruit.mikan && other == Fruit.orange) ||
        (this == Fruit.orange && other == Fruit.mikan)) {
      return 1;
    } else {
      return 0;
    }
  }
}

// extension GenderExtension on Gender {
//   static final names = {
//     Gender.male: '男性',
//     Gender.female: '女性',
//     Gender.other: 'その他'
//   };

//   String get name => names[this]!;
// }

class LogicPage extends StatefulWidget {
  LogicPage({Key? key}) : super(key: key);

  @override
  _LogicPageState createState() => _LogicPageState();
}

class _LogicPageState extends State<LogicPage> {
  var type = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Page")),
        body: Center(
          child: TextButton(
            // child: Text((type == Type.animation).toString()),
            child: Text(Gender.male.index.toString()),
            onPressed: () {
              // print(Gender.values.length);
              // Gender.values.forEach((value) {
              //   print(value.name);
              // });
              print(Fruit.apple.isEqual(Fruit.apple));
              print(Fruit.apple.isEqual(Fruit.peach));
              print(Fruit.orange.isEqual(Fruit.mikan));
              print(Fruit.mikan.isEqual(Fruit.orange));
              // print(Gender.male.name);
              // print(Gender.female.name);
              // print(Gender.other.name);
            },
          ),
        ));
  }
}
