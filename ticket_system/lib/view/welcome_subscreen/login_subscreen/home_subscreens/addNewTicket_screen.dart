

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../models/TicketCard_DTO.dart';
import '../../../../models/customWidget.dart';

enum SingingCharacter { hardware, software }

class AddNewTicket extends StatefulWidget {
  final TicketCardDTO myCard;

  AddNewTicket(this.myCard);

  @override
  _AddNewTicketState createState() => _AddNewTicketState();
}

class _AddNewTicketState extends State<AddNewTicket> {

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerClientName = TextEditingController();
  TextEditingController controllerClientSite = TextEditingController();
  TextEditingController controllerEngName = TextEditingController();
  TextEditingController controllerClientPhone = TextEditingController();
  SingingCharacter _character = SingingCharacter.software;
  bool isSuccess = false;

  SelectedDropDown ticketTypes = new SelectedDropDown();
  List<String> ticketTypee = ['Visit Site', 'Replace Ink'];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticketTypes.listDrop.addAll(ticketTypee);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Patient"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            // height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropDownMenu(
                  obj: ticketTypes,
                  labelText: "Ticket\'s Title ",
                  iconName: FontAwesomeIcons.tag,
                ),

                Wrap(
                  children: [
                    RadioListTile(

                      title: Text("hardwareee"),
                      value: SingingCharacter.hardware,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },),
                  ],
                ),
                Wrap(
                  children: [
                    RadioListTile(

                      title: Text("software"),
                      value: SingingCharacter.software,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },),
                  ],
                ),

                InputField(
                    hintText: "Client ",
                    labelText: "Client\'s Name ",
                    iconName: FontAwesomeIcons.clinicMedical,
                    controller: controllerClientName),
                InputField(
                    hintText: "Site ",
                    labelText: "Client\'s Site ",
                    iconName: FontAwesomeIcons.sitemap,
                    controller: controllerClientSite),
                InputField(
                    hintText: "Telephone ",
                    labelText: "Client\'s Telephone ",
                    iconName: FontAwesomeIcons.phone,
                    controller: controllerClientPhone),
                InputField(
                    hintText: "Engineer ",
                    labelText: "Engineer\'s Name ",
                    iconName: FontAwesomeIcons.personBooth,
                    controller: controllerEngName),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Creation Date : '),
                    StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy hh:mm:ss')
                                .format(DateTime.now()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: RaisedButton(
                        onPressed: () {
                          widget.myCard.ticketTitle = ticketTypes.valueDrop??'';
                          widget.myCard.ticketLocation =
                              controllerClientName.text.toString();
                          widget.myCard.ticketAssignedTo =
                              controllerEngName.text.toString();
                          widget.myCard.imageUrl =
                          "https://www.w3schools.com/w3images/avatar6.png";
                          widget.myCard.ticketIcon = Icons.add;
                          DateTime now = DateTime.now();
                          String formattedDate =
                          DateFormat('dd/MM/yyyy kk:mm a').format(now);
                          widget.myCard.ticketDate = formattedDate;
                          widget.myCard.ticketStatues = "OPEN";
                          isSuccess = true;
                          Navigator.pop(context, true);
                        },
                        color: Colors.green,
                        child: Text("Save" ,style: TextStyle(fontSize: 25.0 ,fontWeight: FontWeight.bold ),),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
