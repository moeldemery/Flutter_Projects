import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TicketCardDTO {


  String ticketTitle;
  Color ticketColor;
  IconData ticketIcon;
  String ticketLocation;
  String ticketAssignedTo;
  String ticketDate;
  String ticketStatues;
  String imageUrl;


  TicketCardDTO({this.ticketTitle = '',
    this.ticketColor = Colors.lime,
    this.ticketIcon,
    this.ticketLocation = '',
    this.ticketAssignedTo = '',
    this.ticketDate = '',
    this.ticketStatues = '',
    this.imageUrl});

// factory PlaceADDTO.fromJson(Map<String, dynamic> json) {
//   return PlaceADDTO(
//       id: json['id'],
//       name: json['name']
//   );
//}
 }
