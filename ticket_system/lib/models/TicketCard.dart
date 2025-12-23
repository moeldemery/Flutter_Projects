
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_system/models/TicketCard_DTO.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key key,
    @required this.values,
    this.index,
  }) : super(key: key);

  final List<TicketCardDTO> values;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              _showTicketDialog(context, values[index]);
            },
            child: ListTile(
              title: Text(
                "${values[index].ticketTitle}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_location_sharp,
                        size: 15.0,
                      ),
                      Text(
                        "${values[index].ticketLocation} ",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.assignment_ind,
                        size: 15.0,
                      ),
                      Text(
                        "${values[index].ticketAssignedTo} ",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  ),
                  Divider(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        size: 15.0,
                      ),
                      Text(
                        "${values[index].ticketDate}    ",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.assistant_photo,
                        size: 15.0,
                      ),
                      Text(
                        "${values[index].ticketStatues}",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  )
                ],
              ),
              leading: Icon(
                values[index].ticketIcon,
                size: 30.0,
              ),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage("${values[index].imageUrl}"),
                radius: 30.0,
              ),
              tileColor: values[index].ticketColor,
              isThreeLine: true,
            ),
          ),
          Divider(
            height: 2.0,
          ),
        ],
      ),
    );
  }

  Future<bool> _showTicketDialog(context, TicketCardDTO myCard) async {
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text('View'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ticket Title : "),
                            Text("Client Site loc : "),
                            Text("Assigned to : "),
                            Text("Ticket Statues : "),
                            Text("Ticket Date : "),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myCard.ticketTitle.toUpperCase()),
                            Text(myCard.ticketLocation.toString()),
                            Text(myCard.ticketAssignedTo.toString()),
                            Text(myCard.ticketStatues.toString()),
                            Text(myCard.ticketDate.toString()),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              )
            ],
          ),
        );
      },
    );
  }
}
