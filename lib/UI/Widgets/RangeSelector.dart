// import 'package:flutter/material.dart';

// class RangeSelector extends StatefulWidget {
//   RangeValues rangeValues;

//   @override

//   Widget build(BuildContext context) {
//     return RangeSlider(
//       values: widget.rangeValues,

//       ///Color for active side of Slider
//       activeColor: Color(0xff02DB96),

//       ///Color for inactive side of Slider
//       inactiveColor: Color(0x4402DB96),

//       ///Minimum value of the slider
//       min: 1.0,

//       ///Maximum value of the slider
//       max: 12.0,

//       ///No.Of divisions from min to max value on the Slider
//       divisions: 100,

//       ///Value indicator above the slider
//       labels: RangeLabels(widget.rangeValues.start.round().toString(),
//           widget.rangeValues.end.round().toString()),
//       onChanged: (RangeValues values) {
//         setState(() {
//           widget.rangeValues = values;
//         });
//       },
//     );
//   }
// }
