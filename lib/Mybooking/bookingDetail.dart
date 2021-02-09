import 'package:Ajreeha/localization/App_localization.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Bookingdetail extends StatefulWidget {
  @override
  _BookingdetailState createState() => _BookingdetailState();
}

class _BookingdetailState extends State<Bookingdetail> {
  bool selected = false;
  ScrollController _scrollController;
  Color _theme;
  bool showtext = false;

  @override
  void initState() {
    super.initState();
    _theme = Colors.black;

    _scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded) {
          if (_theme != Colors.white) {
            setState(() {
              showtext = true;
              _theme = Colors.white;
              print('setState is called with white');
            });
          }
        } else {
          if (_theme != Colors.black) {
            setState(() {
              showtext = false;
              _theme = Colors.black;
              print('setState is called with black');
            });
          }
        }
      });
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (150 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          actions: <Widget>[
            showtext
                ? IconButton(
                    icon: Icon(
                      Icons.search,
                      color: _theme, // Here
                    ),
                    onPressed: () {},
                  )
                : SizedBox.shrink()
          ],
          expandedHeight: ResponsiveFlutter.of(context).hp(15),
          floating: false,
          pinned: true,
          toolbarHeight: 40,
          flexibleSpace: FlexibleSpaceBar(
            title: showtext
                ? SafeArea(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 2),
                    child: Text('Booking detail'),
                  ))
                : Text(''),
            background: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [const Color(0xff042E6F), const Color(0xff00BAF2)],
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 65, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Text('Range Rover - White ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFA53E),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFA53E),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFA53E),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFA53E),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFA53E),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ];
    }, body: Builder(
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
            child: Padding(
                padding: EdgeInsets.only(
                    left: _width * 0.030, right: _width * 0.030, top: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color(0xff9BE8FF), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListView(
                      padding: EdgeInsets.all(0.0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 0.263 * _height,
                            width: double.infinity,
                            child: FittedBox(
                              child: Image.asset('assets/images/bigcar.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.01 * _height,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'car_name',
                                    ),
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.84),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'sar',
                                    ),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Tajawal',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'Booking from',
                                    ),
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.84),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'date',
                                    ),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'Booking upto',
                                    ),
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.84),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).translate(
                                      'date',
                                    ),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Request received',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Request accepted',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Car did not received, booking cancelled',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Vehicle condition confirmed by the customer',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Authorization to drive a vehicle',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    "Return the car",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    'Vehicle condition confirmed by the owner',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  subtitle: Text("23 / 11 / 20 - 08 : 00"),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircularCheckBox(
                                      value: this.selected,
                                      checkColor: Colors.white,
                                      activeColor: Color(0xffFF741A),
                                      inactiveColor: Color(0xffFF741A),
                                      disabledColor: Colors.grey,
                                      onChanged: (val) => this.setState(() {
                                            this.selected = !this.selected;
                                          })),
                                  title: Text(
                                    AppLocalizations.of(context).translate(
                                      'cd_valid_license',
                                    ),
                                    style: TextStyle(
                                        color: Color(0xffFF741A),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  onTap: () => this.setState(() {
                                    this.selected = !this.selected;
                                  }),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: RaisedButton(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate(
                                            'cancal_reason',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Tajawal',
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          icon: new Icon(Icons.arrow_drop_down),
                                          color: Colors.black,
                                          onPressed: () {
                                            _showDialog(context);
                                          })
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  onPressed: () {
                                    _showDialog(context);
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 0.015 * _height,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: SizedBox(
                                  width: 3 * _width,
                                  height: 0.055 * _height,
                                  child: RaisedButton(
                                    child: Text(
                                      AppLocalizations.of(context).translate(
                                        'cancal',
                                      ),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    onPressed: () => {
                                      Navigator.pop(
                                        context,
                                      )
                                    },
                                    color: Colors.grey,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.035 * _height,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))));
      },
    )));
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context).translate(
              'cancal_reason',
            ),
          ),
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
}
