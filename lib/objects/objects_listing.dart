/*
To add an object,
  1. Create an object key ID by adding the name and the objectKeyId in the getObjectKeyId method.
  2. Go to objects3d map and add an Objects3D class object by specifying the ObjectKeyId as the map key.
  3. Add id, title, info, file and fileType as all of them are required.
  4. If it's an image, give the original along with images with the object oriented around x, y & z axes. Name the files as '03', '03X', '03Y' & '03Z' respectively.
*/

import 'package:procis3d/objects/objects3d.dart';

String getObjectKeyId(String? figure) {
  String objectKeyId = '00';
  switch (figure) {
    case 'Sphere':
      objectKeyId = '01';
      break;
    case 'Cube':
      objectKeyId = '02';
      break;
    case 'Dipole':
      objectKeyId = '03';
      break;
  }
  return objectKeyId;
}

var objects3d = {
  '00': Objects3D(
    id: 00,
    title: 'Jet',
    info: 'An Amazing Jet',
    file: 'Jet.obj',
    fileType: 'obj',
  ),
  '01': Objects3D(
    id: 01,
    title: 'Sphere',
    info: 'A Sphere with adjustable radius',
    file: 'sphere.obj',
    fileType: 'obj',
  ),
  '02': Objects3D(
    id: 02,
    title: 'Cube',
    info: 'A Cube with flexible dimensions',
    file: 'cube.obj',
    fileType: 'obj',
  ),
  '03': Objects3D(
    id: 03,
    title: 'Dipole Antenna',
    info:
        'The dipole is any one of a class of antennas producing a radiation pattern approximating that of an elementary electric dipole with a radiating structure supporting a line current so energized that the current has only one node at each end.',
    file: 'antenna/dipole.png',
    fileType: 'png',
  ),
  '03X': Objects3D(
    id: 03,
    title: 'Dipole Antenna',
    info:
        'The dipole is any one of a class of antennas producing a radiation pattern approximating that of an elementary electric dipole with a radiating structure supporting a line current so energized that the current has only one node at each end.',
    file: 'antenna/dipole_X.png',
    fileType: 'png',
  ),
  '03Y': Objects3D(
    id: 03,
    title: 'Dipole Antenna',
    info:
        'The dipole is any one of a class of antennas producing a radiation pattern approximating that of an elementary electric dipole with a radiating structure supporting a line current so energized that the current has only one node at each end.',
    file: 'antenna/dipole_Y.png',
    fileType: 'png',
  ),
  '03Z': Objects3D(
    id: 03,
    title: 'Dipole Antenna',
    info:
        'The dipole is any one of a class of antennas producing a radiation pattern approximating that of an elementary electric dipole with a radiating structure supporting a line current so energized that the current has only one node at each end.',
    file: 'antenna/dipole_Z.png',
    fileType: 'png',
  ),
};
