import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:procis3d/components/drawer_menu.dart';
import 'package:procis3d/components/drop_down.dart';
import 'package:procis3d/constants.dart';
import 'package:procis3d/objects/lists.dart';

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
  String subject = 'Electronics';
  String topic = 'Analog Electronics';
  String topicType = 'MOSFET';
  type? _selectedType = type.theory;
  String selectedType = 'Theory';

  @override
  Widget build(BuildContext context) {
    if (_selectedType == type.formula)
      selectedType = 'Formula';
    else
      selectedType = 'Theory';

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
                valueList: Electronics,
                onChanged: (String? newValue) {
                  setState(() {
                    topic = newValue!;
                  });
                },
              ).dropDownSelector(),
            ],
          ),
        ),
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
        Center(
          child: Text(
            '$selectedType:',
            style: kFormTitle,
            textAlign: TextAlign.center,
          ),
        ),
        DropDownSelector(
          value: topicType,
          valueList: Theories,
          onChanged: (String? newValue) {
            setState(() {
              topicType = newValue!;
            });
          },
        ).dropDownSelector(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text('Next'),
          onPressed: () {
            //Navigate to Screen 1
            Navigator.pushNamed(context, '/params');
          },
        ),
      ],
    );
  }
}
