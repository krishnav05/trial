import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
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
    return Scaffold(
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
                        onPressed: () {},
                      )
                    : SizedBox.shrink()
              ],
              expandedHeight: 150.0,
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
                    padding: const EdgeInsets.only(top: 35, left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: (Text("new design")),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:Ajreeha/localization/Applocalization.dart';
// import 'package:Ajreeha/Drawer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:Ajreeha/login/userform.dart';
// import 'package:Ajreeha/vehicaleinfo/Vehicaleinfo.dart';

// class LoginUi extends StatefulWidget {
//   @override
//   _LoginUiState createState() => _LoginUiState();
// }

// class _LoginUiState extends State<LoginUi> {
//   ScrollController _scrollController;
//   Color _theme;
//   bool showtext = false;

//   @override
//   void initState() {
//     super.initState();
//     _theme = Colors.black;

//     _scrollController = ScrollController()
//       ..addListener(() {
//         if (_isAppBarExpanded) {
//           if (_theme != Colors.white) {
//             setState(() {
//               showtext = true;
//               _theme = Colors.white;
//               print('setState is called with white');
//             });
//           }
//         } else {
//           if (_theme != Colors.black) {
//             setState(() {
//               showtext = false;
//               _theme = Colors.black;
//               print('setState is called with black');
//             });
//           }
//         }
//       });
//   }

//   bool get _isAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > (150 - kToolbarHeight);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Drawers(),
//       ),
//       body: NestedScrollView(
//         controller: _scrollController,
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               actions: <Widget>[
//                 showtext
//                     ? IconButton(
//                         icon: Icon(
//                           Icons.search,
//                           color: _theme, // Here
//                         ),
//                         onPressed: () {},
//                       )
//                     : SizedBox.shrink()
//               ],
//               expandedHeight: 150.0,
//               floating: false,
//               pinned: true,
//               toolbarHeight: 40,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: showtext
//                     ? SafeArea(
//                         child: Padding(
//                         padding: const EdgeInsets.only(top: 5, left: 2),
//                         child: Text('Vehicles'),
//                       ))
//                     : Text(''),
//                 background: Container(
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment(0.8, 0.0),
//                     colors: [const Color(0xff042E6F), const Color(0xff00BAF2)],
//                   )),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 35, left: 30),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Row(
//                           children: [],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: Padding(
//           padding: const EdgeInsets.only(top:20,left: 20,right: 20,bottom: 200),
//           child: Container(
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             child: Column(
//               children: [
//                 // Text("Enter Mobile"),
//                 Padding(
//                     padding: EdgeInsets.all(20),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Mobile Number',
//                           hintText: '+96 9565654522'),
//                     )),
//                 //Text("Password"),
//                 Padding(
//                     padding: EdgeInsets.all(20),
//                     child: TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Password',
//                           hintText: 'Password'),
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10),
//                   child: SizedBox(
//                     width: 330,
//                     //_width * 0.90,
//                     child: RaisedButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       onPressed: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Vehicaleform(),
//                           // HomePage(),
//                         ),
//                       ),
//                       color: Color(0xFF042E6F),
//                       padding: EdgeInsets.all(14.0),
//                       textColor: Colors.white,
//                       child: Text(
//                         AppLocalizations.of(context).translate(
//                           'Login',
//                         ),
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Tajawal'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Userform(),
//                       ),
//                     ),
//                     child: Text(
//                       AppLocalizations.of(context).translate(
//                         'account',
//                       ),
//                       textScaleFactor:
//                           MediaQuery.of(context).textScaleFactor,
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0XffFF741A),
//                           fontWeight: FontWeight.normal,
//                           fontFamily: 'Tajawal'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
