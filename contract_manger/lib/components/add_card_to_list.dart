
import 'package:contract_manger/assets/constants.dart';
import 'package:contract_manger/assets/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCard {

  String contractTitle;
  String organisationName;

  Widget addNewCard({contractName,organisationName})
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              boxShadow:[ BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 10.0,
              ),],
          ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contractName,
                      style: kTitleText,
                    ),
                    Text(
                        '   $organisationName',
                        style: kSubTitleText,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${convertDateTimeToPrinting(startingDate)}  -  ${convertDateTimeToPrinting(endingDate)}',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child:
                 Container(
                  decoration: kDecorationBox,

                  child: (endingDate.difference(todayDate)> Duration(days: 3))
                   ?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(' Days Left',style: kTimeLeftText,),
                          Text('${endingDate.difference(todayDate).inDays}',style: kTimeLeftNumberText,),
                     ],
                    )
                   :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' Hour Left',style: kTimeLeftText,),
                        Text('${endingDate.difference(todayDate).inHours}',style: kTimeLeftNumberText,),
                      ],
                    )
                 )
              )
            ],
          ),
        ),
      ),
    );
  }

}