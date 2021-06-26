import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'About & Contact',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text('About Page & Contact Details'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                ),
                child: Text('Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
