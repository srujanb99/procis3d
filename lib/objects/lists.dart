const List<String> subjects = [
  'Electronics',
  'Mathematics',
];

List<String> topicSelector(String subject) {
  switch (subject) {
    case 'Electronics':
      return electronics;
    case 'Mathematics':
      return mathematics;
    default:
      return electronics;
  }
}

const List<String> electronics = [
  'Antenna',
  'Analog Electronics',
  'Integrated Circuits',
  'VLSI',
];

const List<String> mathematics = [
  'Sphere',
  'Cube',
];

/* const List<String> Physics = [
  'EM Waves',
  'Semiconductors',
]; */

int topicListTypeSelector(String topic) {
  int topicListType = 1;
  switch (topic) {
    case 'Antenna':
      topicListType = 2;
      break;
    case 'Sphere':
      topicListType = 0;
      break;
    case 'Cube':
      topicListType = 0;
      break;
  }
  return topicListType;
}

const List<String> theories = [
  'MOSFET',
  'Radiation Patterns',
];
