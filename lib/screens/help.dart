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
              'SelectionPage:\n1. Select the subject associated with the 3D figure required.\n2. Select the appropriate topic.\n3. Choose either theory or formula based on the use case.\n4. Select the theory or formula and hit next to get the 3D representation.\n\nOutput Page:\n1. Drag the 3D object around to rotate it.\n2. Click on \'save image\' to have the snapshot of the object saved locally.\n\nAny suggestions or feedback will be appreciated and can be submitted through the About page.',
              style: kFormTitle,
            ),
          ),
        ),
      ),
    );
  }
}
