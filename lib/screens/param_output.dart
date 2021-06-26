import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';

class ParamsOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Parameters & Output',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text('Selected Formula/Theory'),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  child: Image.asset('assets/images/MOSFET.png'),
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
          ),
        ),
      ),
    );
  }
}
