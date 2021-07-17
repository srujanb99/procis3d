const List<String> subjects = [
  'Electronics',
  'Mathematics',
];

List<String> getTopics(String? subject) {
  switch (subject) {
    case 'Electronics':
      return electronics;
    case 'Mathematics':
      return mathematics;
    default:
      return [];
  }
}

const List<String> electronics = [
  'Antenna',
  'Analog Electronics',
  'Integrated Circuits',
  'VLSI',
];

const List<String> mathematics = [
  '3D Shapes',
];

/* const List<String> Physics = [
  'EM Waves',
  'Semiconductors',
]; */

int getTopicListType(String? topic) {
  int topicListType = 1;
  switch (topic) {
    case '3D Shapes':
      topicListType = 2;
      break;
    case 'Antenna':
      topicListType = 2;
      break;
  }
  return topicListType;
}

List<String> getSubTopics(String? topic) {
  switch (topic) {
    case '3D Shapes':
      return shapes3D;
    case 'Antenna':
      return antenna;
    default:
      return [];
  }
}

const List<String> shapes3D = [
  'Cube',
  'Sphere',
];

const List<String> antenna = [
  'Wire',
  'Log Periodic',
  'Aperture',
  'Microstrip',
  'Reflector',
  'Lens',
  'Travelling-Wire',
  'Array',
];

const List<String> theories = [
  'MOSFET',
  'Radiation Patterns',
];
