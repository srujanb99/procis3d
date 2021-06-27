import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects_3d.dart';

class ParamsOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Parameters & Output',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Center(
          child: Output(),
        ),
      ),
    );
  }
}

class Output extends StatefulWidget {
  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            'Selected Formula/Theory',
            style: kFormTitle,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Objects3D(),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Container(
            child: Text('-Basic Info-'),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent,
          ),
          child: Text('Save Image'),
        ),
      ],
    );
  }
}
