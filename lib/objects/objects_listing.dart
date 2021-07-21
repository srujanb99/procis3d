/*
To add an object,
  1. Create an object key ID by adding the name and the objectKeyId in the getObjectKeyId method.
  2. Go to objects3d map and add an Objects3D class object by specifying the ObjectKeyId as the map key.
  3. Add id, title, info, file and fileType as all of them are required.
*/

import 'package:procis3d/objects/objects3d.dart';

int getObjectKeyId(String? figure) {
  int objectKeyId = 0;
  switch (figure) {
    case 'Sphere':
      objectKeyId = 1;
      break;
    case 'Cube':
      objectKeyId = 2;
      break;
    case 'Array':
      objectKeyId = 3;
      break;
  }
  return objectKeyId;
}

var objects3d = {
  0: Objects3D(
    id: 00,
    title: 'Jet',
    info: 'An Amazing Jet',
    file: 'Jet.obj',
    fileType: 'obj',
  ),
  1: Objects3D(
    id: 01,
    title: 'Sphere',
    info: 'A Sphere with adjustable radius',
    file: 'sphere.obj',
    fileType: 'obj',
  ),
  2: Objects3D(
    id: 02,
    title: 'Cube',
    info: 'A Cube with flexible dimensions',
    file: 'cube.obj',
    fileType: 'obj',
  ),
  3: Objects3D(
    id: 03,
    title: 'Linear Array Antenna',
    info:
        'A linear array is a single element wide with N number of elements across. The spacing may vary, but often it is uniform.',
    file: 'Linear_Array_Radiation_Pattern.jpg',
    fileType: 'jpg',
  ),
};
