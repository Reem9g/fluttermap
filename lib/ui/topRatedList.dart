import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/doctor.dart';
import 'package:flutter_app_mab/utils/database_helper_doctor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import 'detailDoctor.dart';

class TopRatedList extends StatefulWidget {
  String UserName;
  TopRatedList(this.UserName);
  @override
  _TopRatedListState createState() => _TopRatedListState(this.UserName);
}

class _TopRatedListState extends State<TopRatedList> {
  String UserName;
  _TopRatedListState(this.UserName);
  List<Doctor> items = List();
  DatabaseHelperDoctor db = new DatabaseHelperDoctor();

  void initState() {
    super.initState();
    db.getAllDoctors().then((doctors) {
      setState(() {
        doctors.forEach((doctor) {
          items.add(Doctor.fromMap(doctor));
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Card(
                  color: Colors.blue[50],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskScreen(
                                    items[index].name,
                                    items[index].spec,
                                    //  items[index].spec,
                                    items[index].about,
                                    items[index].from,
                                    items[index].to,
                                    items[index].phone,
                                    UserName,
                                    items[index].address)));
                      },
                      child: Column(
                         //   crossAxisAlignment: CrossAxisAlignment.end,
                         //   mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${items[index].name}',
                               textAlign: TextAlign.end,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '${items[index].spec}',
                               textAlign: TextAlign.start,
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                    ),
                  ),
                ),
              );
            },
          )
    );
  }
}
