import 'package:flutter/material.dart';

class BottomTabCPage extends StatefulWidget {
  @override
  _BottomTabCState createState() => _BottomTabCState();
}

class _BottomTabCState extends State<BottomTabCPage> with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);

  @override
  String get restorationId => 'choice_chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'choice_chip');
  }

  @override
  void dispose() {
    _indexSelected.dispose();
    super.dispose();
  }

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
              SizedBox(height: 12),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text("small"),
                    selected: _indexSelected.value == 0,
                    onSelected: (value) {
                      setState(() {
                        _indexSelected.value = value ? 0 : -1;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("medium"),
                    selected: _indexSelected.value == 1,
                    onSelected: (value) {
                      setState(() {
                        _indexSelected.value = value ? 1 : -1;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text("large"),
                    selected: _indexSelected.value == 2,
                    onSelected: (value) {
                      setState(() {
                        _indexSelected.value = value ? 2 : -1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
