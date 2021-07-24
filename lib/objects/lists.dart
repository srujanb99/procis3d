/*
A. To add a subject, add it to the list subjects[] and put a reference to the topics list in the getTopics method.
B. To add a topic,
    1. Add it to the list of that subject[].
    2. Choose the listType to list the subtopics for that topic and add to the getTopicListType method.
    3. Put a reference to the subtopics list in the getSubTopics method.
C. To add a subtopic,
    1. Add it to the list of that topic[].
    2. Then go to objects_listing.dart and add the object for the subtopic.
*/

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
  //'Analog Electronics',
  //'Integrated Circuits',
  //'VLSI',
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
  'Dipole',
  'Monopole',
  'Helix',
  'Waveguide',
  'Horn',
  'Reflector',
  'Patch Microstrip',
  'Yagi-Uda',
];

const List<String> theories = [
  'Design',
  'Radiation Patterns',
];
