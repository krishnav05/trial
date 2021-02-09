import 'package:Ajreeha/Drawer.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class SendUs extends StatefulWidget {
  @override
  _SendUsState createState() => _SendUsState();
}

class _SendUsState extends State<SendUs> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: Drawer(
          child: Drawers(),
        ),
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("SendUs",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2))),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [const Color(0xff042E6F), const Color(0xff00BAF2)],
          ))),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      child,
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        height: 30.0,
                        bottom: 1,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color:
                              connected ? Color(0xFFFFFF) : Color(0xFFEE4400),
                          child: connected
                              ? Row()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "OFFLINE",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                },
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // Text("Enter Mobile"),
                        TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Complain',
                          hintText: 'fault',
                          suffixIcon: IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: () {}),
                        )),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).hp(1),
                        ),
                        //Text("Password"),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                              hintText: 'shyed khan'),
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).hp(1),
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile Number',
                              hintText: '+96 9565834378'),
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).hp(1),
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'shyed77@hotmail.com'),
                        ),
                        SizedBox(height: ResponsiveFlutter.of(context).hp(1)),

                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 55.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                              labelText: 'Message(Max 50 words)',
                              hintText: 'shyed khan'),
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).hp(2),
                        ),
                        SizedBox(
                          width: _width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () => Navigator.pop(context),
                            // HomePage(),

                            color: Color(0xFF042E6F),
                            padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).wp(4),
                            ),
                            textColor: Colors.white,
                            child: Text(
                              AppLocalizations.of(context).translate(
                                'sendus',
                              ),
                              style: TextStyle(
                                  //fontSize: 18,
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
