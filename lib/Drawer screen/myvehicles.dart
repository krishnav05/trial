import 'package:Ajreeha/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Ajreeha/MyVehicle/MyVehiclecards.dart';
import 'package:Ajreeha/MyVehicle/Vehicleinfo.dart';
import 'package:flutter_offline/flutter_offline.dart';

class MyVehicles extends StatefulWidget {
  @override
  _MyVehiclesState createState() => _MyVehiclesState();
}

class _MyVehiclesState extends State<MyVehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Vehicale"),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [const Color(0xff042E6F), const Color(0xff00BAF2)],
          ))),
        ),
        drawer: Drawer(
          child: Drawers(),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
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
                        color: connected ? Color(0xFFFFFF) : Color(0xFFEE4400),
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
              child: Myvehiclecards(),
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(
          heroTag: "btn3",
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: new Color(0xFFFF741A),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vehicleform()),
          ),
        ));
  }
}
