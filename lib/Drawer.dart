import 'dart:convert';
import 'package:Ajreeha/Drawer%20screen/myrent.dart';
import 'package:Ajreeha/Drawer%20screen/myvehicles.dart';
import 'package:Ajreeha/Drawer%20screen/sendus.dart';
import 'package:Ajreeha/Firsthome.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:Ajreeha/login/loginui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Drawer screen/mybooking.dart';
import 'localization/AppLanguage.dart';

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  bool tokencheck = false;
  String tokenchec;
  SharedPreferences prefs;

  getStringValuesSF() async {
    prefs = await SharedPreferences.getInstance();
    //Return String
print(tokenchec);
    tokenchec = prefs.getString('value_key');

    if (tokenchec == "") {
      print("null" + tokenchec);
      setState(() {
        tokencheck = false;
      });
    } else {
      print("else" + tokenchec);
      setState(() {
        tokencheck = true;
      });
    }

    print("drawer" + tokenchec);
  }

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 0.082 * MediaQuery.of(context).size.height +
              MediaQuery.of(context).padding.top,
          child: DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 0.04 * MediaQuery.of(context).size.width,
                ),
                tokencheck
                    ? Text(
                        AppLocalizations.of(context).translate(
                          'cname',
                        ),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).wp(6),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: Colors.white),
                      )
                    : FlatButton(
                        onPressed: () {
                          //    Navigator.push(
                          // context,
                          // MaterialPageRoute(builder: (context) => LoginUi()),

                          //  );
                        },
                        child: Text(
                          "Login / Signup",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          ),
                        ),
                      )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF042E6F), Color(0xFF00BAF2)]),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home_outlined,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_home',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstHome()),
            );
          },
        ),
        ListTile(
          leading: Icon(
            Icons.list,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_booking',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            Navigator.pop(context);

            tokencheck
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBooking()),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUi()),
                  );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MyBooking()),
            // );
          },

          //Text('drawer_booking',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        ListTile(
          leading: Icon(
            Icons.directions_car_outlined,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_vehicles',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            Navigator.pop(context);

            tokencheck
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyVehicles()),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUi()),
                  );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MyVehicles()),
            // );
          },

          //Text('drawer_vehicles',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        ListTile(
          leading: Icon(
            Icons.attach_money_sharp,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_rent',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            Navigator.pop(context);

            tokencheck
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyRent()),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUi()),
                  );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MyRent()),
            // );
          },
        ),
        // Text('drawer_rent',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),

        ListTile(
          leading: Icon(
            Icons.info_outline,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_about',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Filter()),
            // );
          },
          // Text('drawer_about',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        ListTile(
          leading: Icon(
            Icons.mail_outline,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_send',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          onTap: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SendUs()),
            );
          },

          //Text('drawer_send',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xFF00BAF2),
            ),
            title: tokencheck
                ? InkWell(
                    child: Text(AppLocalizations.of(context)
                        .translate('drawer_sign_out')),
                    onTap: () {
                      http.get('https://ajerrha.com/api/sanctum/logout',
                          headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + tokenchec,
                          }).then((response) {
                        var tokenchange = jsonDecode(response.body);
                        print("check" + tokenchange);
                        if (tokenchange == "true") {
                          setState(() {
                            getStringValuesSF();
                            prefs.setString('value_key', "");
                            tokencheck = false;
                          });
                          //  setState(() {
                          //   getStringValuesSF();
                          //   prefs.setString('otpverify', "");
                            
                          // });
                        }
                        Navigator.pop(context);
                      });
                    })
                : InkWell(
                    child: Text(AppLocalizations.of(context)
                        .translate('drawer_sign_in')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginUi()),
                      );
                    },
                  )),

        ListTile(
            leading: Icon(
              Icons.language_outlined,
              color: Color(0xFF00BAF2),
            ),
            title: Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                  child: MaterialButton(
                      color: Color(0xff00BAF2),
                      child: Text(
                        AppLocalizations.of(context).translate(
                          'English',
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: Colors.white),
                      ),

                      // Text('EN'),textColor:Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        appLanguage.changeLanguage(Locale("en"));
                      }
                      // AppLang
                      ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 65,
                  child: MaterialButton(
                    color: Color(0xff00BAF2),
                    child: Text(
                      AppLocalizations.of(context).translate(
                        'Arabic',
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Tajawal',
                          color: Colors.white),
                    ),
                    //Text('AR'),textColor:Colors.white ,
                    onPressed: () {
                      Navigator.pop(context);
                      appLanguage.changeLanguage(Locale("ar"));
                    },
                  ),
                ),
              ],
            )
            //  Text(AppLocalizations.of(context).translate('drawer_language',),
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'Tajawal'),
            //   ),
            // //Text('drawer_language',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
            // onTap: () {
            //   setState(() {
            //     index = 7;
            //   });
            //   // Update the state of the app
            //   // ...
            //   // Then close the drawer
            //   Navigator.pop(context);
            // },
            ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_settings',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          //Text('drawer_settings',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
        ListTile(
          leading: Icon(
            Icons.help_outline,
            color: Color(0xFF00BAF2),
          ),
          title: Text(
            AppLocalizations.of(context).translate(
              'drawer_help',
            ),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          //  Text('drawer_help',textScaleFactor: 1.2,style: TextStyle(color: Colors.black.withOpacity(0.84),fontSize: 14,fontWeight: FontWeight.w600),),
        ),
      ],
    );
  }
}
