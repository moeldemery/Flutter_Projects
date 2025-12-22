import 'package:flutter/cupertino.dart';
import 'package:home_care/models/user.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'main_menu_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return MyHomePage();
    } else {
      return MainMenu();
    }


  }
}
