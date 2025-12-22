/**
 *
 * import 'dart:ffi';

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:font_awesome_flutter/font_awesome_flutter.dart';
    import 'package:gyna/odoo/itemsDTO.dart';
    import 'package:intl/intl.dart';
    import 'package:getwidget/getwidget.dart';
    import 'custom_widget_k.dart';

    /*
 * Version : 0.5.1
 * Last Edit : demery
 *
 * */

    //---------------------------------------------------------------------
    ///                         InputField
    //---------------------------------------------------------------------
    class InputField extends StatefulWidget {
    final String labelText;
    final String hintText;
    final IconData iconName;
    final TextEditingController controller;
    final bool readonly;
    final bool isButton;
    final VoidCallback onTap;

    const InputField({
    this.labelText,
    this.hintText,
    this.iconName,
    @required this.controller,
    this.readonly = false,
    this.isButton = false,
    this.onTap,
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
    icon: (widget.isButton)
    ? GestureDetector(
    child: Icon(Icons.cancel),
    onTap: () => widget.onTap(),
    )
    : Icon(
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

    //---------------------------------------------------------------------
    ///                         InputDigitField
    //---------------------------------------------------------------------
    class InputDigitField extends StatefulWidget {
    final String labelText;
    final String hintText;
    final IconData iconName;
    final TextEditingController controller;
    final bool readonly;

    const InputDigitField({
    this.labelText,
    this.hintText,
    this.iconName = FontAwesomeIcons.tag,
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
    keyboardType: TextInputType.number,
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

    //---------------------------------------------------------------------
    ///                         InputDateField
    //---------------------------------------------------------------------

    class InputDateField extends StatefulWidget {
    final String labelText;
    final String hintText;
    final IconData iconName;
    final TextEditingController controller;
    final TextEditingController controllerYears;

    InputDateField(
    {this.labelText, this.hintText, this.iconName, this.controller, this.controllerYears});
    @override
    _InputDateFieldState createState() => _InputDateFieldState();
    }

    class _InputDateFieldState extends State<InputDateField> {
    DateTime _dateTime = DateTime.now();

    Future<Widget> _selectedDate(BuildContext context, TextEditingController controller,
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
    controller.text = DateFormat('MM/dd/yyyy').format(_pickedDate);

    _calculateYears(controller, controllerYear);
    // calculateMarriageYear();
    },
    );
    }
    }

    void _calculateYears(TextEditingController controller, TextEditingController calcYears) {
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

    //---------------------------------------------------------------------
    ///                         SelectedDropDown
    //---------------------------------------------------------------------
    class SelectedDropDown {
    // SelectedDropDown(this.listDrop);
    String valueDrop;
    List<String> listDrop = [];
    String labelText;
    }

    //---------------------------------------------------------------------
    ///                         InputDropDownMenu
    //---------------------------------------------------------------------
    class InputDropDownMenu extends StatefulWidget {
    final SelectedDropDown obj;
    final IconData iconName;
    final String labelText;

    InputDropDownMenu({this.obj, this.iconName, this.labelText});

    @override
    _InputDropDownMenuState createState() => _InputDropDownMenuState();
    }

    class _InputDropDownMenuState extends State<InputDropDownMenu> {
    @override
    Widget build(BuildContext context) {
    return Padding(
    padding: kInputFieldWidgetPadding,
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
    }),
    );
    }
    }

    //---------------------------------------------------------------------
    ///                         SelectedSearchField
    //---------------------------------------------------------------------
    class SelectedSearchField {
    // SelectedDropDown(this.listDrop);
    ItemsDTO valueDrop = new ItemsDTO();
    //List<String> listDrop = [];
    //List<String> listIdDrop = [];
    List<ItemsDTO> listItems = [];
    List<String> selectedItemIdName = [];

    //TextEditingController controllerLabelText = new TextEditingController();
    }

    //---------------------------------------------------------------------
    ///                         InputSearchField
    //---------------------------------------------------------------------
    class InputSearchField extends StatefulWidget {
    final SelectedSearchField obj;
    final IconData iconName;
    final String labelText;
    final Widget addWidget;
    final bool isButton;
    final VoidCallback onTap;
    InputSearchField(
    {this.obj, this.iconName, this.labelText, this.addWidget, this.isButton = false, this.onTap});

    @override
    _InputSearchFieldState createState() => _InputSearchFieldState();
    }

    class _InputSearchFieldState extends State<InputSearchField> {
    @override
    Widget build(BuildContext context) {
    return Container(
    //width: MediaQuery.of(context).size.width,

    child: GFSearchBar(

    //controller: widget.obj.valueDrop.controllerItemName,
    searchBoxInputDecoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    icon: (widget.isButton)
    ? GestureDetector(
    child: Icon(Icons.cancel),
    onTap: () => widget.onTap(),
    )
    : Icon(
    widget.iconName,
    color: Colors.blue[800],
    ),
    hintText: widget.labelText,
    labelText: (widget.obj.valueDrop.controllerItemName.text != '')
    ? widget.obj.valueDrop.controllerItemName.text
    : widget.labelText,
    focusedBorder: OutlineInputBorder(),
    suffixIcon: const Icon(Icons.search),
    suffix: GestureDetector(
    child: Icon(
    Icons.add,
    size: 30.0,
    ),
    onTap: () {
    showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
    // return alert dialog object
    return widget.addWidget;
    },
    );
    },
    ),
    ),
    // InputDecoration(
    //   enabledBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: Color(0x4437474F),
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: Theme.of(context).primaryColor,
    //     ),
    //   ),
    //   prefixIcon: widget.iconName != null
    //       ? Icon(widget.iconName ,size: 20.0,)
    //       : SizedBox.shrink() ,
    //   suffixIcon: const Icon(Icons.search),
    //   border: InputBorder.none,
    //   labelText:widget.obj.valueDrop.controllerHusbandName.text,
    //   hintText: widget.labelText,
    //
    //   contentPadding: const EdgeInsets.only(
    //     left: 16,
    //     right: 20,
    //     top: 14,
    //     bottom: 14,
    //   ),
    // ),
    searchList: widget.obj.listItems,
    searchQueryBuilder: (query, List<ItemsDTO> list) {
    return list
    .where((item) =>
    item.controllerItemName.text.toLowerCase().contains(query.toLowerCase()))
    .toList();
    },
    overlaySearchListItemBuilder: (item) {
    return Container(
    //padding: const EdgeInsets.all(8),
    child: Text(
    item.controllerItemName.text,
    style: const TextStyle(fontSize: 18),
    ),
    );
    },
    onItemSelected: (ItemsDTO item) {
    setState(() {
    //widget.obj.valueDrop = item;
    widget.obj.valueDrop.controllerItemName.text = item.controllerItemName.text;
    print('${item.controllerItemName.text}');
    print('${widget.obj.valueDrop.controllerItemName.text}');

    //creating list [id , name]  ex = [110 , ahmed]
    widget.obj.selectedItemIdName.add(item.id.toString());
    widget.obj.selectedItemIdName.add(item.controllerItemName.text);
    print(widget.obj.selectedItemIdName.toString());
    });
    },
    ),
    );
    }
    }

    //---------------------------------------------------------------------
    ///                         InputListField
    //---------------------------------------------------------------------
    class InputListField extends StatefulWidget {
    final List<TextEditingController> controllers;
    final String labelText;
    final String hintText;
    InputListField({@required this.controllers, @required this.labelText, this.hintText});

    @override
    _InputListFieldState createState() => _InputListFieldState();
    }

    class _InputListFieldState extends State<InputListField> {
    void removeWidget(int index) {
    setState(() {
    print(index);
    widget.controllers.removeAt(index);
    });
    }

    @override
    void initState() {
    super.initState();
    //widget.controllers.add(new TextEditingController(text: "add new text "));
    }

    @override
    Widget build(BuildContext context) {
    return FrameBorder(
    border: Border.all(color: Colors.black),
    inWidget: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    widget.labelText,
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),
    ),
    FlatButton(
    height: 20,
    onPressed: () {
    widget.controllers.add(new TextEditingController(text: ""));
    setState(() {});
    },
    child: Text('add line')),
    ],
    ),
    ConstrainedBox(
    constraints: new BoxConstraints(
    minHeight: 35.0,
    maxHeight: 200.0,
    ),
    // height: 200.0,
    child: ListView.builder(
    shrinkWrap: true,
    itemCount: widget.controllers.length,
    itemBuilder: (context, index) {
    // _controllers.add(new TextEditingController());
    return InputField(
    readonly: false,
    isButton: true,
    controller: widget.controllers[index],
    hintText: widget.hintText ?? 'add new line',
    onTap: () => removeWidget(index),
    );
    }),
    ),
    ],
    ),
    );
    }
    }

    //---------------------------------------------------------------------
    ///                         InputSearchListField
    //---------------------------------------------------------------------
    class InputSearchListField extends StatefulWidget {
    final List<SelectedSearchField> controllers;
    final String labelText;
    final String hintText;
    final List<ItemsDTO> searchableList;
    InputSearchListField(
    {@required this.controllers, this.labelText, this.hintText, @required this.searchableList});

    @override
    _InputSearchListFieldState createState() => _InputSearchListFieldState();
    }

    class _InputSearchListFieldState extends State<InputSearchListField> {
    void removeWidget(int index) {
    setState(() {
    print(index);
    widget.controllers.removeAt(index);
    });
    }

    void addWidget() {
    setState(() {
    SelectedSearchField newSearch = new SelectedSearchField();
    newSearch.listItems.addAll(widget.searchableList);
    widget.controllers.add(newSearch);
    });
    }

    @override
    void initState() {
    super.initState();
    //widget.controllers.add(new TextEditingController(text: "add new text "));
    }

    @override
    Widget build(BuildContext context) {
    return FrameBorder(
    border: Border.all(color: Colors.black),
    inWidget: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    widget.labelText ?? '',
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),
    ),
    FlatButton(
    height: 20,
    onPressed: () {
    // widget.controllers.add(new SelectedSearchField());
    addWidget();
    setState(() {});
    },
    child: Text('add line')),
    ],
    ),
    ConstrainedBox(
    constraints: new BoxConstraints(
    minHeight: 35.0,
    maxHeight: 300.0,
    ),
    // height: 200.0,
    child: ListView.builder(
    shrinkWrap: true,
    itemCount: widget.controllers.length,
    itemBuilder: (context, index) {
    // _controllers.add(new TextEditingController());
    return InputSearchField(
    // readonly: false,
    isButton: true,
    onTap: () => removeWidget(index),
    obj: widget.controllers[index],
    labelText: widget.hintText ?? 'add new line',

    // hintText: widget.hintText ??'add new line',
    // onTap: ()=> removeWidget(index),
    );
    }),
    ),
    ],
    ),
    );
    }
    }

    //---------------------------------------------------------------------
    ///                         FrameBorder
    //---------------------------------------------------------------------
    class FrameBorder extends StatelessWidget {
    final BoxBorder border;
    final Widget inWidget;
    FrameBorder({@required this.border, this.inWidget});

    @override
    Widget build(BuildContext context) {
    return Stack(children: <Widget>[
    Container(
    width: double.infinity,
    // height: 200,
    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
    padding: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
    border: border,
    borderRadius: BorderRadius.circular(5),
    shape: BoxShape.rectangle,
    ),
    child: inWidget,
    ),
    ]);
    }
    }

 * */