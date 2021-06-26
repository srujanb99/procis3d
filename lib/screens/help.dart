import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Help & Documentation',
      body: Center(
        child: Container(
          child: Text('Help & Documentation'),
        ),
      ),
    );
  }
}
