import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/doctor.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/ui/AddDoctor.dart';
import 'package:flutter_app_mab/utils/database_helper_doctor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailDoctor.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'mapScreen.dart';

class Spc_Doctors extends StatefulWidget {
  String UserName;
  String Spec;
  Spc_Doctors(this.Spec, this.UserName);
  @override
  State<StatefulWidget> createState() {
    return stateSpc_Doctors(this.Spec, this.UserName);
  }
}

class stateSpc_Doctors extends State<Spc_Doctors> {
  String Spec, UserName;
  stateSpc_Doctors(this.Spec, this.UserName);
  List<Doctor> items = List();
  DatabaseHelperDoctor db = new DatabaseHelperDoctor();
  User user;
  bool _isvisible = false;
  int _currentIndex = 0;
  @override
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 25),
                child: TextFormField(
                  // onFieldSubmitted: (String value) {
                  //
                  //   setState(
                  //         () {
                  //       value.length == 0
                  //           ? Container()
                  //           : Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => SearchList(
                  //             searchKey: value,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   );
                  // },
                  onChanged: (String text) async {
                    // List<Map> res = await database.rawQuery(
                    //     "SELECT name FROM DoctorTable WHERE name LIKE '%${text}%' ");
                    // print(res);

                    //Database db = await DatabaseHelper.instance.database;
                    // List<Map> result = await db.rawQuery("SELECT content FROM table WHERE content LIKE '%${text}%'");

                    // setState(() {
                    //   result.forEach((element) {
                    //     print(element);
                    //     course = result;
                    //   });
                    //
                    // });
                  },
                  cursorColor: Colors.blue[900].withOpacity(0.9),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.blue[100],
                    //Color(0xffC3D9F1),
                    hintText: 'بحث',
                    hintStyle: GoogleFonts.lato(
                      color: Colors.blue[900].withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900].withOpacity(0.9),
                        //  Color(0xff6D6298),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        color: Colors.white,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          // height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  items[index].spec == Spec ?
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,top:15,bottom: 10),
                      child: Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskScreen(
                                        items[index].name,
                                        '$Spec',
                                      //  items[index].spec,
                                        items[index].about,
                                        items[index].from,
                                        items[index].to,
                                        items[index].phone,
                                        UserName,
                                        items[index].address)));
                          },
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${items[index].name}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      //    color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                //'${items[index].spec}',
                                '$Spec',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    //  color: Color(0xffffffff),
                                    ),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 20),
                                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                    //  crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:27.0),
                                          child: Text(
                                            'رقم الطبيب: ${items[index].phone}',
                                            style: GoogleFonts.lato(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'الدوام: ${items[index].from} - ${items[index].to}',
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: UserName == 'admin' ? !_isvisible : _isvisible,
                      child: Padding(
                        padding: const EdgeInsets.only(
                         // right: 200,
                            top:7
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue[900].withOpacity(0.9),),
                              onPressed: () =>
                                  _navigateToDoctor(context, items[index]),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.blue[900].withOpacity(0.9),
                                ),
                                onPressed: () =>
                                    _deleteDoctor(context, items[index], index))
                          ],
                        ),
                      ),
                    )
                  ],
                )
                : Center();
              }),
        ),
      ]),
      floatingActionButton: Visibility(
        visible: UserName == 'admin' ? !_isvisible : _isvisible,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _createNewDoctor(context);
          },
          backgroundColor: Colors.blue[900].withOpacity(0.9),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 15,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          if (_currentIndex == 1)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => map()));
          else if (_currentIndex == 2)
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => Home(UserName)),
                    (Route<dynamic> route) => false
            );
          else if (_currentIndex == 3)
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => LoginScreen()),
                    (Route<dynamic> route) => false
            );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.stay_current_portrait),
            title: Text('الصفحة الحالية'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.location_pin),
            title: Text('الخريطة'),
            activeColor: Colors.blue.withOpacity(0.7),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            title: Text(
              'الصفحة الرئيسية',
            ),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.login_outlined),
            title: Text(''),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _deleteDoctor(BuildContext context, Doctor doctor, int position) async {
    db.deleteDoctor(doctor.id).then((doctors) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToDoctor(BuildContext context, Doctor doctor) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDoctors(doctor)),
    );

    if (result == 'update') {
      db.getAllDoctors().then((doctors) {
        setState(() {
          items.clear();
          doctors.forEach((doctor) {
            items.add(Doctor.fromMap(doctor));
          });
        });
      });
    }
  }

  void _createNewDoctor(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddDoctors(Doctor('', '', '', '', '', '',''))),
    );

    if (result == 'save') {
      db.getAllDoctors().then((doctors) {
        setState(() {
          items.clear();
          doctors.forEach((doctor) {
            items.add(Doctor.fromMap(doctor));
          });
        });
      });
    }
  }
}
