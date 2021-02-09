import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:Ajreeha/login/userform.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ajreeha/Firsthome.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  var token = '';
  bool isLogin = false;
  bool validate = false;
  final form = new GlobalKey<FormState>();
  final TextEditingController mobilecontoller = TextEditingController();
  final TextEditingController passwordcontoller = TextEditingController();
  final TextEditingController controller = TextEditingController();

// static final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
// Map<String, dynamic> _deviceData = <String, dynamic>{};

// @override
// void initState() {
// super.initState();
// initPlatformState();
// }

// Future<Null> initPlatformState() async {
// Map<String, dynamic> deviceData;

// try {
// if (Platform.isAndroid) {
// deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
// } else if (Platform.isIOS) {
// deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
// }
// } on PlatformException {
// deviceData = <String, dynamic>{
// 'Error:': 'Failed to get platform version.'
// };
// }

// if (!mounted) return;

// setState(() {
// _deviceData = deviceData;
// });
// }

// Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
// return <String, dynamic>{
// 'manufacturer': build.manufacturer,
// 'model': build.model,
// };
// }

// Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
// return <String, dynamic>{
// 'model': data.name,
// };
// }

  bool _obscureText = true;

  String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String initialCountry = 'SA';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  var mobile_no = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login",
            style:
                TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2))),
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
            child: Center(
              child: Form(
                key: form,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 30, left: 20, right: 20, bottom: 10),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: InternationalPhoneNumberInput(
                          inputBorder: InputBorder.none,
                          spaceBetweenSelectorAndTextField: 0,
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            setState(() {
                              mobile_no = number.phoneNumber;
                            });
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: mobilecontoller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 0, left: 20, right: 20),
                        child: TextFormField(
                          controller: passwordcontoller,
                          validator: (val) {
                            if (val.isEmpty) return 'Empty';
                            return null;
                          },
                          onSaved: (val) => _password = val,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xff042E6F),
                                ),
                                onPressed: _toggle,
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Password'),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 28, right: 28, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Text(
                              "Forget Password",
                              style: TextStyle(color: Color(0xff00BAF2)),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: ResponsiveFlutter.of(context).wp(83),
                        //_width * 0.90,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () async {
                            if (form.currentState.validate()) {
                              http.post(
                                'https://ajerrha.com/api/sanctum/token',
                                body: jsonEncode({
                                  'email': mobile_no,
                                  'password': passwordcontoller.text,
                                  'device_name': "12/12/1000",
                                }),
                                headers: {'Content-Type': 'application/json'},
                              ).then((response) async {
                                var preferences = await SharedPreferences
                                    .getInstance(); // Save a value
                                
                                    final res =json.decode(response.body);// Retrieve value later
                                     preferences.setString('value_key', res["token"]);

                                    print(res["token"]);
                                    print(res["status"]);

                                if (res["status"] == "success") {
                                  isLogin = true;

                                  showAlertDialogloginsucessfull(context);
                                  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => FirstHome()),
            (Route<dynamic> route) => false,
      );
                                //  Navigator.pop(context);
                                } else {
                                  isLogin = false;
                                   showAlertDialogloginnotsucessfull(context);
                                }
                              });
                            }
                          },
                          color: Color(0xFF042E6F),
                          padding: EdgeInsets.all(
                            ResponsiveFlutter.of(context).wp(4),
                          ),
                          textColor: Colors.white,
                          child: Text(
                            AppLocalizations.of(context).translate(
                              'Login',
                            ),
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2.5),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveFlutter.of(context).hp(1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Userform(),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context).translate(
                            'account',
                          ),
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.5),
                              color: Color(0XffFF741A),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveFlutter.of(context).fontSize(1),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  showAlertDialogloginsucessfull(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SuccessFull"),
      content: Text("Have a Good Day"),
      actions: [
          new FlatButton(
            onPressed: () {
              
              // dismisses only the dialog and returns nothing
             },
            child: new Text('OK'),
          ),
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
  
  showAlertDialogloginnotsucessfull(BuildContext context) {
    // set up the AlertDialog
    
    AlertDialog alert = AlertDialog(
      title: Text("Not Login "),
      content: Text("Something Wrong"),
      actions: [
         new FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
             },
            child: new Text('OK'),
          ),
      ],
      
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
                                  sleep(const Duration(seconds: 2));

  }
}
