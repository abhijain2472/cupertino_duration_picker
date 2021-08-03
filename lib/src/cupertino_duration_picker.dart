library cupertino_duration_picker;

import 'package:cupertino_duration_picker/cupertino_duration_picker.dart';
import 'package:cupertino_duration_picker/src/duration_extension.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:widgetpicker/widgetpicker.dart';

const Map<TimeUnitName, TimeUnit> _availableUnits = {
  TimeUnitName.seconds:
      TimeUnit(name: TimeUnitName.seconds, max: 59, min: 0, inSeconds: 0),
  TimeUnitName.minutes:
      TimeUnit(name: TimeUnitName.minutes, max: 59, min: 1, inSeconds: 60),
  TimeUnitName.hours:
      TimeUnit(name: TimeUnitName.hours, max: 11, min: 1, inSeconds: 60 * 60),
  TimeUnitName.days: TimeUnit(
      name: TimeUnitName.days, max: 6, min: 1, inSeconds: 60 * 60 * 12),
  TimeUnitName.weeks: TimeUnit(
      name: TimeUnitName.weeks, max: 3, min: 1, inSeconds: 60 * 60 * 12 * 7),
  TimeUnitName.months: TimeUnit(
      name: TimeUnitName.months,
      max: 11,
      min: 1,
      inSeconds: 60 * 60 * 12 * 7 * 4),
  TimeUnitName.years: TimeUnit(
      name: TimeUnitName.years,
      max: 50,
      min: 1,
      inSeconds: 60 * 60 * 12 * 7 * 4 * 12),
};

class CupertinoDurationPicker extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final Duration value;
  final Function(Duration) onChangeValue;
  final Map<TimeUnitName, String> units;
  final double unitPickerWidth;

  CupertinoDurationPicker({
    required this.value,
    required this.onChangeValue,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.units = const {},
    this.unitPickerWidth = 120,
    Key? key,
  }) : super(key: key);

  final TimeUnit _defaultUnit = _availableUnits[TimeUnitName.seconds]!;

  void _onChangedNumber(int value, TimeUnit unit) {
    Duration duration = Duration(seconds: value + unit.inSeconds);
    onChangeValue(duration);
  }

  void _onChangedUnit(String name) {
    TimeUnitName unitName =
        units.entries.firstWhere((element) => element.value == name).key;
    TimeUnit unit = _availableUnits[unitName] ?? _defaultUnit;
    Duration duration = Duration(seconds: 1 + unit.inSeconds);
    onChangeValue(duration);
  }

  @override
  Widget build(BuildContext context) {
    TimeUnit unit = value.getActiveTimeUnit(_availableUnits.values.toList());
    return Row(
      mainAxisAlignment: this.mainAxisAlignment,
      children: [
        NumberPicker(
            itemWidth: 50,
            maxValue: unit.max,
            minValue: unit.min,
            onChanged: (int value) => _onChangedNumber(value, unit),
            value: value.getValueInUnit(unit)),
        WidgetPicker(
          itemWidth: unitPickerWidth,
          options: units.values.toList(),
          onChanged: _onChangedUnit,
          value: units[value
                  .getActiveTimeUnit(_availableUnits.values.toList())
                  .name] ??
              _defaultUnit.name.toString(),
        ),
      ],
    );
  }
}
