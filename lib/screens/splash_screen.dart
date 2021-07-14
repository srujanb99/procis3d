import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogoVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 500),
        () => setState(() {
              _isLogoVisible = true;
            }));
    /* Timer(Duration(milliseconds: 5000),
        () => Navigator.pushReplacementNamed(context, '/select')); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /* Image(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ), */
          Container(
            decoration: BoxDecoration(color: Colors.yellow.shade800),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: _isLogoVisible ? 1.0 : 0.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100.0,
                  child: Image(
                    image: AssetImage('assets/logos/procis3d_logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
