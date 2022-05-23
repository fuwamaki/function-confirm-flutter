import 'package:flutter/material.dart';

class BottomTabCPage extends StatefulWidget {
  @override
  _BottomTabCState createState() => _BottomTabCState();
}

class _BottomTabCState extends State<BottomTabCPage> with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);
  final RestorableBool _isSelectedElevator = RestorableBool(false);
  final RestorableBool _isSelectedWasher = RestorableBool(false);
  final RestorableBool _isSelectedFireplace = RestorableBool(false);

  @override
  String get restorationId => 'choice_chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'choice_chip');
    registerForRestoration(_isSelectedElevator, 'selected_elevator');
    registerForRestoration(_isSelectedWasher, 'selected_washer');
    registerForRestoration(_isSelectedFireplace, 'selected_fireplace');
  }

  @override
  void dispose() {
    _indexSelected.dispose();
    _isSelectedElevator.dispose();
    _isSelectedWasher.dispose();
    _isSelectedFireplace.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterChips = [
      FilterChip(
        label: Text("Elevator"),
        selected: _isSelectedElevator.value,
        onSelected: (value) {
          setState(() {
            _isSelectedElevator.value = !_isSelectedElevator.value;
          });
        },
      ),
      FilterChip(
        label: Text("Washer"),
        selected: _isSelectedWasher.value,
        onSelected: (value) {
          setState(() {
            _isSelectedWasher.value = !_isSelectedWasher.value;
          });
        },
      ),
      FilterChip(
        label: Text("Fireplace"),
        selected: _isSelectedFireplace.value,
        onSelected: (value) {
          setState(() {
            _isSelectedFireplace.value = !_isSelectedFireplace.value;
          });
        },
      ),
    ];

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
              SizedBox(height: 12),
              Wrap(
                children: [
                  for (final chip in filterChips)
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: chip,
                    )
                ],
              ),
              SizedBox(height: 12),
              InputChip(
                onPressed: () {},
                onDeleted: () {},
                avatar: const Icon(
                  Icons.directions_bike,
                  size: 20,
                  color: Colors.black54,
                ),
                deleteIconColor: Colors.black54,
                label: Text("Bike"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
