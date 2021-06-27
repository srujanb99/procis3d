import 'package:flutter/material.dart';
import 'package:procis3d/screens/about.dart';
import 'package:procis3d/screens/help.dart';
import 'package:procis3d/screens/selection_page.dart';
import 'package:procis3d/screens/param_output.dart';
import 'package:procis3d/screens/splash_screen.dart';

void main() => runApp(Procis3D());

class Procis3D extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/select': (context) => SelectionPage(),
        '/params': (context) => ParamsOutput(),
        '/help': (context) => Help(),
        '/about': (context) => About(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow.shade800,
      ),
      home: SplashScreen(),
    );
  }
}
