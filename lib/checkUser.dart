import 'dart:async';
import 'package:Ajreeha/Firsthome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ajreeha/onboarding.dart';
import 'package:after_layout/after_layout.dart';

// import 'package:location/location.dart';
class Check extends StatefulWidget {
  @override
  CheckState createState() => new CheckState();
}

class CheckState extends State<Check> with AfterLayoutMixin<Check> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => FirstHome()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => OnBoardingPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    // return
    return Container();
  }
}
