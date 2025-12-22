import 'package:flutter/material.dart';
import 'package:gyna/assets/constants.dart';

class DrawerSubScreen extends StatefulWidget {
  @override
  _DrawerSubScreenState createState() => _DrawerSubScreenState();
}

class _DrawerSubScreenState extends State<DrawerSubScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    Text(
                      ' Gyna \n Mobile \n Portal',
                      style: kDrawerTitleText,
                    ),
                  ],
                )),
            decoration: BoxDecoration(
              color: Colors.red[300],
            ),
          ),
          ListTile(
            title: Text('Add New Patient'),
            leading: Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: Text('About App'),
            leading: Icon(Icons.info_outline),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
