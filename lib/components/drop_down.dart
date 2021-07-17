import 'package:flutter/material.dart';
import 'package:procis3d/constants.dart';

class DropDownSelector {
  DropDownSelector({
    this.value,
    required this.valueList,
    required this.onChanged,
    required this.listType,
  });
  String? value;
  List<String> valueList;
  Function(String?)? onChanged;
  String listType;

  DropdownButtonFormField<String> dropDownSelector() {
    return DropdownButtonFormField(
      value: value,
      style: kFormData,
      elevation: 16,
      decoration: InputDecoration(
        labelText: listType,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      /* underline: Container(
        width: 100.0,
        height: 2.0,
        color: Colors.deepPurpleAccent,
      ), */
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
