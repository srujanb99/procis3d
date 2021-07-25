import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:photo_view/photo_view.dart';
import 'package:procis3d/screens/param_output.dart';
import 'package:screenshot/screenshot.dart';
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
  String objectId;
  late String filePath;
  late String fileType;
  late Object output3d;
  ScreenshotController screenshotController = ScreenshotController();
  late PhotoViewControllerBase controller;
  late PhotoViewScaleStateController scaleStateController;
  double minScale = 0.4;
  double defScale = 0.5;
  double maxScale = 1.5;
  double minRotation = -4.0;
  double maxRotation = 4.0;
  double propValue = 0.5;
  int propNumber = 0;
  List<String> props = ['Scale', 'Rotation', 'Axes'];
  List<String> propUnits = ['%', 'deg'];
  String? defAxis;
  List<String> axis = ['-', 'X', 'Y', 'Z'];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    fileType = objects3d[objectId]!.fileType;
    filePath = objects3d[objectId]!.file;
    if (fileType == 'obj') {
      minScale = 0.0;
      defScale = 10.0;
      maxScale = 15.0;
      propValue = 10.0;
      output3d = Object(fileName: 'assets/objects/$filePath');
      output3d.rotation.setValues(0, -90, 0);
      output3d.updateTransform();
    } else {
      if (objectId.endsWith('X'))
        defAxis = 'X';
      else if (objectId.endsWith('Y'))
        defAxis = 'Y';
      else if (objectId.endsWith('Z'))
        defAxis = 'Z';
      else
        defAxis = '-';
      objectId = objectId.replaceAll(defAxis ?? '', '');
      controller = PhotoViewController();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (fileType != 'obj') controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView(
        controller: scrollController,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Screenshot(
            controller: screenshotController,
            child: Center(
              child: Container(
                height: 300.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: (fileType == 'obj')
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
                              enableRotation: true,
                              backgroundDecoration:
                                  BoxDecoration(color: Colors.white),
                              initialScale: PhotoViewComputedScale.contained,
                              minScale: minScale,
                              maxScale: maxScale,
                              imageProvider:
                                  AssetImage('assets/objects/$filePath'),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          (fileType == 'obj')
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SliderTheme(
                    data: kSliderThemeData,
                    child: Slider(
                      value: output3d.scene?.camera.zoom ?? defScale,
                      label: (propValue * 100 / 15).toStringAsFixed(0),
                      min: minScale,
                      max: maxScale,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            output3d.scene!.camera.zoom = newValue;
                            propValue = newValue;
                          },
                        );
                      },
                    ),
                  ),
                )
              : Column(
                  children: [
                    StreamBuilder(
                      stream: controller.outputStateStream,
                      initialData: controller.value,
                      builder: _streamBuild,
                    ),
                    Text(
                      props[propNumber],
                      textAlign: TextAlign.center,
                      style: kFormData,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        width: 300.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade800,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Center(
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 1,
                              scrollDirection: Axis.horizontal,
                              primary: false,
                              padding: const EdgeInsets.all(4.0),
                              mainAxisSpacing: 10,
                              physics: BouncingScrollPhysics(),
                              children: getPropItems(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
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
            ),
          ),
        ],
      ),
    );
    /* return ModelViewer(
      src: 'assets/objects/Sample.glb',
      alt: "Sample Object",
      ar: true,
      autoRotate: true,
      cameraControls: true,
    ); */
  }

  Widget _streamBuild(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError || !snapshot.hasData) {
      return Container();
    }
    String propUnit = (propNumber < 2) ? propUnits[propNumber] : '';
    final PhotoViewControllerValue value = snapshot.data;
    if (propNumber == 0) {
      propValue = (value.scale ?? defScale) * 200;
    }
    if (propNumber == 1) {
      propValue = (value.rotation) * 180 / (22 / 7);
    }

    List<Widget> propSetters = [
      //Scale Slider
      SliderTheme(
        data: kSliderThemeData,
        child: Slider(
          value: value.scale?.clamp(minScale, maxScale) ?? defScale,
          min: minScale,
          max: maxScale,
          onChanged: (double newValue) {
            setState(
              () {
                controller.scale = newValue;
                //propValue = controller.scale ?? defScale;
              },
            );
          },
        ),
      ),
      //Rotate Slider
      SliderTheme(
        data: kSliderThemeData,
        child: Slider(
          value: value.rotation.clamp(minRotation, maxRotation),
          min: minRotation,
          max: maxRotation,
          onChanged: (double newValue) {
            setState(
              () {
                controller.rotation = newValue;
                //propValue = controller.rotation;
              },
            );
          },
        ),
      ),
      //Axes Changer
      DropdownButton(
        value: defAxis,
        style: kFormData,
        underline: Container(
          width: 100.0,
          height: 2.0,
          color: Colors.deepPurpleAccent,
        ),
        items: axis.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onChanged: (String? newValue) {
          setState(() {
            defAxis = newValue;
            Navigator.pop(context);
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => ParamsOutput(
                  objectId: (defAxis != '-') ? objectId + '$defAxis' : objectId,
                ),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          });
        },
      ),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            propValue.toStringAsFixed(0) + ' ' + propUnit,
            style: kFormTitle,
            textAlign: TextAlign.center,
          ),
        ),
        propSetters[propNumber],
      ],
    );
  }

  List<Widget> getPropItems() {
    List<Widget> propItems = [
      GestureDetector(
        onTap: () {
          setState(() {
            propNumber = 0;
          });
        },
        child: Card(
          elevation: 10.0,
          shape: CircleBorder(),
          child: Center(
            child: Icon(Icons.zoom_in_rounded),
          ),
          color: (propNumber == 0) ? Colors.deepPurple : Colors.grey[850],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            propNumber = 1;
          });
        },
        child: Card(
          elevation: 10.0,
          shape: CircleBorder(),
          child: Center(
            child: Icon(Icons.cached_rounded),
          ),
          color: (propNumber == 1) ? Colors.deepPurple : Colors.grey[850],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(
            () {
              propNumber = 2;
            },
          );
        },
        child: Card(
          elevation: 10.0,
          shape: CircleBorder(),
          child: Center(
            child: Icon(Icons.threed_rotation_rounded),
          ),
          color: (propNumber == 2) ? Colors.deepPurple : Colors.grey[850],
        ),
      ),
    ];
    /* for (int itemNo = 0; itemNo < props.length; itemNo++) {
      propItems.add(
        GestureDetector(
          onTap: () {
            setState(() {
              propNumber = itemNo;
            });
          },
          child: Card(
            elevation: 10.0,
            shape: CircleBorder(),
            child: Center(
              child: Icon(Icons.zoom_in_rounded),
            ),
            color: (propNumber == itemNo) ? Colors.deepPurple : Colors.grey[850],
          ),
        ),
      );
    } */
    return propItems;
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => ScaffoldTheme(
        title: 'Captured Figure',
        body: Center(
          child:
              // ignore: unnecessary_null_comparison
              (capturedImage != null)
                  ? Image.memory(capturedImage)
                  : Container(),
        ),
      ),
    );
  }
}
