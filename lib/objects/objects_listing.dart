import 'package:procis3d/objects/objects3d.dart';

String getObjectKeyId(String figure) {
  String objectKeyId = '00';
  switch (figure) {
    case 'Sphere':
      objectKeyId = '01';
      break;
    case 'Cube':
      objectKeyId = '02';
      break;
  }
  return objectKeyId;
}

var objects3d = {
  '00': Objects3D(
    id: '00',
    title: 'Jet',
    info: 'An Amazing Jet',
    file: 'Jet.obj',
    fileType: 'obj',
  ),
  '01': Objects3D(
    id: '01',
    title: 'Sphere',
    info: 'A Sphere with adjustable radius',
    file: 'sphere.obj',
    fileType: 'obj',
  ),
  '02': Objects3D(
    id: '02',
    title: 'Cube',
    info: 'A Cube with flexible dimensions',
    file: 'cube.obj',
    fileType: 'obj',
  ),
};
