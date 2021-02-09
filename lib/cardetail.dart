import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'localization/App_localization.dart';
import 'package:Ajreeha/login/loginui.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:Ajreeha/imageCoursel/detailpagecoursel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'booking.dart';
// ignore: camel_case_types
class vehicleDetails extends StatefulWidget {
  @override
  _vehicleDetailsState createState() => _vehicleDetailsState();
}

// ignore: camel_case_types
class _vehicleDetailsState extends State<vehicleDetails> {
  bool selected = false;
  ScrollController _scrollController;
  Color _theme;
  bool showtext = false;


SharedPreferences prefs;
String token;
getValue() async {
  prefs = await SharedPreferences.getInstance();
  //Return String
  token = prefs.getString('value_key');
  return token;
}






  @override
  void initState() {
    super.initState();
    getValue();
    getCurrentLocation();
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
    super.initState();
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (150 - kToolbarHeight);
  }

  GoogleMapController _controller;
  Position position;
  Widget _child;

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("Home"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: "Home"))
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          // controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                      child: Text('Vehicles'),
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
                                  fontSize: 18,
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
                      height: 32.0,
                      bottom: 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: connected ? Color(0xFFFFF) : Color(0xFFEE4400),
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
                      border: Border.all(color: Color(0xff9BE8FF), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListView(
                    padding: EdgeInsets.all(0.0),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: DetailCoursel(),
                        ),
                      ),
                      SizedBox(
                        height: 0.044 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '600 SAR',
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.84),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppLocalizations.of(context).translate(
                                'mileage',
                              ),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal',
                                  color: Colors.black),
                            ),
                            // Text(
                            //   'Mileage 123',
                            //   textScaleFactor: 1.2,
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold),
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.014 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          AppLocalizations.of(context).translate(
                            'cd_200km',
                          ),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Tajawal',
                              color: Colors.grey),
                        ),
                        //  Text(
                        //   'cd_200km',
                        //   textScaleFactor: 1.2,
                        //   style: TextStyle(
                        //       color: Colors.black.withOpacity(0.50),
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 10),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          color: Color(0xFF707070),
                        ),
                      ),
                      SizedBox(
                        height: 0.014 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          AppLocalizations.of(context).translate(
                            'Insurance',
                          ),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Tajawal'),
                        ),
                        //  Text(
                        //   'Insurance expired date 11 - 11 - 2021',
                        //   textScaleFactor: 1.2,
                        //   style: TextStyle(
                        //       color: Colors.black.withOpacity(0.54),
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 14),
                        // ),
                      ),
                      SizedBox(
                        height: 0.038 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: _height / 4,
                          child: _child,

                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(5))),
                          // height: 0.114 * _height,
                          // width: double.infinity,
                          // child: FittedBox(
                          //   child: Image.asset('assets/images/map.png'),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 0.037 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          AppLocalizations.of(context).translate(
                            'Map_text',
                          ),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Tajawal'),
                        ),
                        // Text(
                        //   'Lexus LS car specifications, clean, new and appropriate for private parties, enjoy driving and spending nice time.',
                        //   textScaleFactor: 1.2,
                        //   style: TextStyle(
                        //       color: Colors.black.withOpacity(0.54),
                        //       fontSize: 12),
                        // ),
                      ),
                      SizedBox(
                        height: 0.015 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate(
                                'cd_booking_date',
                              ),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Tajawal'),
                            ),
                            // Text(
                            //   'cd_booking_date',
                            //   textScaleFactor: 1.2,
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 16),
                            // ),
                            Spacer(),
                            Container(
                              width: 0.133 * _width,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  hintText: "",
                                  counterText: "",
                                ),
                                maxLength: 4,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context).translate(
                                'cd_sar',
                              ),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Tajawal'),
                            ),

                            // Text(
                            //   'cd_sar',
                            //   textScaleFactor: 1.2,
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 18),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.015 * _height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0.030 * _height,
                                    left: 0.045 * _width,
                                    bottom: 0.030 * _height,
                                    right: 0.045 * _width),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).translate(
                                        'cd_date_time',
                                      ),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Tajawal'),
                                    ),
                                    // Text(
                                    //   'cd_date_time',
                                    //   textScaleFactor: 1.2,
                                    //   style: TextStyle(
                                    //       color: Colors.black.withOpacity(0.35),
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w600),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)
                                              .translate(
                                            'cd_choose_date_time',
                                          ),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Tajawal'),
                                        ),
                                        // Text(
                                        //   'cd_choose_date_time',
                                        //   textScaleFactor: 1.2,
                                        //   style: TextStyle(
                                        //       color: Colors.black
                                        //           .withOpacity(0.75),
                                        //       fontWeight: FontWeight.bold,
                                        //       fontSize: 18),
                                        // ),
                                        Image.asset(
                                          'assets/images/ic-calendar.png',
                                          width: 20,
                                          height: 20,
                                          color: Color(0xFF00BAF2),
                                        )
                                      ],
                                    )
                                  ],
                                ))),
                      ),
                      SizedBox(
                        height: 0.035 * _height,
                      ),
                      ListTile(
                        leading: CircularCheckBox(
                            value: this.selected,
                            checkColor: Colors.white,
                            activeColor: Color(0xffFF741A),
                            inactiveColor: Color(0xffFF741A),
                            disabledColor: Colors.red,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: 
                        //selected? 
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () =>token==""? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginUi(),
                            ),
                          ): Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Booking(),
                            ),
                          ),
                          color: Color(0xFF042E6F),
                          padding: EdgeInsets.all(16.0),
                          textColor: Colors.white,
                          child: Text(
                            AppLocalizations.of(context).translate(
                              'cd_book_now',
                            ),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal'),
                          ),
                          // Text("cd_book_now",
                          //     textScaleFactor: 1.2,
                          //     style: TextStyle(
                          //         fontSize: 18, fontWeight: FontWeight.bold)),
                        )
                        // : 
                        // showAlertDialogtermcheck(context),
                      ),
                      SizedBox(
                        height: 0.035 * _height,
                      ),
                    ],
                  ),
                ),
              ));
        },
      )),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
   showAlertDialogtermcheck(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SuccessFull"),
      content: Text("Have a Good Day"),
      actions: [
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
