import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent/android_intent.dart';
import 'package:geolocator/geolocator.dart';
class Takelocation extends StatefulWidget {
  @override
  _TakelocationState createState() => _TakelocationState();
}

class _TakelocationState extends State<Takelocation> {
//   final PermissionHandler permissionHandler = PermissionHandler();
//   Map<PermissionGroup, PermissionStatus> permissions;
//   void initState() {
//     super.initState();
//     requestLocationPermission();
//     _gpsService();
//   }
  

//   Future<bool> _requestPermission(PermissionGroup permission) async {
//     final PermissionHandler _permissionHandler = PermissionHandler();
//     var result = await _permissionHandler.requestPermissions([permission]);
//     if (result[permission] == PermissionStatus.granted) {
//       return true;
//     }
//     return false;
//   }

//   bool checklocation = false;
// /*Checking if your App has been Given Permission*/
//   Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
//     var granted = await _requestPermission(PermissionGroup.location);
//     if (granted != true) {
//       requestLocationPermission();
//       setState(() {
//         checklocation = false;
//       });
//     } else {
//       setState(() {
//         checklocation = true;
//       });
//     }

//     debugPrint('requestContactsPermission $granted');
//     return granted;
//   }

// /*Show dialog if GPS not enabled and open settings location*/
//   Future _checkGps() async {
//     if (!(await Geolocator().isLocationServiceEnabled())) {
//       if (Theme.of(context).platform == TargetPlatform.android) {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Can't get Current location"),
//                 content:
//                     const Text('Please make sure you enable GPS and try again'),
//                 actions: <Widget>[
//                   FlatButton(
//                       child: Text('Ok'),
//                       onPressed: () {
//                         final AndroidIntent intent = AndroidIntent(
//                             action:
//                                 'android.settings.LOCATION_SOURCE_SETTINGS');
//                         intent.launch();
//                         Navigator.of(context, rootNavigator: true).pop();
//                         _gpsService();
//                       })
//                 ],
//               );
//             });
//       }
//     }
    
//   }

// /*Check if gps service is enabled or not*/
//   Future _gpsService() async {
//     if (!(await Geolocator().isLocationServiceEnabled())) {
//       _checkGps();
//       return null;
//     } else
//       return true;
//   }

  @override
  Widget build(BuildContext context) {
    return InkWell(child: Text("Pls give permission for showing car list"),

    onTap: (){
    //  var status =  permissionHandler.checkPermissionStatus;
    },
    );
  }
}