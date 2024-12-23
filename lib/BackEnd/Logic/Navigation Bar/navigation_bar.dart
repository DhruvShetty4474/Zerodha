import 'package:flutter/material.dart';

class LabelIconStyle {

  //change the color of the labelText when it is selected..
  static WidgetStateProperty<TextStyle> labelTextStyle() {
    return WidgetStateProperty.resolveWith<TextStyle>((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
      }
      return const TextStyle(color: Colors.white);
    });
  }
  //change the color of the icon when it is selected..
  static WidgetStateProperty<IconThemeData> iconTheme() {
    return WidgetStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: Colors.blue);
      }
      return const IconThemeData(color: Colors.white);
    });
  }
}
