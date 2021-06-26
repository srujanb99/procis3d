import 'package:flutter/material.dart';

class DropDownSelector {
  DropDownSelector({
    required this.value,
    required this.valueList,
    required this.onChanged,
  });
  String value;
  final List<String> valueList;
  final Function(String?)? onChanged;

  DropdownButton<String> dropDownSelector() {
    return DropdownButton(
      value: value,
      elevation: 16,
      underline: Container(
        height: 2.0,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: valueList.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
