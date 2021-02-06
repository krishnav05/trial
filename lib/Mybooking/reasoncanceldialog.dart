// Show Dialog function

  import 'package:flutter/material.dart';

// ignore: unused_element
void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text('I am Title'),
          content: Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(' First Item'),
                    ),
                  ],
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(' Second Item'),
                    ),
                  ],
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text('Third Item'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }