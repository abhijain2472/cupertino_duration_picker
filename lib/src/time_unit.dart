import 'package:cupertino_duration_picker/cupertino_duration_picker.dart';

class TimeUnit {
  final TimeUnitName name;
  final int max;
  final int min;
  final int inSeconds;

  const TimeUnit({
    required this.name,
    required this.max,
    required this.min,
    required this.inSeconds,
  });
}
