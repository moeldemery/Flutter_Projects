import 'package:contract_manger/components/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contract_manger/assets/globals.dart';
import 'package:contract_manger/components/select_date.dart';

class NewContract extends StatefulWidget {
  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  SelectDate selectDateObj = SelectDate();
  bool _validateContractName = false;
  bool _validateOrganisationName = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contract'),
      ),
      body: ListView(
        children:
        [ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidate: _validateContractName,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Contract name cannot be empty.';
                    } else {
                      isContactNameEmpty = false;
                      return null;
                    }
                  },
                  onTap: () {
                    setState(() => _validateContractName = true);
                  },
                  readOnly: false,
                  controller: contractTitleController,
                  onSaved: (val) {
                    setState(() {
                      contractTitleController.text = val;
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'name',
                    labelText: 'Contract Title',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidate: _validateOrganisationName,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Organization name cannot be empty.';
                    } else {
                      isOrganizationNameEmpty = false;
                      return null;
                    }
                  },
                  readOnly: false,
                  controller: organisationNameController,
                  onTap: () {
                    setState(() => _validateOrganisationName = true);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_balance),
                    hintText: 'name',
                    labelText: 'Organization Name',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerStartingDate,
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      selectDateObj.selectDate(
                          context, DateTypeEnum.startingDateE);
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range),
                    hintText: convertDateTimeToPrinting(startingDate),
                    labelText: 'Starting Date',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerEndingDate,
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      selectDateObj.selectDate(context, DateTypeEnum.endingDateE);
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range),
                    hintText: convertDateTimeToPrinting(endingDate),
                    labelText: 'Ending Date',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerNotificationTime,
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      selectDateObj.selectTime(context, DateTypeEnum.endingDateE);
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.access_alarm),
                    hintText: convertDateTimeToPrinting(endingDate),
                    labelText: 'Notification Time',
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SubmitButton(),
            ],
          ),
        ),]
      ),
    );
  }
}
