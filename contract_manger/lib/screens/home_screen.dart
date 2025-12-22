//import 'package:contract_manger/assets/constants.dart';
import 'dart:convert';
import 'dart:io';
import 'package:contract_manger/assets/constants.dart';
import 'package:contract_manger/assets/globals.dart';
import 'package:contract_manger/subScreen/about_us.dart';
import 'package:contract_manger/subScreen/delete_confirmation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:contract_manger/components/add_card_to_list.dart';



//-------------------------------------------------
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
//-------------------------------------------------

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//-------------------------------------------------
class _HomeScreenState extends State<HomeScreen> {

  AddCard addCard = AddCard();

  void updateScreen(dynamic value) {
    setState(() {});
  }

  void _deleteCard(int index)async{
    final prefs = await SharedPreferences.getInstance();
    contractList.removeAt(index);
    cardDataList.removeAt(index);
    prefs.setStringList("cardDataList", cardDataList);

  }

  void _loadCards()async{

    final prefs = await SharedPreferences.getInstance();
    final List<String> encodedCardData = prefs.getStringList('cardDataList') ?? [];
    cardDataList = encodedCardData;

    print(encodedCardData);

    if (encodedCardData != null){
      for(int i = 0; i < cardDataList.length; i++  )
        {
          print('hello');
          dynamic decodedCardData =jsonDecode(cardDataList[i]);
          setState(() {
            startingDate = DateTime.parse(decodedCardData['startingDate']);
            endingDate   = DateTime.parse(decodedCardData['endingDate'])  ;
            contractList.add(
                addCard.addNewCard(
                  contractName: decodedCardData['contractName'],
                  organisationName: decodedCardData['organisationName'],
                )
            );
          });
        }
    }
    else{
      print('data = null');
    }
  }



  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0)
        {

        }
      else if(_selectedIndex == 1)
        {
          Navigator.pushNamed(context, '/add').then(updateScreen);
          _selectedIndex=0;
        }
      else if(_selectedIndex == 2)
        {
          exit(0);
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Contract manger') ,
      ),

      drawer: Drawer(
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
                            image: AssetImage('images/licence.png'),
                        ),
                      ),
                      Text(
                        'Contract \n Manger',
                        style: kDeleteText,
                      ),
                    ],
                  )
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Add New Contract'),
              leading: Icon(Icons.add),
              onTap: () {
                Navigator.pushNamed(context, '/add').then(updateScreen);
              },
            ),
            ListTile(
              title: Text('About App'),
              leading: Icon(Icons.info_outline),
              onTap: () {
                showAboutUsConfirm(context);
                //notification.showNotification();
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home') ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos),
            title: Text('Add') ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            title: Text('Exit') ,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),

      body: Column(
        children: [
          Expanded(
            flex: 6,
              child: ListView.builder(
                itemCount: contractList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Dismissible(
                    direction: DismissDirection.endToStart ,
                    key: UniqueKey(),
                    confirmDismiss: (DismissDirection direction)async{
                        return await showDeleteConfirm(context) ;
                    },

                    background: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Delete ',style: kDeleteText,),
                          Icon(Icons.delete_forever,color: Colors.white,size: 50.0,),
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _deleteCard(index);
                      });
                    },
                   child:contractList[index],
                  );
                },
              ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: RaisedButton(
          //       child:Text('Add new Contract') ,
          //       onPressed: (){
          //         Navigator.pushNamed(context, '/add').then(updateScreen);
          //       },
          //   ),
          // ),
          // RaisedButton(
          //   child:Text('testing alerts') ,
          //   onPressed: (){},
          //
          //
          // ),
        ],
      ),
    );
  }
}
