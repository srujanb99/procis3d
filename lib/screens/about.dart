import 'package:flutter/material.dart';
import 'package:procis3d/components/scaffold_theme.dart';
import 'package:procis3d/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'About & Contact',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
                child: Text(
                  'A 3D teaching aid for the benefit of teachers to teach otherwise difficult concepts and facilitate better learning and retention by the students. This essentially supports visualization in many courses in electronics.',
                  style: kFormTitle.copyWith(
                    letterSpacing: 1.0,
                    wordSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
                width: 350,
                child: Divider(
                  color: Colors.white,
                  thickness: 2.0,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Contact:',
                    style: kFormTitle,
                  ),
                  InkWell(
                    child: Text(
                      'srujanb7@gmail.com',
                      style: kFormTitle.copyWith(
                        color: Colors.lightBlue,
                      ),
                    ),
                    onTap: () => launch('mailto:srujanb7@gmail.com'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => launch('https://forms.gle/7yjfknvSsDLa8yPg9'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                ),
                child: Text('Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
