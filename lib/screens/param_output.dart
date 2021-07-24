import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:procis3d/objects/objects_view.dart';

class ParamsOutput extends StatelessWidget {
  ParamsOutput({required this.objectId});
  final String objectId;
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Parameters & Output',
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
              child: Center(
                child: Text(
                  objects3d[objectId]!.title,
                  style: kFormTitle,
                ),
              ),
            ),
            Expanded(
              // flex: 8,
              // height: 600.0,
              // width: 350.0,
              child: ObjectView(objectId),
            ),
            SizedBox(
              height: 50.0,
              child: SingleChildScrollView(
                child: Text(
                  objects3d[objectId]!.info,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
