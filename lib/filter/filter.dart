import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class SimpleCustomAlert extends StatefulWidget {
  @override
  _SimpleCustomAlertState createState() => _SimpleCustomAlertState();
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  FocusNode focusNode = new FocusNode();
  TextEditingController modelcontoller = TextEditingController();
  TextEditingController factorycontoller = TextEditingController();
  TextEditingController typecontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black.withOpacity(0.80),
        body: Padding(
          padding: EdgeInsets.only(top: _height / 3, bottom: _height / 4.4),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(_width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        readOnly: true,
                        enableInteractiveSelection: false,
                        controller: modelcontoller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Model',
                            hintText: '2019',
                            suffixIcon: DropdownButtonHideUnderline(
                              child: Container(
                                width: _width / 2,
                                child: DropdownButton(
                                  //  value:modelcontoller.text,
                                  elevation: 0,
                                  isExpanded: false,
                                  items: <String>[
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                  ]
                                      .map((String val) =>
                                          DropdownMenuItem<String>(
                                            value: val,
                                            child: Center(child: Text(val)),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      modelcontoller.text = value;
                                    });
                                  },
                                ),
                              ),
                            )
                            // IconButton(
                            //     icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                            )),
                    SizedBox(
                      height: _width * 0.03,
                    ),
                    TextFormField(
                        readOnly: true,
                        enableInteractiveSelection: false,
                        controller: factorycontoller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Vehicale Factory',
                            hintText: 'Toyoto',
                            suffixIcon: DropdownButtonHideUnderline(
                              child: Container(
                                width: _width / 2,
                                child: DropdownButton(
                                  elevation: 0,
                                  items: <String>[
                                    'Toyoto',
                                    'BMW',
                                    'Audi',
                                    'Ferrai'
                                  ]
                                      .map((String val) =>
                                          DropdownMenuItem<String>(
                                            value: val,
                                            child: Center(child: Text(val)),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      factorycontoller.text = value;
                                    });
                                  },
                                ),
                              ),
                            )
                            //  IconButton(
                            //     icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                            )),
                    SizedBox(
                      height: _width * 0.03,
                    ),
                    TextFormField(
                        readOnly: true,
                        // focusNode: focusNode,
                        enableInteractiveSelection: false,
                        controller: typecontoller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Vehicale Type',
                            hintText: 'Camry',
                            suffixIcon: DropdownButtonHideUnderline(
                              child: Container(
                                width: _width / 2,
                                child: DropdownButton(
                                  elevation: 0,
                                  items: <String>[
                                    'Camry',
                                    'Camry',
                                    'Camry',
                                    'Camry '
                                  ]
                                      .map((String val) =>
                                          DropdownMenuItem<String>(
                                            value: val,
                                            child: Center(child: Text(val)),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      typecontoller.text = value;
                                    });
                                  },
                                ),
                              ),
                            )
                            //  IconButton(
                            //     icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                            )),
                    SizedBox(
                      height: _width * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: SizedBox(
                        width: _width * 1,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Color(0xFF042E6F),
                          textColor: Colors.white,
                          child: Text(
                            "Filter",
                            //AppLocalizations.of(context).translate(
                            //  'Filter',
                            //),
                            style: TextStyle(
                                //fontSize: 18,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
