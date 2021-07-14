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
  String subject = subjects[0];
  String topic = electronics[0];
  String topicType = theories[0];
  type? _selectedType = type.theory;
  String selectedType = 'Theory';
  String figure = 'Jet';

  Widget topicView(int topicListType) {
    List<Widget> listTiles = [];
    switch (topicListType) {
      case 0:
        listTiles = [Container()];
        break;
      case 1:
        listTiles = [
          Container(
            width: 300.0,
            child: Row(
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
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              '$selectedType:',
              style: kFormTitle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropDownSelector(
              value: topicType,
              valueList: theories,
              onChanged: (String? newValue) {
                setState(() {
                  topicType = newValue!;
                });
              },
            ).dropDownSelector(),
          ),
        ];
        break;
      case 2:
        listTiles = [
          Container(
            child: Text(
              'Linear Array',
              textAlign: TextAlign.center,
            ),
          ),
        ];
        break;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: listTiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedType == type.formula)
      selectedType = 'Formula';
    else
      selectedType = 'Theory';

    int topicListType = topicListTypeSelector(topic);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 300.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subject',
                style: kFormTitle,
              ),
              DropDownSelector(
                value: subject,
                valueList: subjects,
                onChanged: (String? newValue) {
                  setState(() {
                    subject = newValue!;
                    topic = topicSelector(subject)[0];
                    topicListType = topicListTypeSelector(topic);
                    figure = topic;
                  });
                },
              ).dropDownSelector(),
            ],
          ),
        ),
        Container(
          width: 300.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Topic',
                style: kFormTitle,
              ),
              DropDownSelector(
                value: topic,
                valueList: topicSelector(subject),
                onChanged: (String? newValue) {
                  setState(() {
                    topic = newValue!;
                    topicListType = topicListTypeSelector(topic);
                    figure = topic;
                  });
                },
              ).dropDownSelector(),
            ],
          ),
        ),
        topicView(topicListType),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
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
