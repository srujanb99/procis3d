import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
//import 'package:model_viewer/model_viewer.dart';
// https://medium.com/flutterdevs/explore-model-viewer-in-flutter-e5988edbfe66

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
    /* return ModelViewer(
      src: 'assets/objects/Sample.glb',
      alt: "Sample Object",
      ar: true,
      autoRotate: true,
      cameraControls: true,
    ); */
  }
}
