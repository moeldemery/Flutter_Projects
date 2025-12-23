
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_system/view/welcome_subscreen/login_subscreen/home_subscreens/addNewTicket_screen.dart';
import '../../../models/TicketCard.dart';
import 'package:ticket_system/models/TicketCard_DTO.dart';




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TicketCardDTO> mylist = new List();

  TicketCardDTO a = new TicketCardDTO(
      ticketTitle: "REPAIR INK TANK",
      ticketColor: Colors.lime,
      ticketIcon: Icons.add_call,
      ticketLocation: "Omega Hospital",
      ticketAssignedTo: "Demery",
      ticketDate: "10/5/2020 10:30 PM",
      ticketStatues: "OPEN",
      imageUrl:
      "https://ritecaremedicalofficepc.com/wp-content/uploads/2019/09/img_avatar.png");
  TicketCardDTO b = new TicketCardDTO(
      ticketTitle: "REPLACE DRUM 560",
      ticketColor: Colors.lightGreen,
      ticketIcon: Icons.email,
      ticketLocation: "Gleem Hospital",
      ticketAssignedTo: "Mohamed",
      ticketDate: "20/5/2020 5:15 AM",
      ticketStatues: "DONE",
      imageUrl: "https://www.w3schools.com/howto/img_avatar2.png");
  TicketCardDTO c = new TicketCardDTO(
      ticketTitle: "Visit to Site",
      ticketColor: Colors.deepOrange,
      ticketIcon: Icons.announcement,
      ticketLocation: "Dar Xray",
      ticketAssignedTo: "Mohoud Ahmed Said",
      ticketDate: "30/12/2020 03:55 PM",
      ticketStatues: "On Hold",
      imageUrl: "https://www.w3schools.com/w3images/avatar6.png");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mylist.add(a);
    mylist.add(b);
    mylist.add(c);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          //String key = values.keys.elementAt(index);
          return TicketCard(
            values: mylist,
            index: index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TicketCardDTO myCard = new TicketCardDTO();

          bool x = true;

          x = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewTicket(myCard)));

          if (x ?? false) {      //if x = null turn it to false
             setState(()  {
               mylist.add(myCard);

            });

             _scrollController.animateTo(
               _scrollController.position.maxScrollExtent,
               curve: Curves.easeOut,
               duration: const Duration(milliseconds: 300),
             );
          }


        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
//   Future<bool> _showDialog(context, TicketCardDTO myCard) async {
//
//     //TicketCardDTO myCard = new TicketCardDTO();
//
//     var result = await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         // return alert dialog object
//         return AlertDialog(
//           title: new Text('Creating New Ticket'),
//           content: ,
//         );
//       },
//     );
//     if (result != null) {
//       setState(() {});
//
//     }
//     return isSuccess;
//   }
// }
