import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Objects3D extends StatefulWidget {
  @override
  _Objects3DState createState() => _Objects3DState();
}

class _Objects3DState extends State<Objects3D> {
  late Object output3d;

  @override
  void initState() {
    output3d = Object(fileName: 'assets/objects/Jet.obj');
    output3d.rotation.setValues(0, -90, 0);
    output3d.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Cube(
      onSceneCreated: (Scene scene) {
        scene.world.add(output3d);
        scene.camera.zoom = 10;
      },
    );
  }
}
