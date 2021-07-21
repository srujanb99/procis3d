import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Help & Documentation',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            child: Text(
              'Selection Page:\n1. Select the subject associated with the 3D figure required.\n2. Select the appropriate topic.\n3. Choose the subtopic and hit next.\n4. If the topic selected has theory and formula options, select the theory or formula from the dropdown and hit next to get the 3D representation.\n\nOutput Page:\n1. Drag and pinch the 3D object around to rotate and scale it. Double tap to reset position and scale.\n2. Click on \'save image\' to have the snapshot of the object saved locally.\n\nAny suggestions or feedback will be appreciated and can be submitted through the About page.',
              style: kFormTitle,
            ),
          ),
        ),
      ),
    );
  }
}
