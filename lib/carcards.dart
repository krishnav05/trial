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
      vehicleInsuranceExpireDate:
          DateTime.parse(json["vehicle_insurance_expire_date"]),
      vehicleMileage: json["vehicle_mileage"],
      vehicleDoor: json["vehicle_door"],
      vehicleSeatCapacity: json["vehicle_seat_capacity"],
      vehicleCondition: json["vehicle_condition"],
      city: json["city"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      frontLeftSideTick: json["front_left_side_tick"],
      frontLeftSideText: json["front_left_side_text"],
      frontLeftSideImage: json["front_left_side_image"],
      frontLeftSideName: json["front_left_side_name"],
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
      image3Name: json["image3name"],
      image4: json["image4"],
      image4Name: json["image4name"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
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

class Carinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      thickness: 1,
                      height: 20,
                      color: Colors.black12,
                    ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => vehicleDetails(
                            vehicleid: data[index].id,
                            vehiclename: data[index].vehicleType,
                            vehicle1: data[index].image1Name,
                            vehicle2: data[index].image2Name,
                            vehicle3: data[index].image3Name,
                            vehicle4: data[index].image4Name,
                            vehiclerate: data[index].vehicleRentPerDay,
                            vehiclemilage: data[index].vehicleMileage,
                            vehicledescprition: data[index].vehicleDescription,
                            vehicleinsurance:
                                data[index].vehicleInsuranceExpireDate,
                            vehicalelang: data[index].latitude,
                            vehicalelong: data[index].longitude,
                          ),
                        ),
                      );
                    },
                    // Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => vehicleDetails( )),
                    //),
                    child: Card(
                      elevation: 0.0,
                      child: Row(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  decoration: new BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://ajerrha.com/vehicles/${data[index].id}/${data[index].image2Name}'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                          children: <Widget>[
                                            Text(
                                              data[index].vehicleType,
                                              //  new_data[index]['name'],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  fontFamily: 'Tajawal'),
                                            ),
                                            Text(
                                              data[index].vehicleYear,
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
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Color(0xffFF741A)),
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Color(0xffFF741A)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                // child:
                                                //Text(data[index].vehicleCondition,
                                                //  new_data[index]['star'],
                                                //   textAlign: TextAlign.center,
                                                //   style: TextStyle(
                                                //       fontFamily: 'Tajawal',
                                                //       fontWeight: FontWeight.w700,
                                                //       color: Color(0xffFF741A)),
                                                // ),
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
                                                  data[index].city,
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
                                          Text(
                                            data[index].vehicleRentPerDay +
                                                " SAR Per Day",
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      vehicleDetails()),
                                            ),
                                            child: Row(
                                              children: [
                                                Text("Available",
                                                    // Text(data[index].vehicleDescription,
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
                }),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
            children: [
              Text("Network Issues"),
              Text("${snapshot.error}"),
            ],
          ));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
