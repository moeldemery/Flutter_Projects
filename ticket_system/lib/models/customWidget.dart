import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:getwidget/getwidget.dart';
import 'custom_widget_k.dart';


/*
* Version : 0.3.1
* Last Edit : demery
*
* */

class InputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData iconName;
  final TextEditingController controller;
  final bool readonly;

  const InputField({
    this.labelText,
    this.hintText,
    this.iconName = FontAwesomeIcons.tag ,
    @required this.controller,
    this.readonly = false,
  });
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (val) {
          //setState(() => email = val);
        },
        readOnly: widget.readonly,
        //style: kTextFormFieldTextS,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: Icon(
            widget.iconName,
            color: Colors.blue[800],
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class InputDigitField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData iconName;
  final TextEditingController controller;
  final bool readonly;

  const InputDigitField({
    this.labelText,
    this.hintText,
    this.iconName = FontAwesomeIcons.tag ,
    @required this.controller,
    this.readonly,
  });
  @override
  _InputDigitFieldState createState() => _InputDigitFieldState();
}

class _InputDigitFieldState extends State<InputDigitField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (val) {
          //setState(() => email = val);
        },
        keyboardType: TextInputType.number ,
        readOnly: widget.readonly,
        //style: kTextFormFieldTextS,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: Icon(
            widget.iconName,
            color: Colors.blue[800],
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
class SelectedDropDown {
  // SelectedDropDown(this.listDrop);
  String valueDrop;
  List<String> listDrop = [];
  String labelText;
}

class DropDownMenu extends StatefulWidget {
  final SelectedDropDown obj;
  final IconData iconName;
  final String labelText;

  DropDownMenu({this.obj , this.iconName , this.labelText });
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: widget.labelText,
            icon: Icon(
              widget.iconName,
              color: Colors.red[300],
            ),
          ),
          dropdownColor: Colors.white,
          value: widget.obj.valueDrop,
          icon: Icon(
            Icons.arrow_downward,
            color: Color(0xFFc5a097),
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            /**/ color: Color(0xFFc5a097),
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
          items: widget.obj.listDrop.map((val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: (val) {
            setState(
                  () {
                widget.obj.valueDrop = val;
              },
            );
          }
      ),
    );
  }
}

class InputDateField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData iconName;
  final TextEditingController controller;
  final TextEditingController controllerYears;

  InputDateField({this.labelText , this.hintText , this.iconName , this.controller , this.controllerYears});
  @override
  _InputDateFieldState createState() => _InputDateFieldState();
}

class _InputDateFieldState extends State<InputDateField> {

  DateTime _dateTime = DateTime.now();

  Future<Widget> _selectedDate(
      BuildContext context, TextEditingController controller,
      {TextEditingController controllerYear}) async {
    var _pickedDate = await showDatePicker(
        builder: (BuildContext context, Widget picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple[200],
                onPrimary: Colors.white,
                surface: Colors.red[300],
                onSurface: Colors.blueGrey,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker,
          );
        },
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));

    if (_pickedDate != null) {
      setState(
            () {
          _dateTime = _pickedDate;
          controller.text = DateFormat('dd-MM-yyyy').format(_pickedDate);

          _calculateYears(controller, controllerYear);
          // calculateMarriageYear();
        },
      );
    }
  }

  void _calculateYears(
      TextEditingController controller, TextEditingController calcYears) {
    var age;
    setState(() {
      if (controller != null) {
        age = DateTime.now().year - _dateTime.year;
        calcYears.text = age.toString();

        print(calcYears);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kInputFieldWidgetPadding,
      child: TextFormField(
        controller: widget.controller,
        onChanged: (val) {
          //setState(() => email = val);
        },
        onTap: () {
          _selectedDate(context, widget.controller, controllerYear: widget.controllerYears);
          // _selectedMDate(context);
        },
        readOnly: true,
        style: kTextFormFieldTextS,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: Icon(
            widget.iconName,
            //FontAwesomeIcons.user,
            color: Colors.red[300],
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class InputSearchField extends StatefulWidget {
  final SelectedDropDown obj;
  final IconData iconName;
  final String labelText;

  InputSearchField({this.obj , this.iconName , this.labelText});

  @override
  _InputSearchFieldState createState() => _InputSearchFieldState();
}

class _InputSearchFieldState extends State<InputSearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Icon(widget.iconName ,size: 20.0,) ,
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: GFSearchBar(
            searchBoxInputDecoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x4437474F),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              //labelText:widget.labelText,
              hintText: widget.obj.valueDrop??widget.labelText,
              suffix: GestureDetector(
                child: Icon(Icons.add , size: 30.0,),
              ),
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 20,
                top: 14,
                bottom: 14,
              ),
            ),
            searchList: widget.obj.listDrop,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                  item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListItemBuilder: (item) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            onItemSelected: (item) {
              setState(() {
                widget.obj.valueDrop=item;
                print('$item');
              });
            },
          ),
        ),
      ],
    );
  }
}

