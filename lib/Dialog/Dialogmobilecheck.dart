 import 'package:flutter/material.dart';

  showAlertDialogerrormobilecheck(BuildContext context) {
    AlertDialog alert = AlertDialog(
        //  title:
        content: Container(
      child: SingleChildScrollView(
              child: Column(
          children: [
            Center(
                child: Icon(
              Icons.error_outline,
              color: Color(0xffFF741A),
              size: 40,
            )),
            Center(
                child: Text(
              "Error",
              textScaleFactor: 1.5,
              style: TextStyle(color: Color(0xffFF741A)),
            )),
            SizedBox(height: 5),
            Text("Your mobile Already Register"),
            Text("Use another Mobile no"),
          ],
        ),
      ),
    ));
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }