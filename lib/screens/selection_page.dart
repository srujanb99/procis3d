import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:procis3d/components/drawer_menu.dart';
import 'package:procis3d/components/drop_down.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/lists.dart';
import 'package:procis3d/objects/objects_listing.dart';
import 'package:procis3d/screens/param_output.dart';

class SelectionPage extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.yellow.shade800,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      drawer: DrawerMenu('home'),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu_rounded,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          title: Text('Procis3D'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Selection(),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

enum type { formula, theory }

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String? subject;
  String? topic;
  String topicType = theories[0];
  int topicListType = 0;
  String selected = "";
  type? _selectedType = type.theory;
  String selectedType = 'Theory';
  String? figure = 'Jet';

  Widget topicView(int topicListType) {
    List<Widget> listTiles = [];
    switch (topicListType) {
      case 1:
        listTiles = [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  title: Text('Theory'),
                  horizontalTitleGap: 0.0,
                  leading: Radio<type>(
                      value: type.theory,
                      groupValue: _selectedType,
                      onChanged: (type? value) {
                        setState(() {
                          _selectedType = value;
                        });
                      }),
                  onTap: () {
                    setState(() {
                      _selectedType = type.theory;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('Formula'),
                  horizontalTitleGap: 0.0,
                  leading: Radio<type>(
                      value: type.formula,
                      groupValue: _selectedType,
                      onChanged: (type? value) {
                        setState(() {
                          _selectedType = value;
                        });
                      }),
                  onTap: () {
                    setState(() {
                      _selectedType = type.formula;
                    });
                  },
                ),
              ),
            ],
          ),
          DropDownSelector(
            value: topicType,
            valueList: theories,
            listType: selectedType,
            onChanged: (String? newValue) {
              setState(() {
                topicType = newValue!;
              });
            },
          ).dropDownSelector(),
        ];
        break;
      case 2:
        listTiles = [
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: getGridItems(),
            ),
          ),
        ];
        break;
      default:
        listTiles = [];
        break;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listTiles,
    );
  }

  List<Widget> getGridItems() {
    List<Widget> gridItems = [];
    List<String> subTopics = getSubTopics(topic);
    for (int fig = 0; fig < subTopics.length; fig++) {
      gridItems.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selected = subTopics[fig];
              figure = selected;
            });
          },
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                subTopics[fig],
                style: kFormData,
                textAlign: TextAlign.center,
              ),
            ),
            color: selected == subTopics[fig]
                ? Colors.deepPurple
                : Colors.grey[850],
          ),
        ),
      );
    }
    return gridItems;
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedType == type.formula)
      selectedType = 'Formula';
    else
      selectedType = 'Theory';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropDownSelector(
          value: subject,
          valueList: subjects,
          listType: 'Subject',
          onChanged: (String? newValue) {
            setState(() {
              subject = newValue!;
              topic = getTopics(subject)[0];
              topicListType = getTopicListType(topic);
              figure = topic;
            });
          },
        ).dropDownSelector(),
        DropDownSelector(
          value: topic,
          valueList: getTopics(subject),
          listType: 'Topic',
          onChanged: (String? newValue) {
            setState(() {
              topic = newValue!;
              topicListType = getTopicListType(topic);
              figure = topic;
            });
          },
        ).dropDownSelector(),
        Center(
          child: DefaultTextStyle.merge(
            style: kFormTitle,
            child: Container(
              width: double.infinity,
              height: 300.0,
              padding: EdgeInsets.only(right: 90.0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(150)),
                color: Colors.yellow.shade800,
              ),
              child: topicView(topicListType),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange.shade800,
          ),
          child: Text('Next'),
          onPressed: () {
            //Navigator.pushNamed(context, '/params');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParamsOutput(
                  objectId: getObjectKeyId(figure),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
