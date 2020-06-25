import 'package:flutter/material.dart';

class RangeSelector extends StatefulWidget {
  RangeValues _rangeValues = RangeValues(2, 7);
  @override
  _RangeSelectorState createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelector> {
  @override
  Widget build(BuildContext context) {
    return  RangeSlider(
      values: widget._rangeValues,

      ///Color for active side of Slider
      activeColor: Color(0xff02DB96),

      ///Color for inactive side of Slider
      inactiveColor: Color(0x4402DB96),

      ///Minimum value of the slider
      min: 1.0,

      ///Maximum value of the slider
      max: 12.0,

      ///No.Of divisions from min to max value on the Slider
      divisions: 100,

      ///Value indicator above the slider
      labels: RangeLabels( widget._rangeValues.start.round().toString() , widget._rangeValues.end.round().toString()),
      onChanged: (RangeValues values) {
        setState(() {
          widget._rangeValues = values;
        });
      },
    );
  }
}
