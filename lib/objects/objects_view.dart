import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:procis3d/objects/objects_listing.dart';
//import 'package:model_viewer/model_viewer.dart';
// https://medium.com/flutterdevs/explore-model-viewer-in-flutter-e5988edbfe66

class ObjectView extends StatefulWidget {
  ObjectView(this.objectId);
  final String objectId;
  @override
  _ObjectViewState createState() => _ObjectViewState(objectId);
}

class _ObjectViewState extends State<ObjectView> {
  _ObjectViewState(this.objectId);
  final String objectId;

  late Object output3d;

  @override
  void initState() {
    output3d = Object(fileName: 'assets/objects/${objects3d[objectId]!.file}');
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
