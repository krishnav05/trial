import 'package:Ajreeha/Drawer.dart';
import 'package:Ajreeha/Takelocation.dart';
import 'package:Ajreeha/carcards.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:Ajreeha/filter/filter.dart';
import 'package:Ajreeha/location/locationUi.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstHome extends StatefulWidget {
  
  @override
  _FirstHomeState createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {


  @override
  final df = new DateFormat('dd-MM-yyyy');
  DateTime _currentdate = DateTime.now();
  Future<Null> _datechange(BuildContext context) async {
    final DateTime _datechange = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: _currentdate,
        lastDate: DateTime(3000));

    if (_datechange != null) {
      setState(() {
        _currentdate = _datechange;
      });
    }
    else{
      setState(() {
        _currentdate=_currentdate;
      });
    }
  }

  DateTime _currentdate2 = DateTime.now();

  Future<Null> _datechange2(BuildContext context) async {
    final DateTime _datechange2 = await showDatePicker(
        context: context,
        initialDate: _currentdate2,
        firstDate: _currentdate2,
        lastDate: DateTime(3000));

    if (_datechange != null) {
      setState(() {
        _currentdate2 = _datechange2;
      });
    }
     else{
      setState(() {
        _currentdate2=_currentdate2;
      });
    }
  }

  ScrollController _scrollController;
  Color _theme;
  bool showtext = false;

  @override
  void initState() {
    super.initState();
    _theme = Colors.black;
  //getBoolValuesSF();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded) {
          if (_theme != Colors.white) {
            setState(() {
              showtext = true;
              _theme = Colors.white;
            });
          }
        } else {
          if (_theme != Colors.black) {
            setState(() {
              showtext = false;
              _theme = Colors.black;
            });
          }
        }
      });
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }
//   bool boolValues ;
// getBoolValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return bool
//  bool boolValue = prefs.getBool('loccheck');
// setState(() {
//   boolValues = boolValue;
// });
//   //return boolValue;
// }


  @override
  Widget build(BuildContext context) {
    String _formatdate1 = df.format(_currentdate);
    String _formatdate2 = df.format(_currentdate2);

    return Scaffold(
      drawer: Drawer(
        child: Drawers(),
      ),
      body: NestedScrollView(
          controller: _scrollController,
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
                          onPressed: () {
                            _scrollController.jumpTo(0);
                          })
                      : SizedBox.shrink(),
                ],
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                toolbarHeight: 40,
                flexibleSpace: FlexibleSpaceBar(
                  title: showtext
                      ? SafeArea(
                          child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('Vehicles'),
                        ))
                      : Text(''),
                  background: Container(
//
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 0.0),
                      colors: [
                        const Color(0xff042E6F),
                        const Color(0xff00BAF2)
                      ],
                    )),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 16, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black),
                                    decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: new BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      hintText: "Search",
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.search,
                                        ),
                                        color: Colors.grey[800],
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icon_svg/filter_list-24px.svg",
                                      color: Colors.white,
                                    ),
                                    onPressed: () => Navigator.of(context).push(
                                        PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder:
                                                (BuildContext context, _, __) =>
                                                    SimpleCustomAlert())
                                                    ,),),

                                //Navigator.push(context, MaterialPageRoute(builder:(context)=>SimpleCustomAlert(),),),)
                              ),
                              // ),
                              Flexible(
                                flex: 2,
                                child: IconButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LocationUi())),
                                  icon: Icon(Icons.place,
                                      size: 23, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 0,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('For'),
                                    style: GoogleFonts.tajawal(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                               Flexible(
                                flex: 2,
                                child: InkWell(
                                child: Icon(Icons.date_range,color: Colors.white,),
                                onTap:(){
                                 _datechange(context);
                                } ,
                                
                                ),),
                              Flexible(
                                flex: 5,
                                child: GestureDetector(
                                    child: Text(
                                      ' $_formatdate1',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      _datechange(context);
                                    }),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Flexible(
                                  flex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('To'),
                                      style: GoogleFonts.tajawal(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  )),
                              Flexible(
                                flex: 2,
                                child: InkWell(
                                child: Icon(Icons.date_range,color: Colors.white,),
                                onTap:(){
                                  _datechange2(context);
                                } ,
                                
                                ),),
                              Flexible(
                                flex: 5,
                                child: 
                                GestureDetector(
                                  child: Text(
                                    ' $_formatdate2',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    _datechange2(context);
                                  },
                                ),
                              ),
                              
                            ],
                            
                          ),
                          
                        ],
                        
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
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
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                  //  child: boolValues ? Carinfo():Takelocation(),
                  child:Carinfo(),
                  ),
                ),
              );
            },
          )),
    );
  }
}
