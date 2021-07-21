import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kFormTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kFormTitleDark = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const kFormData = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const kSliderThemeData = SliderThemeData(
  activeTrackColor: Colors.white,
  inactiveTrackColor: Color(0xFF8D8E98),
  thumbColor: Color(0xFFEB1555),
  overlayColor: Color(0x29EB1555),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
  showValueIndicator: ShowValueIndicator.always,
);
