

// class Datum {
//   String name;
//   String memberid;
//   String image;

//   Datum(this.name, this.memberid,this.image);

//   Datum.fromJson(Map<String, dynamic> json) {
//     name = json['city'].toString();
//     memberid = json['id'].toString();
//     image = json['user_id'].toString();
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.data,
    });

    List<Datum> data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        frontLeftSideText: json["front_left_side_text"] == null ? null : json["front_left_side_text"],
        frontLeftSideImage: json["front_left_side_image"],
        frontLeftSideName: json["front_left_side_name"] == null ? null : json["front_left_side_name"],
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
        image3Name: json["image3name"] == null ? null : json["image3name"],
        image4: json["image4"],
        image4Name: json["image4name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "vehicle_type": vehicleType,
        "vehicle_model": vehicleModel,
        "vehicle_year": vehicleYear,
        "vehicle_color": vehicleColor,
        "vehicle_rent_per_day": vehicleRentPerDay,
        "vehicle_description": vehicleDescription,
        "vehicle_insurance_expire_date": "${vehicleInsuranceExpireDate.year.toString().padLeft(4, '0')}-${vehicleInsuranceExpireDate.month.toString().padLeft(2, '0')}-${vehicleInsuranceExpireDate.day.toString().padLeft(2, '0')}",
        "vehicle_mileage": vehicleMileage,
        "vehicle_door": vehicleDoor,
        "vehicle_seat_capacity": vehicleSeatCapacity,
        "vehicle_condition": vehicleCondition,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "front_left_side_tick": frontLeftSideTick,
        "front_left_side_text": frontLeftSideText == null ? null : frontLeftSideText,
        "front_left_side_image": frontLeftSideImage,
        "front_left_side_name": frontLeftSideName == null ? null : frontLeftSideName,
        "front_right_side_tick": frontRightSideTick,
        "front_right_side_text": frontRightSideText,
        "front_right_side_image": frontRightSideImage,
        "front_right_side_name": frontRightSideName,
        "middle_left_side_tick": middleLeftSideTick,
        "middle_left_side_text": middleLeftSideText,
        "middle_left_side_image": middleLeftSideImage,
        "middle_left_side_name": middleLeftSideName,
        "middle_right_side_tick": middleRightSideTick,
        "middle_right_side_text": middleRightSideText,
        "middle_right_side_image": middleRightSideImage,
        "middle_right_side_name": middleRightSideName,
        "back_left_side_tick": backLeftSideTick,
        "back_left_side_text": backLeftSideText,
        "back_left_side_image": backLeftSideImage,
        "back_left_side_name": backLeftSideName,
        "back_right_side_tick": backRightSideTick,
        "back_right_side_text": backRightSideText,
        "back_right_side_image": backRightSideImage,
        "back_right_side_name": backRightSideName,
        "image1": image1,
        "image1name": image1Name,
        "image2": image2,
        "image2name": image2Name,
        "image3": image3,
        "image3name": image3Name == null ? null : image3Name,
        "image4": image4,
        "image4name": image4Name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
