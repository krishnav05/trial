import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  final String mobileno;

  Otp({Key key, this.mobileno}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  bool resendbtncolor = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
  }

  /// get signature code
  _getSignatureCode() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("signature $signature");
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    _verifyOtp();
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
  }

  _verifyOtp() {
    // http://3.21.228.107/api/check/mobile
    http.post(
      'https://ajerrha.com/api/verify/mobile',
      body: jsonEncode({
        'mobile': widget.mobileno,
        "otp": _otpCode,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((response) async {
      final res = json.decode(response.body);
      print(res["status"]);
      // bool   isregister = false;

      if (res["status"] == "success") {
        // var preferences = await SharedPreferences.getInstance(); // Save a value
        // preferences.setString('otpverify', "true");
        Navigator.pop(context);
      }
      print(response.body);
      //  print(isregister);
    });
  }

  _resend() {
    http.post(
      'https://ajerrha.com/api/resend/mobile',
      body: jsonEncode({
        'mobile': widget.mobileno,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((response) {
      final res = json.decode(response.body);
      print(res["status"]);
      if (res["status"] == "success") {
        setState(() {
          resendbtncolor = true;
        });
      }
      print("ResendCode" + response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Mobile Verify'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Verification",
                  style: TextStyle(color: Color(0xffFF741A), fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter the 4 digit verification code you got on your phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.mobileno),
                SizedBox(
                  height: 15,
                ),
                TextFieldPin(
                  // filled: true,
                  filledColor: Color(0xffFF741A),
                  codeLength: _otpCodeLength,
                  boxSize: 40,
                  filledAfterTextChange: false,
                  textStyle: TextStyle(fontSize: 16),
                  // borderStyle: OutlineInputBorder(
                  //     borderSide: BorderSide.none,
                  //     borderRadius: BorderRadius.circular(34)),
                  onOtpCallback: (code, isAutofill) =>
                      _onOtpCallBack(code, isAutofill),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: _width / 1.2,
                  child: MaterialButton(
                    onPressed: _enableButton ? _onSubmitOtp : null,
                    child: _setUpButtonChild(),
                    color: Color(0xff042E6F),
                    disabledColor: Color(0xff042E6F),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  child: Text(
                    "ReSend",
                    style: TextStyle(
                        color: resendbtncolor ? Colors.green : Colors.black),
                  ),
                  onTap: () {
                    _resend();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
