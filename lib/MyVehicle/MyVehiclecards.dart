import 'dart:convert';
import 'package:Ajreeha/cardetail.dart';
import 'package:flutter/material.dart';

class Myvehiclecards extends StatefulWidget {
  @override
  _MyvehiclecardsState createState() => _MyvehiclecardsState();
}

class _MyvehiclecardsState extends State<Myvehiclecards> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/mybookinginfo.json'),
        builder: (context, snapshot) {
          // ignore: non_constant_identifier_names
          var new_data = json.decode(snapshot.data.toString());
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1,
                height: 1,
                color: Colors.black12,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => vehicleDetails()),
                  ),
                  child: Card(
                    // color: Colors.pink,
                    elevation: 0.0,
                    child: Row(
                      children: [
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left:10,top: 8.0, bottom: 8,right: 8),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  width:
                                      MediaQuery.of(context).size.width / 3.7,
                                  decoration: new BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(new_data[index]['image']),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 2.4,
                              //color: Colors.blue,
                              //  width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    new_data[index]['name'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        fontFamily: 'Tajawal'),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),

                                  Text(
                                    new_data[index]['ownername'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w700,
                                      // color: Color(0xffFF741A)
                                    ),
                                  ),

                                  SizedBox(
                                    height: 9,
                                  ),
                                  // Text( AppLocalizations.of(context).translate(new_data[index]['price']))
                                  Text(
                                    new_data[index]['price'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                               // color: Colors.blue,
                                child: Column(
                                  children: <Widget>[
                                    FlatButton(
                                     // heroTag: "btn1",
                                      onPressed: () {},
                                      child: Icon(Icons.edit),
                                    ),
                                   
                                    FlatButton(
                                      onPressed: () {},
                                      child: Icon(Icons.delete),
                                    ),
                                 
                                    
                                  ],
                                ),
                              ),
                            )
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
