import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:procis3d/objects/objects_view.dart';

class ParamsOutput extends StatelessWidget {
  ParamsOutput({required this.objectId});
  final int objectId;
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
                child: Text(
                  objects3d[objectId]!.title,
                  style: kFormTitle,
                ),
              ),
              Expanded(
                flex: 8,
                child: ObjectView(objectId),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    objects3d[objectId]!.info,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
