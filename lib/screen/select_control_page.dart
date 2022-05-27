import 'package:flutter/material.dart';

class SelectControlPage extends StatefulWidget {
  @override
  _SelectControlPageState createState() => _SelectControlPageState();
}

class _SelectControlPageState extends State<SelectControlPage>
    with RestorationMixin {
  RestorableBoolN checkboxValueA = RestorableBoolN(true);
  RestorableBoolN checkboxValueB = RestorableBoolN(false);
  RestorableBoolN checkboxValueC = RestorableBoolN(null);

  final RestorableInt radioValue = RestorableInt(0);

  RestorableBool switchValue = RestorableBool(false);

  @override
  String get restorationId => 'checkbox_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValueA, 'checkbox_a');
    registerForRestoration(checkboxValueB, 'checkbox_b');
    registerForRestoration(checkboxValueC, 'checkbox_c');
    registerForRestoration(radioValue, 'radio_value');
    registerForRestoration(switchValue, 'switch_value');
  }

  @override
  void dispose() {
    checkboxValueA.dispose();
    checkboxValueB.dispose();
    checkboxValueC.dispose();
    radioValue.dispose();
    switchValue.dispose();
    super.dispose();
  }

  void handleRadioValueChanged(int? value) {
    setState(() {
      radioValue.value = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Page")),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: checkboxValueA.value,
                  onChanged: (value) {
                    setState(() {
                      checkboxValueA.value = value;
                    });
                  },
                ),
                Checkbox(
                  value: checkboxValueB.value,
                  onChanged: (value) {
                    setState(() {
                      checkboxValueB.value = value;
                    });
                  },
                ),
                Checkbox(
                  value: checkboxValueC.value,
                  tristate: true,
                  onChanged: (value) {
                    setState(() {
                      checkboxValueC.value = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int index = 0; index < 3; ++index)
                  Radio<int>(
                    value: index,
                    groupValue: radioValue.value,
                    onChanged: handleRadioValueChanged,
                  ),
              ],
            ),
            Semantics(
              container: true,
              label: "title",
              child: Switch(
                value: switchValue.value,
                onChanged: (value) {
                  setState(() {
                    switchValue.value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
