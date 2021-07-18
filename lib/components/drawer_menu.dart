import 'package:flutter/material.dart';

enum Screens { home, about }

class DrawerMenu extends StatelessWidget {
  DrawerMenu(this.screen);

  final String screen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 0.0),
              decoration: BoxDecoration(
                color: Colors.yellow.shade800,
              ),
              child: Center(
                child: Image.asset('assets/logos/procis3d_logo.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.0,
                  color: Colors.yellow.shade800,
                ),
                color: Colors.yellow.shade800,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.grey[850],
                ),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => screen != 'home'
                      ? Navigator.pushNamed(context, '/select')
                      : Navigator.pushReplacementNamed(context, '/select'),
                  selected: true,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                //Navigator.popUntil(context, ModalRoute.withName('/select'));
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              },
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.yellow.shade800,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
    );
  }
}
