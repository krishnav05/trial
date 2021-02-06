import 'dart:convert';
import 'package:Ajreeha/cardetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Carinfo extends StatefulWidget {
  @override
  _CarinfoState createState() => _CarinfoState();
}

class _CarinfoState extends State<Carinfo> {
  List data;
  final df = new DateFormat('dd-MM-yyyy');
  DateTime _currentdate = DateTime.now();
  // ignore: unused_element
  Future<Null> _datechange(BuildContext context) async {
    final DateTime _datechange = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2001),
        lastDate: _currentdate);
    if (_datechange != null) {
      setState(() {
        _currentdate = _datechange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // var appLanguage = Provider.of<AppLanguage>(context);

    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/carinfo.json'),
        builder: (context, snapshot) {
          // ignore: non_constant_identifier_names
          var new_data = json.decode(snapshot.data.toString());
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1,
                height: 20,
                color: Colors.black12,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => vehicleDetails()),
                  ),
                  child: Card(
                    //  color: Colors.pink,
                    elevation: 0.0,
                    child: Row(
                      children: [
                        Row(
                          children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.height / 9,
                                width: MediaQuery.of(context).size.width / 3.4,
                                decoration: new BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(new_data[index]['image']),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            Container(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width*0.6,
                            //  color: Colors.orange,
                              //  width: MediaQuery.of(context).size.width * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, bottom: 8 ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            new_data[index]['name'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                fontFamily: 'Tajawal'),
                                          ),
                                          Text(
                                            new_data[index]['model'],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star,
                                                size: 18,
                                                color: Color(0xffFF741A)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                new_data[index]['star'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xffFF741A)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.place,
                                                size: 18,
                                                color: Color(0xff000000)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                new_data[index]['map'],
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          new_data[index]['price'],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        OutlineButton(
                                          padding: EdgeInsets.all(0) ,
                                          borderSide: BorderSide(color:  Color(0xff00BAF2)),
                                          
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    vehicleDetails()),
                                          ),
                                          child: Row(
                                            children: [

                                              Text(new_data[index]['avl'],
                                                  style: TextStyle(fontSize: 13,
                                                    
                                                    color: Color(0xff00BAF2),
                                                  )
                                                  ),
                                              Icon(
                                                
                                                Icons.arrow_forward,
                                                size: 15,
                                                color: Color(0xff00BAF2),
                                              )
                                            ],
                                          ),
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //    // height: MediaQuery.of(context).size.height / 9,
                            //       //  width: MediaQuery.of(context).size.width / 3.7,
                            //    // color: Colors.yellow,
                            //       alignment: Alignment.centerRight,
                            //       width: MediaQuery.of(context).size.width * 0.3,
                            //       child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.end,
                            //           children: <Widget>[
                            //             Text(
                            //               new_data[index]['model'],
                            //               textAlign: TextAlign.end,
                            //               style: TextStyle(
                            //                 fontFamily: 'Tajawal',
                            //                 fontWeight: FontWeight.w500,
                            //               ),
                            //             ),

                            //             Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.end,
                            //               mainAxisSize: MainAxisSize.min,
                            //               children: <Widget>[
                            //                 Expanded(
                            //                   child: IconButton(
                            //                       onPressed: () {
                            //                         // do something
                            //                       },
                            //                       

                            //                 // Icon(Icons.location_pin,color: Color(0xff000000),),
                            //                 Text(
                            //                   new_data[index]['map'],
                            //                   textAlign: TextAlign.end,
                            //                   style: TextStyle(
                            //                     fontFamily: 'Tajawal',
                            //                     fontWeight: FontWeight.w500,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //             FlatButton(
                            //               materialTapTargetSize:
                            //                   MaterialTapTargetSize.shrinkWrap,
                            //               onPressed: () => Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         vehicleDetails()),
                            //               ),
                            //               child: Row(
                            //                 children: [
                            //                   Text(
                            //                     new_data[index]['avl'],
                            //                     style: TextStyle(
                            //                         color: Colors.white),
                            //                   ),
                            //                   Icon(
                            //                     Icons.arrow_forward,
                            //                     color: Colors.white,
                            //                   )
                            //                 ],
                            //               ),
                            //               color: Color(0xff00BAF2),
                            //             )
                            //             // Text(
                            //             //   new_data[index]['avl'],
                            //             //   textAlign: TextAlign.end,
                            //             //   style: TextStyle(color: Colors.blue,
                            //             //    fontFamily: 'Tajawal',
                            //             //      fontWeight: FontWeight.w700,),
                            //             // ),
                            //           ])),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: new_data == null ? 0 : new_data.length,
            ),
          );
        });
  }
}
