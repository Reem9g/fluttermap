import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/utils/databasee_helper_center.dart';
import 'package:flutter_app_mab/model/center.dart';
import 'doctor.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:flutter_app_mab/ui/AddCenter.dart';
import 'package:google_fonts/google_fonts.dart';


class centerCards extends StatefulWidget {
  String UserName;
  centerCards(this.UserName);
  @override
  centerCards_state createState() => centerCards_state(this.UserName);
}

class centerCards_state extends State<centerCards> {
  String UserName;
  centerCards_state(this.UserName);
  List<Centerr> items = List();
  DatabaseHelperCenter db = new DatabaseHelperCenter();

  User user;
  bool _isvisible = false;
  @override
  void initState() {
    super.initState();
    db.getAllCenters().then((centers) {
      setState(() {
        centers.forEach((center) {
          items.add(Centerr.fromMap(center));
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
          child:
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 25),
                child: TextFormField(
                  cursorColor: Color(0xff4d36ad),
                  textInputAction: TextInputAction.search,
                  // controller: _doctorName,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffd7d6e6),
                    hintText: 'بحث',
                    hintStyle: GoogleFonts.lato(
                      color: Color(0xff453097).withAlpha(50),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: //Colors.blue[900].withOpacity(0.9),
                        Color(0xff6D6298),
                        borderRadius: BorderRadius.circular(20),
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
                  /* onFieldSubmitted: (String value) {
                setState(
                      () {
                    value.length == 0
                        ? Container()
                        : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchList(
                          searchKey: value,
                        ),
                      ),
                    );
                  },
                );
              },*/
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Stack(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: 80,
                            width: 400,
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text('${items[position].from}',),
                                          Text(' :البدء',
                                              //  textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              )),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('${items[position].to}'),
                                        Text(' :الانتهاء',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),

                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 8,bottom:8,top:8),
                                    child: ListTile(
                                        title: Text(
                                          '${items[position].name}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Text(
                                              ' رقم الهاتف: ${items[position].phone}',
                                              textAlign: TextAlign.right,
                                            ),
                                            Text(
                                              ' العنوان: ${items[position].address}',
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            margin:
                            EdgeInsets.only(top: 20, right: 30, left: 30),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffd7d6e6)
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        D_details(UserName)));
                          },
                        ),
                        Visibility(
                          visible : UserName == 'admin' ? !_isvisible: _isvisible,
                          child: Padding(
                            padding: const EdgeInsets.only(right:285,top:3),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                      Icons.edit,
                                      color: Color(0xff6D6298)
                                  ),
                                  onPressed: () => _navigateToCenter(
                                      context, items[position]),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color(0xff6D6298),
                                    ),
                                    onPressed: () => _deleteCenter(
                                        context,
                                        items[position],
                                        position))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  })
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible : UserName == 'admin' ? !_isvisible: _isvisible,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _createNewLabortoryCenter(context);
          },
          backgroundColor: Color(0xff6D6298),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait,
                color: Colors.white, size: 30),
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home('')));
            },
          ),
          GestureDetector(
            child: Icon(Icons.login_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
        color: Color(0xff6D6298),
        backgroundColor: Colors.white,
      ),
    );
  }
  _deleteCenter(
      BuildContext context, Centerr center, int position) async {
    db.deleteCenter(center.id).then((centers) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToCenter(BuildContext context, Centerr center) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCenters(center)),
    );

    if (result == 'update') {
      db.getAllCenters().then((centers) {
        setState(() {
          items.clear();
          centers.forEach((center) {
            items.add(Centerr.fromMap(center));
          });
        });
      });
    }
  }

  void _createNewLabortoryCenter(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddCenters(Centerr('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllCenters().then((centers) {
        setState(() {
          items.clear();
          centers.forEach((center) {
            items.add(Centerr.fromMap(center));
          });
        });
      });
    }
  }
}
