import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PickerDemoType {
  time,
  date,
  range,
}

class DateSelectorPage extends StatefulWidget {
  const DateSelectorPage({Key? key, required this.type}) : super(key: key);

  final PickerDemoType type;

  @override
  State<DateSelectorPage> createState() => _DateSelectorPageState();
}

class _DateSelectorPageState extends State<DateSelectorPage>
    with RestorationMixin {
  final RestorableDateTime _fromDate = RestorableDateTime(DateTime.now());
  final RestorableTimeOfDay _fromTime = RestorableTimeOfDay(
    TimeOfDay.fromDateTime(DateTime.now()),
  );
  final RestorableDateTime _startDate = RestorableDateTime(DateTime.now());
  final RestorableDateTime _endDate = RestorableDateTime(DateTime.now());

  late RestorableRouteFuture<DateTime> _restorableDatePickerRouteFuture;
  late RestorableRouteFuture<DateTimeRange>
      _restorableDateRangePickerRouteFuture;
  late RestorableRouteFuture<TimeOfDay> _restorableTimePickerRouteFuture;

  void _selectDate(DateTime selectedDate) {
    if (selectedDate != _fromDate.value) {
      setState(() {
        _fromDate.value = selectedDate;
      });
    }
  }

  void _selectDateRange(DateTimeRange newSelectedDate) {
    setState(() {
      _startDate.value = newSelectedDate.start;
      _endDate.value = newSelectedDate.end;
    });
  }

  void _selectTime(TimeOfDay selectedTime) {
    if (selectedTime != _fromTime.value) {
      setState(() {
        _fromTime.value = selectedTime;
      });
    }
  }

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments as int),
          firstDate: DateTime(2015, 1),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  static Route<TimeOfDay> _timePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    final args = arguments as List<Object>;
    final initialTime = TimeOfDay(
      hour: args[0] as int,
      minute: args[1] as int,
    );

    return DialogRoute<TimeOfDay>(
      context: context,
      builder: (context) {
        return TimePickerDialog(
          restorationId: 'time_picker_dialog',
          initialTime: initialTime,
        );
      },
    );
  }

  static Route<DateTimeRange> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange>(
      context: context,
      builder: (context) {
        return DateRangePickerDialog(
          restorationId: 'date_rage_picker_dialog',
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime>(
      onComplete: _selectDate,
      onPresent: (navigator, arguments) {
        return navigator.restorablePush(
          _datePickerRoute,
          arguments: _fromDate.value.millisecondsSinceEpoch,
        );
      },
    );
    _restorableDateRangePickerRouteFuture =
        RestorableRouteFuture<DateTimeRange>(
      onComplete: _selectDateRange,
      onPresent: (navigator, arguments) =>
          navigator.restorablePush(_dateRangePickerRoute),
    );

    _restorableTimePickerRouteFuture = RestorableRouteFuture<TimeOfDay>(
      onComplete: _selectTime,
      onPresent: (navigator, arguments) => navigator.restorablePush(
        _timePickerRoute,
        arguments: [_fromTime.value.hour, _fromTime.value.minute],
      ),
    );
  }

  @override
  String get restorationId => 'picker_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_fromDate, 'from_date');
    registerForRestoration(_fromTime, 'from_time');
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
      _restorableDatePickerRouteFuture,
      'date_picker_route',
    );
    registerForRestoration(
      _restorableDateRangePickerRouteFuture,
      'date_range_picker_route',
    );
    registerForRestoration(
      _restorableTimePickerRouteFuture,
      'time_picker_route',
    );
  }

  String get _title {
    switch (widget.type) {
      case PickerDemoType.date:
        return "日付選択";
      case PickerDemoType.time:
        return "時刻選択";
      case PickerDemoType.range:
        return "Date Range";
      default:
        return '';
    }
  }

  String get _labelText {
    switch (widget.type) {
      case PickerDemoType.date:
        return DateFormat.yMMMd().format(_fromDate.value);
      case PickerDemoType.time:
        return _fromTime.value.format(context);
      case PickerDemoType.range:
        return '${DateFormat.yMMMd().format(_startDate.value)} - ${DateFormat.yMMMd().format(_endDate.value)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(_title),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_labelText),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      switch (widget.type) {
                        case PickerDemoType.date:
                          _restorableDatePickerRouteFuture.present();
                          break;
                        case PickerDemoType.time:
                          _restorableTimePickerRouteFuture.present();
                          break;
                        case PickerDemoType.range:
                          _restorableDateRangePickerRouteFuture.present();
                          break;
                      }
                    },
                    child: Text(
                      "選択ツールを表示",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
