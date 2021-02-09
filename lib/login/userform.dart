import 'dart:convert';
import 'dart:io';
import 'package:Ajreeha/Api/util/validators.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:Ajreeha/localization/App_localization.dart';
import 'package:Ajreeha/OTP/dialogBoxotp.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:Ajreeha/Dialog/Dialogmobilecheck.dart';

class Userform extends StatefulWidget {
  @override
  _UserformState createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  bool isregister = false;
  File _image;
  var photopath;
  String photo64;

  bool completeaccount = false;

  // ignore: non_constant_identifier_names
  void open_camera() async {
    // ignore: deprecated_member_use
    var imagepath = await ImagePicker.pickImage(source: ImageSource.camera);
    final bytes = imagepath.readAsBytesSync();
    String _img64 = base64Encode(bytes);
    print(_img64);
    print("image");
    print(imagepath);
   // print("only extension" + photopath);

    setState(() {
      _image = imagepath;
     // photopath = (imagepath.toString().split('/').last);
      photo64 = _img64;
   //   print("only extension" + photopath);
    });
  }

  // ignore: non_constant_identifier_names
  void open_gallery() async {
    // ignore: deprecated_member_use
    var imagepath = await ImagePicker.pickImage(source: ImageSource.gallery);
    final bytes = imagepath.readAsBytesSync();
    String _img64 = base64Encode(bytes);
    print(_img64);
    print("image");
    print(imagepath);
  //  print("only extension outside" + photopath);

    setState(() {
      _image = imagepath;
     // photopath = (imagepath.toString().split('/').last);
      photo64 = _img64;
     // print("only extension" + photopath);
    });
  }

