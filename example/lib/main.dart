import 'package:cupertino_duration_picker/cupertino_duration_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cupertino Duration Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: _IntegerExample(),
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  Duration _duration = Duration(seconds: 64);

  @override
  Widget build(BuildContext context) {
    return CupertinoDurationPicker(
      onChangeValue: (duration) => setState(() => _duration = duration),
      value: _duration,
      units: {
        TimeUnitName.seconds: 'Secounds',
        TimeUnitName.minutes: 'Minutes',
        TimeUnitName.hours: 'Hours',
        TimeUnitName.days: 'Days',
        TimeUnitName.weeks: 'Weeks',
        TimeUnitName.months: 'Months',
        TimeUnitName.years: 'Years',
      },
    );
  }
}
