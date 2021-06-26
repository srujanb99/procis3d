import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScaffoldTheme extends StatelessWidget {
  ScaffoldTheme({required this.title, required this.body});
  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 20.0 : 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: body,
    );
  }
}
