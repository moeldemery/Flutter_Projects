import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gyna/assets/constants.dart';
import 'package:gyna/screens/home_subscreen/home_buttons.dart';
import 'package:gyna/screens/subscreens/drawer_subScreen.dart';
import 'package:odoo_api/odoo_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;
    //6-11-1972
    //PageController controller = PageController(initialPage: 1);

    return Scaffold(
      appBar: kAppBar2,
      drawer: DrawerSubScreen(),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = true;
          return new Stack(
            children: [
              child,
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 4),
                  color: connected ? null : Color(0xFFEE4400),
                  child: connected ? null :Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OFFLINE',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        child: Container(
          decoration: kBackgroundImage,
          child: GridView.count(
            crossAxisCount: 2,
            // shrinkWrap: true,
            childAspectRatio: 100 / 75,
            children: [
              HomeButtons(
                iconName: FontAwesomeIcons.userPlus,
                title: "Add Patient",
                path: '/addPatient',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.userEdit,
                title: "view Patient",
                path: '/viewPatient',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.hospital,
                title: "Add Visit",
                path: '/addVisit',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.userEdit,
                title: "view Visit",
                path: '/viewVisit',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.userEdit,
                title: "Add Husband",
                path: '/addHusband',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.flask,
                title: "Add Lab",
                path: '/addLab',
              ),
              HomeButtons(
                iconName: FontAwesomeIcons.pills,
                title: "Add medicine",
                path: '/addMedicine',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
