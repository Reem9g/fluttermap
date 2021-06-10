import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/pharmacy.dart';
import 'package:flutter_app_mab/utils/database_helper_phar.dart';
import 'AddPharmacy.dart';
import 'home_page.dart';
import 'logIn.dart';

class pharmacy extends StatefulWidget {
  @override
  pharmacy_pharmacyState createState() => pharmacy_pharmacyState();
}

class pharmacy_pharmacyState extends State<pharmacy> {
  List<Pharmacy> items = List();
  DatabaseHelperPhar db = new DatabaseHelperPhar();

  @override
  void initState() {
    super.initState();
    db.getAllPharmacys().then((pharmacys) {
      setState(() {
        pharmacys.forEach((pharmacy) {
          items.add(Pharmacy.fromMap(pharmacy));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff453097),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                ),
              ),
              Positioned(
                top: 40.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff453097),
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff453097)),
                                  borderRadius: BorderRadius.circular(50)),
                              prefixIcon:
                                  Icon(Icons.search, color: Color(0xff453097)),
                              hintText: "بحث ",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                //  padding: const EdgeInsets.all(5.0),
                  itemBuilder: (context, position) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Image.asset('assets/Image/pharmacy.ico'),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff453097),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('${items[position].from}',),
                                      Text(' :البدء',
                                          //  textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )),
                                    ],
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
                                          '${items[position].phone}',
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          '${items[position].address}',
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 16.5, right: 88, left: 35),
                          padding: EdgeInsets.all(1.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xffd7d6e6)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:285),
                          child: Column(
                            children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xff6D6298)
                                    ),
                                    onPressed: () => _navigateToPharmacy(
                                        context, items[position]),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color(0xff6D6298),
                                      ),
                                      onPressed: () => _deletePharmacy(
                                          context,
                                          items[position],
                                          position))
                            ],
                          ),
                        )
                      ],
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xff453097),
        ),
        onPressed: () {
          _createNewPharmacy(context);
        },
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        //   index: 1,
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait,
                color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
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
        color: Color(0xff453097),
        // buttonBackgroundColor: Color(0xff453097),
        backgroundColor: Colors.white,
        //  animationCurve: Curves.easeInOut,
        //  animationDuration: Duration(milliseconds: 600),
        /* onTap: (index) {
          setState(() {
            _page = index;
          });
        },*/
        letIndexChange: (index) => true,
      ),
    );
  }

  _deletePharmacy(BuildContext context, Pharmacy pharmacy, int position) async {
    db.deletePharmacy(pharmacy.id).then((pharmacys) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToPharmacy(BuildContext context, Pharmacy pharmacy) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPharmacy(pharmacy)),
    );

    if (result == 'update') {
      db.getAllPharmacys().then((pharmacys) {
        setState(() {
          items.clear();
          pharmacys.forEach((pharmacy) {
            items.add(Pharmacy.fromMap(pharmacy));
          });
        });
      });
    }
  }

  void _createNewPharmacy(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddPharmacy(Pharmacy('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllPharmacys().then((pharmacys) {
        setState(() {
          items.clear();
          pharmacys.forEach((pharmacy) {
            items.add(Pharmacy.fromMap(pharmacy));
          });
        });
      });
    }
  }
}
