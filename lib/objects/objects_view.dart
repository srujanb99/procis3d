import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:photo_view/photo_view.dart';
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
  late PhotoViewControllerBase controller;
  late PhotoViewScaleStateController scaleStateController;
  double minScale = 0.0;
  double defScale = 10;
  double maxScale = 15.0;

  @override
  void initState() {
    if (objects3d[objectId]!.fileType == 'obj') {
      output3d =
          Object(fileName: 'assets/objects/${objects3d[objectId]!.file}');
      output3d.rotation.setValues(0, -90, 0);
      output3d.updateTransform();
    } else {
      minScale = 0.4;
      maxScale = 1.5;
      defScale = 0.5;
      controller = PhotoViewController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: objects3d[objectId]!.fileType == 'obj'
                    ? Cube(
                        onSceneCreated: (Scene scene) {
                          scene.world.add(output3d);
                          scene.camera.zoom = defScale;
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhotoView(
                          controller: controller,
                          backgroundDecoration:
                              BoxDecoration(color: Colors.white),
                          initialScale: PhotoViewComputedScale.covered,
                          minScale: minScale,
                          maxScale: maxScale,
                          imageProvider: AssetImage(
                              'assets/objects/${objects3d[objectId]!.file}'),
                        ),
                      ),
              ),
            ),
          ),
        ),
        Text(
          defScale.toStringAsFixed(2),
          style: kFormTitle,
          textAlign: TextAlign.center,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
          child: Slider(
            value: defScale,
            min: minScale,
            max: maxScale,
            onChanged: (double newValue) {
              setState(
                () {
                  defScale = newValue;
                  if (objects3d[objectId]!.fileType == 'obj')
                    output3d.scene!.camera.zoom = newValue;
                  else
                    controller.scale = newValue;
                },
              );
            },
          ),
        )
      ],
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
