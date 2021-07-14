import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:procis3d/objects/objects_view.dart';
import 'package:screenshot/screenshot.dart';

class ParamsOutput extends StatelessWidget {
  ParamsOutput({required this.objectId});
  final String objectId;
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Parameters & Output',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Center(
          child: Output(objectId),
        ),
      ),
    );
  }
}

class Output extends StatefulWidget {
  Output(this.objectId);
  final String objectId;
  @override
  _OutputState createState() => _OutputState(objectId);
}

class _OutputState extends State<Output> {
  _OutputState(this.objectId);
  final String objectId;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            objects3d[objectId]!.title,
            style: kFormTitle,
          ),
        ),
        Expanded(
          flex: 4,
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ObjectView(objectId),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Container(
            child: Text(objects3d[objectId]!.info),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              showCapturedWidget(context, capturedImage!);
            }).catchError((onError) {
              print(onError);
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent,
          ),
          child: Text('Save Image'),
        ),
      ],
    );
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(
            // ignore: unnecessary_null_comparison
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }
}