  bool validate = false;
  bool selected = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  final TextEditingController controller = TextEditingController();
 // String initialCountry = 'SA';
 // PhoneNumber number = PhoneNumber(isoCode: 'SA');
  var mobile_no = "";
var save_mobile;
  @override
  void initState() {
    super.initState();
    dobcontroller = TextEditingController();
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogerror(BuildContext context) {
    AlertDialog alert = AlertDialog(
        //  title:
        content: Container(
      height: ResponsiveFlutter.of(context).hp(20),
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
          Text("you are fill something wrong"),
          Text("else left empty some field ")
        ],
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

  _verifyOtp() {
    http.post(
      'https://ajerrha.com/api/check/mobile',
      body: jsonEncode({
        'mobile': mobile_no,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((response) {
      final res = json.decode(response.body);
      print(res["status"]);
      if (res["status"] == "success") {
        isregister = true;
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => Otp(mobileno: mobile_no),
        );
        Navigator.of(context).push(route);
      } else if (res["status"] == "error") {
        showAlertDialogerrormobilecheck(context);
      }
      print(mobilecontroller.text);
      print(response.body);
      print(isregister);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    //  AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: completeaccount
            ? Text("Complete Account",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2)))
            : Text("Create Account",
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
              padding:
                  EdgeInsets.only(left: _width * 0.030, right: _width * 0.030),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Form(
                    key: _form,
                    child: ListView(
                      padding: EdgeInsets.all(10.0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          children: [
                             completeaccount? Text(
                              "Basic Information",
                              style: TextStyle(
                                  color: Color(0xffFF741A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ):Container(color: Colors.white,),
                            // Text("Enter Mobile"),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  enabled: completeaccount ? false : true,
                                  //  enabled: isregister?true:false,
                                  controller: namecontroller,
                                  validator: (val) {
                                    if (val.isEmpty) return 'Empty';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Name',
                                      hintText: 'Sayed'),
                                )),

                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                child: InternationalPhoneNumberInput(
                                //  isEnabled:completeaccount?false:true ,
                                  inputBorder: InputBorder.none,
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  spaceBetweenSelectorAndTextField: 0,
                                  onInputChanged: (PhoneNumber number) {
                                    setState(() {
                                      mobile_no = number.phoneNumber;
                                    print(number.phoneNumber);

                                    });
                                  },
                                  // onInputValidated: (bool value) {
                                  //   print(value);
                                  // },
                                  selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  selectorTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                //  initialValue: number,
                                  textFieldController:mobilecontroller,
                                  formatInput: false,
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  onSaved: (PhoneNumber number) {
                                    
                                  },
                                ),
                              ),
                            ),
                       isregister?     Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: _width,
                                child: FlatButton(
                                  color: Colors.grey,
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: (){}
                                ),
                              ),
                            ):  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: _width,
                                child: FlatButton(
                                  color: 
                                       Color(0xffFF741A),
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => _verifyOtp(),
                                ),
                              ),
                            ),
                             Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  enabled: completeaccount ? false : true,
                                  controller: passwordcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Password'),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  enabled: completeaccount ? false : true,
                                  controller: confirmpasswordcontroller,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'confirm Password',
                                      hintText: 'confirm Password'),
                                )),
                            //Image

                               completeaccount?   Text("Additional Information",
                             style: TextStyle(
                                  color: Color(0xffFF741A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            
                            ):Container(color: Colors.white,),
                            completeaccount
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: dobcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Date of Birth',
                                        hintText: '14 - 11 - 1985',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.date_range,
                                            color: Color(0xff00BAF2),
                                          ),
                                          onPressed: () {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1949, 1),
                                                lastDate: DateTime.now(),
                                                builder: (BuildContext context,
                                                    Widget picker) {
                                                  return Theme(
                                                    data: ThemeData.dark()
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.dark(
                                                        primary: Colors.blue,
                                                        onPrimary: Colors.white,
                                                        surface: Colors.blue,
                                                        onSurface: Colors.black,
                                                      ),
                                                      dialogBackgroundColor:
                                                          Colors.white,
                                                    ),
                                                    child: picker,
                                                  );
                                                }).then((selectedDate) {
                                              if (selectedDate != null) {
                                                dobcontroller.text =
                                                    selectedDate
                                                        .toString()
                                                        .substring(0, 10);
                                              } else {
                                                dobcontroller.text = null;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ))
                                : Container(
                                    color: Colors.white,
                                  ),
                            completeaccount
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: emailcontroller,
                                      validator: validateEmail,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Email',
                                          hintText: 'Syeedd777@hotmail.com'),
                                    ))
                                : Container(
                                    color: Colors.white,
                                  ),
                            completeaccount
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: idcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'ID',
                                        hintText: '3677 2595 6999',
                                      ),
                                    ))
                                : Container(
                                    color: Colors.white,
                                  ),
                           

                      completeaccount?      Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Upload License images"),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.black12,
                                                height: 100.0,
                                                width: 210.0,
                                                child: Center(
                                                  child: _image == null
                                                      ? Text("No image")
                                                      : Image.file(_image),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  FlatButton(
                                                    //  heroTag: "btn1",
                                                    onPressed: open_camera,

                                                    // tooltip: "pickImage",
                                                    child: Icon(
                                                      Icons.add_a_photo,
                                                      color: Color(0xFF042E6F),
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    //  heroTag: "btn2",
                                                    onPressed: open_gallery,

                                                    //  tooltip: "Pick Image",
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                      color: Color(0xFF042E6F),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ):Container(
                                    color: Colors.white,
                                  ),
                                
                            completeaccount
                                ? ListTile(
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
                                        'valid',
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
                                  )
                                : Container(
                                    color: Colors.white,
                                  ),
                          ],
                        ),
                        completeaccount
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: SizedBox(
                                  width: _width * 0.90,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    onPressed: isregister
                                        ? () async {
                                            if (_form.currentState.validate()) {
                                              print(save_mobile);
                                              http.post(
                                                'https://ajerrha.com/api/register',
                                                body: jsonEncode({
                                                  'name': namecontroller.text,
                                                  'email': emailcontroller.text,
                                                  'password':
                                                      passwordcontroller.text,
                                                  'mobile':save_mobile,
                                                    
                                                  'dob': dobcontroller.text,
                                                  'license_id':
                                                      idcontroller.text,
                                                  'license_name': "image.jpg",
                                                  'image': photo64,
                                                  // "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGEAAAA8CAYAAAB2FtSKAAAAAXNSR0IArs4c6QAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAYaADAAQAAAABAAAAPAAAAADwvpT9AAAJNklEQVR4Ae2au24jyRWGJa8NA8YGBBzYjtR+gu19AvVmdmJwcwc9L2Bxn0C9oaPhZpupB36A4SQOzRrYuXoyZ+zFbrCAg+FkC2wgf3+xiiq2+sLmZSSKPMDPc61TVed0VzcpnZ09M7q7u/sz+C/4G/jkELb3i0NY5DprpOAD8A9i/wl+C34H/o0tgZ9o3xWg0Lr6fwSevtecKL8BV+Dv4A/7XsdR5qewuvpfgSr9EBYE5yfgL+BP4Neh7yRvWQEK+h9QRytNCKchOAK/DG2PLT+pxWxQjE/7jjk/Py/7jtl3/LN5MO+7UPvMf7RN4Ega7L"
                                                }),
                                                headers: {
                                                  'Content-Type':
                                                      'application/json',
                                                },
                                              ).then((response) {
                                                final res =
                                                    json.decode(response.body);
                                                    print("body"+res);
                                                print(res["status"]);
                                                if (res["status"] ==
                                                    "success") {
                                                  isregister = true;

                                                  Navigator.pop(context);
                                                } else {
                                                  isregister = false;
                                                  print("else" +
                                                      isregister.toString());
                                                }
                                                print(response.body);
                                                print(isregister);
                                              });
                                            } else {
                                              showAlertDialogerror(context);
                                            }
                                          }
                                        : null,
                                    color: Color(0xFF042E6F),
                                    padding: EdgeInsets.all(16.0),
                                    textColor: Colors.white,
                                    child: Text(
                                      AppLocalizations.of(context).translate(
                                        'Create account',
                                      ),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Tajawal'),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.white,
                              ),
                        completeaccount
                            ? Container(
                                color: Colors.white,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                 onPressed: () {
                                   
                                      setState(() {
                                        completeaccount = true;
                                        save_mobile=mobile_no;
                                      });
                                   
                                  },
                                ),
                              )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
 showAlertDialogcompletesucessfull(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Account SuccessFully Created "),
      content: Text("Have a Good Day"),
      actions: [
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            //   Navigator.of(context, rootNavigator: true)
            //       .pop(); // dismisses only the dialog and returns nothing
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
}
