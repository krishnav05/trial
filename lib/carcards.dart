import 'dart:async';
import 'dart:convert';
import 'package:Ajreeha/cardetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Job {
  /*------------------------------------------------------------------------------------------*/
    int id;
    String userId;
    String vehicleType;
    String vehicleModel;
    String vehicleYear;
    String vehicleColor;
    String vehicleRentPerDay;
    String vehicleDescription;
    DateTime vehicleInsuranceExpireDate;
    String vehicleMileage;
    String vehicleDoor;
    String vehicleSeatCapacity;
    String vehicleCondition;
    String city;
    String latitude;
    String longitude;
    String frontLeftSideTick;
    String frontLeftSideText;
    dynamic frontLeftSideImage;
    String frontLeftSideName;
    String frontRightSideTick;
    dynamic frontRightSideText;
    dynamic frontRightSideImage;
    dynamic frontRightSideName;
    String middleLeftSideTick;
    dynamic middleLeftSideText;
    dynamic middleLeftSideImage;
    dynamic middleLeftSideName;
    String middleRightSideTick;
    dynamic middleRightSideText;
    dynamic middleRightSideImage;
    dynamic middleRightSideName;
    String backLeftSideTick;
    dynamic backLeftSideText;
    dynamic backLeftSideImage;
    dynamic backLeftSideName;
    String backRightSideTick;
    dynamic backRightSideText;
    dynamic backRightSideImage;
    dynamic backRightSideName;
    dynamic image1;
    dynamic image1Name;
    dynamic image2;
    String image2Name;
    dynamic image3;
    String image3Name;
    dynamic image4;
    dynamic image4Name;
    DateTime createdAt;
    DateTime updatedAt;
  /*------------------------------------------------------------------------------------------*/

  Job({
   
     this.id,
        this.userId,
        this.vehicleType,
        this.vehicleModel,
        this.vehicleYear,
        this.vehicleColor,
        this.vehicleRentPerDay,
        this.vehicleDescription,
        this.vehicleInsuranceExpireDate,
        this.vehicleMileage,
        this.vehicleDoor,
        this.vehicleSeatCapacity,
        this.vehicleCondition,
        this.city,
        this.latitude,
        this.longitude,
        this.frontLeftSideTick,
        this.frontLeftSideText,
        this.frontLeftSideImage,
        this.frontLeftSideName,
        this.frontRightSideTick,
        this.frontRightSideText,
        this.frontRightSideImage,
        this.frontRightSideName,
        this.middleLeftSideTick,
        this.middleLeftSideText,
        this.middleLeftSideImage,
        this.middleLeftSideName,
        this.middleRightSideTick,
        this.middleRightSideText,
        this.middleRightSideImage,
        this.middleRightSideName,
        this.backLeftSideTick,
        this.backLeftSideText,
        this.backLeftSideImage,
        this.backLeftSideName,
        this.backRightSideTick,
        this.backRightSideText,
        this.backRightSideImage,
        this.backRightSideName,
        this.image1,
        this.image1Name,
        this.image2,
        this.image2Name,
        this.image3,
        this.image3Name,
        this.image4,
        this.image4Name,
        this.createdAt,
        this.updatedAt,
    
    });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
     
        id: json["id"],
        userId: json["user_id"],
        vehicleType: json["vehicle_type"],
        vehicleModel: json["vehicle_model"],
        vehicleYear: json["vehicle_year"],
        vehicleColor: json["vehicle_color"],
        vehicleRentPerDay: json["vehicle_rent_per_day"],
        vehicleDescription: json["vehicle_description"],
        vehicleInsuranceExpireDate: DateTime.parse(json["vehicle_insurance_expire_date"]),
        vehicleMileage: json["vehicle_mileage"],
        vehicleDoor: json["vehicle_door"],
        vehicleSeatCapacity: json["vehicle_seat_capacity"],
        vehicleCondition: json["vehicle_condition"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        frontLeftSideTick: json["front_left_side_tick"],
        frontLeftSideText: json["front_left_side_text"] ,
        frontLeftSideImage: json["front_left_side_image"],
        frontLeftSideName: json["front_left_side_name"] ,
        frontRightSideTick: json["front_right_side_tick"],
        frontRightSideText: json["front_right_side_text"],
        frontRightSideImage: json["front_right_side_image"],
        frontRightSideName: json["front_right_side_name"],
        middleLeftSideTick: json["middle_left_side_tick"],
        middleLeftSideText: json["middle_left_side_text"],
        middleLeftSideImage: json["middle_left_side_image"],
        middleLeftSideName: json["middle_left_side_name"],
        middleRightSideTick: json["middle_right_side_tick"],
        middleRightSideText: json["middle_right_side_text"],
        middleRightSideImage: json["middle_right_side_image"],
        middleRightSideName: json["middle_right_side_name"],
        backLeftSideTick: json["back_left_side_tick"],
        backLeftSideText: json["back_left_side_text"],
        backLeftSideImage: json["back_left_side_image"],
        backLeftSideName: json["back_left_side_name"],
        backRightSideTick: json["back_right_side_tick"],
        backRightSideText: json["back_right_side_text"],
        backRightSideImage: json["back_right_side_image"],
        backRightSideName: json["back_right_side_name"],
        image1: json["image1"],
        image1Name: json["image1name"],
        image2: json["image2"],
        image2Name: json["image2name"],
        image3: json["image3"],
        image3Name: json["image3name"] ,
        image4: json["image4"],
        image4Name: json["image4name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}

class Carinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return
          //  Text(data[index].city);
          InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => vehicleDetails()),
                ),
                      child: Card(
                    //  color: Colors.pink,
                    elevation: 2.0,
                    child: Row(
                      children: [
                        Row(
                          children: <Widget>[
                            Container(
                                   height: MediaQuery.of(context).size.height / 9,
                                width: MediaQuery.of(context).size.width / 3.4,
                            child:
                            Image.network('https://ajerrha.com/vehicles/${data[index].id}/${data[index].image2Name}'),
                            ),
                            // Container(
                            //     height: MediaQuery.of(context).size.height / 9,
                            //     width: MediaQuery.of(context).size.width / 3.4,
                                
                            //     decoration: new BoxDecoration(
                            //       image: DecorationImage(
                            //         image: Image.network('https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true');

                            //         fit: BoxFit.fill,
                            //       ),
                            //       borderRadius: BorderRadius.circular(5.0),
                            //     )),
                            Container(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.6,
                              //  color: Colors.orange,
                              //  width: MediaQuery.of(context).size.width * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(data[index].vehicleType,
                                          //  new_data[index]['name'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                fontFamily: 'Tajawal'),
                                          ),
                                          Text(data[index].vehicleModel,
                                           // new_data[index]['model'],
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
                                              padding:
                                                  const EdgeInsets.only(top: 5.0),
                                              child: Text(data[index].vehicleCondition,
                                              //  new_data[index]['star'],
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
                                              padding:
                                                  const EdgeInsets.only(top: 5.0),
                                              child: Text(data[index].city,
                                               // new_data[index]['map'],
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
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data[index].vehicleRentPerDay,
                                         // new_data[index]['price'],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        OutlineButton(
                                          padding: EdgeInsets.all(0),
                                          borderSide: BorderSide(
                                              color: Color(0xff00BAF2)),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onPressed:
                                           () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  vehicleDetails()),
                                        ),
                                          child: Row(
                                            children: [
                                              Text(data[index].vehicleDescription,
                                                //new_data[index]['avl'],
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff00BAF2),
                                                  )),
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
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        });
         //  _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://ajerrha.com/api/all/vehicles';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  // ListView _jobsListView(data) {
  //   return ListView.builder(
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         return _tile(data[index].position, data[index].company, Icons.work);
  //       });
  // }

  // ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
  //       title: Text(title,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 20,
  //           )),
  //       subtitle: Text(subtitle),
  //       leading: Icon(
  //         icon,
  //         color: Colors.blue[500],
  //       ),
  //     );
}
// import 'dart:convert';
// import 'package:Ajreeha/cardetail.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class Carinfo extends StatefulWidget {
//   @override
//   _CarinfoState createState() => _CarinfoState();
// }

// class _CarinfoState extends State<Carinfo> {
//   List data;
//   final df = new DateFormat('dd-MM-yyyy');
//   DateTime _currentdate = DateTime.now();

//   // ignore: unused_element
//   Future<Null> _datechange(BuildContext context) async {
//     final DateTime _datechange = await showDatePicker(
//         context: context,
//         initialDate: _currentdate,
//         firstDate: DateTime(2001),
//         lastDate: _currentdate);
//     if (_datechange != null) {
//       setState(() {
//         _currentdate = _datechange;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     // var appLanguage = Provider.of<AppLanguage>(context);

//     return FutureBuilder(
//       future: DefaultAssetBundle.of(context).loadString('assets/carinfo.json'),
//       builder: (context, snapshot) {
//         // ignore: non_constant_identifier_names
//         var new_data = json.decode(snapshot.data.toString());
//         return MediaQuery.removePadding(
//           context: context,
//           removeTop: true,
//           child: ListView.separated(
//             separatorBuilder: (BuildContext context, int index) => Divider(
//               thickness: 1,
//               height: 20,
//               color: Colors.black12,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => vehicleDetails()),
//                 ),
//                 child: 
//                 Card(
//                   //  color: Colors.pink,
//                   elevation: 0.0,
//                   child: Row(
//                     children: [
//                       Row(
//                         children: <Widget>[
//                           Container(
//                               height: MediaQuery.of(context).size.height / 9,
//                               width: MediaQuery.of(context).size.width / 3.4,
//                               decoration: new BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(new_data[index]['image']),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 borderRadius: BorderRadius.circular(5.0),
//                               )),
//                           Container(
//                             // color: Colors.blue,
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             //  color: Colors.orange,
//                             //  width: MediaQuery.of(context).size.width * 0.3,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8.0, right: 8, bottom: 8),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 7),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       // crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Text(
//                                           new_data[index]['name'],
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16.0,
//                                               fontFamily: 'Tajawal'),
//                                         ),
//                                         Text(
//                                           new_data[index]['model'],
//                                           textAlign: TextAlign.end,
//                                           style: TextStyle(
//                                             fontFamily: 'Tajawal',
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: <Widget>[
//                                           Icon(Icons.star,
//                                               size: 18,
//                                               color: Color(0xffFF741A)),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 5.0),
//                                             child: Text(
//                                               new_data[index]['star'],
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: 'Tajawal',
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Color(0xffFF741A)),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(Icons.place,
//                                               size: 18,
//                                               color: Color(0xff000000)),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 5.0),
//                                             child: Text(
//                                               new_data[index]['map'],
//                                               textAlign: TextAlign.end,
//                                               style: TextStyle(
//                                                 fontFamily: 'Tajawal',
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 5),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         new_data[index]['price'],
//                                         textAlign: TextAlign.right,
//                                         style: TextStyle(
//                                           fontFamily: 'Tajawal',
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       OutlineButton(
//                                         padding: EdgeInsets.all(0),
//                                         borderSide: BorderSide(
//                                             color: Color(0xff00BAF2)),
//                                         materialTapTargetSize:
//                                             MaterialTapTargetSize.shrinkWrap,
//                                         onPressed: () => Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   vehicleDetails()),
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             Text(new_data[index]['avl'],
//                                                 style: TextStyle(
//                                                   fontSize: 13,
//                                                   color: Color(0xff00BAF2),
//                                                 )),
//                                             Icon(
//                                               Icons.arrow_forward,
//                                               size: 15,
//                                               color: Color(0xff00BAF2),
//                                             )
//                                           ],
//                                         ),
//                                         color: Colors.white,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             itemCount: new_data == null ? 0 : new_data.length,
//           ),
//         );
//       },
//     );
//   }
// }
