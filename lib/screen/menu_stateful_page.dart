import 'package:flutter/material.dart';

enum CheckedValue { one, two, three, four }

class MenuStatefulPage extends StatefulWidget {
  const MenuStatefulPage({Key? key}) : super(key: key);

  @override
  _MenuStatefulState createState() => _MenuStatefulState();
}

class _MenuStatefulState extends State<MenuStatefulPage> with RestorationMixin {
  final _RestorableCheckedValues _checkedValues = _RestorableCheckedValues()
    ..check(CheckedValue.three);

  @override
  String get restorationId => 'checklist_menu_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_checkedValues, 'checked_values');
  }

  void showCheckedMenuSelections(BuildContext context, CheckedValue value) {
    if (_checkedValues.isChecked(value)) {
      setState(() {
        _checkedValues.uncheck(value);
      });
    } else {
      setState(() {
        _checkedValues.check(value);
      });
    }
  }

  String checkedValueToString(BuildContext context, CheckedValue value) {
    return {
      CheckedValue.one: "demoMenuOne",
      CheckedValue.two: "demoMenuTwo",
      CheckedValue.three: "demoMenuThree",
      CheckedValue.four: "demoMenuFour",
    }[value]!;
  }

  @override
  void dispose() {
    _checkedValues.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Menu Checklist")),
        body: Center(
            child: ListTile(
          title: Text("チェックリスト メニュー付き"),
          trailing: PopupMenuButton<CheckedValue>(
            padding: EdgeInsets.zero,
            onSelected: (value) => showCheckedMenuSelections(context, value),
            itemBuilder: (context) => <PopupMenuItem<CheckedValue>>[
              CheckedPopupMenuItem<CheckedValue>(
                value: CheckedValue.one,
                checked: _checkedValues.isChecked(CheckedValue.one),
                child: Text(
                  checkedValueToString(context, CheckedValue.one),
                ),
              ),
              CheckedPopupMenuItem<CheckedValue>(
                value: CheckedValue.two,
                enabled: false,
                checked: _checkedValues.isChecked(CheckedValue.two),
                child: Text(
                  checkedValueToString(context, CheckedValue.two),
                ),
              ),
              CheckedPopupMenuItem<CheckedValue>(
                value: CheckedValue.three,
                checked: _checkedValues.isChecked(CheckedValue.three),
                child: Text(
                  checkedValueToString(context, CheckedValue.three),
                ),
              ),
              CheckedPopupMenuItem<CheckedValue>(
                value: CheckedValue.four,
                checked: _checkedValues.isChecked(CheckedValue.four),
                child: Text(
                  checkedValueToString(context, CheckedValue.four),
                ),
              ),
            ],
          ),
        )));
  }
}

class _RestorableCheckedValues extends RestorableProperty<Set<CheckedValue>> {
  Set<CheckedValue> _checked = <CheckedValue>{};

  void check(CheckedValue value) {
    _checked.add(value);
    notifyListeners();
  }

  void uncheck(CheckedValue value) {
    _checked.remove(value);
    notifyListeners();
  }

  bool isChecked(CheckedValue value) => _checked.contains(value);

  Iterable<String> checkedValuesToString(BuildContext context) {
    return _checked.map((value) {
      return {
        CheckedValue.one: "demoMenuOne",
        CheckedValue.two: "demoMenuTwo",
        CheckedValue.three: "demoMenuThree",
        CheckedValue.four: "demoMenuFour",
      }[value]!;
    });
  }

  @override
  Set<CheckedValue> createDefaultValue() => _checked;

  @override
  Set<CheckedValue> initWithValue(Set<CheckedValue> a) {
    _checked = a;
    return _checked;
  }

  @override
  Object toPrimitives() => _checked.map((value) => value.index).toList();

  @override
  Set<CheckedValue> fromPrimitives(Object? data) {
    final checkedValues = data as List<dynamic>;
    return Set.from(checkedValues.map<CheckedValue>((dynamic id) {
      return CheckedValue.values[id as int];
    }));
  }
}
