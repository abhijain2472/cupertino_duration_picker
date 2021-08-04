import 'package:cupertino_duration_picker/cupertino_duration_picker.dart';

extension DurationExtension on Duration {
  TimeUnit getActiveTimeUnit(List<TimeUnit> units) {
    /// returnes a [TimeUnit] given a duration
    units.sort((a, b) => b.inSeconds.compareTo(a.inSeconds));
    if (this.inSeconds < 60) return units.last;
    TimeUnit unit = units.firstWhere(
        (TimeUnit unit) => (this.inSeconds / unit.inSeconds).floor() > 0);
    return unit;
  }

  int getValueInUnit(TimeUnit unit) {
    /// translates the duration to its value in a given unit
    return this.inSeconds ~/ unit.inSeconds;
  }
}
