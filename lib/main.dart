import 'package:flutter/material.dart';
import 'package:procis3d/screens/about.dart';
import 'package:procis3d/screens/help.dart';
import 'package:procis3d/screens/selection_page.dart';
import 'package:procis3d/screens/splash_screen.dart';

void main() => runApp(Procis3D());

class Procis3D extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/select': (context) => SelectionPage(),
        '/help': (context) => Help(),
        '/about': (context) => About(),
      },
      //initialRoute: '/select',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow.shade800,
      ),
      home: Splash(),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 1)), //3-4 Seconds
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          // Loading is done, return the app:
          return SelectionPage();
        }
      },
    );
  }
}
