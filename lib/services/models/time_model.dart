import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class TimeModel extends Equatable {
  const TimeModel({
     int hour = 0,
     int minute = 0,
     int seconds = 0,
  })  : assert((hour <= 23 && hour >= 0) &&
            (minute <= 59 && minute >= 0) &&
            (seconds <= 59 && seconds >= 0)),
        this._hour = hour,
        this._minute = minute,
        this._seconds = seconds;

  factory TimeModel.zero() => TimeModel(hour: 0, minute: 0, seconds: 0);

  final int _hour;
  final int _minute;
  final int _seconds;

  @override
  List<Object> get props => [_hour, _minute, _seconds];

  String get hour => NumberFormat('00').format(_hour);
  String get minute => NumberFormat('00').format(_minute);
  String get seconds => NumberFormat('00').format(_seconds);
}
