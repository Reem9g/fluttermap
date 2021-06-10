import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app_mab/model/laboratory.dart';
import 'package:flutter_app_mab/ui/AddLab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/utils/database_helper.dart';
import 'home_page.dart';
import 'logIn.dart';

class laboratory extends StatefulWidget {
  @override
  laboratory_laboratoryState createState() => laboratory_laboratoryState();
}

class laboratory_laboratoryState extends State<laboratory> {
  List<Laboratory> items = List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    db.getAllLaboratorys().then((laboratorys){
      setState(() {
        laboratorys.forEach((laboratory){
          items.add(Laboratory.fromMap(laboratory));
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
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff453097),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                ),
              ),
              Positioned(
                top: 50.0,
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
                //  padding: const EdgeInsets.all(15.0),
                  itemBuilder: (context, position) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Image.asset('assets/Image/blood.ico'),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                          padding: EdgeInsets.all(5),
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
                          margin:
                              EdgeInsets.only(top: 20, right: 100, left: 30),
                          padding: EdgeInsets.all(1),
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
                                onPressed: () => _navigateToLaortory(
                                    context, items[position]),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color(0xff6D6298),
                                  ),
                                  onPressed: () => _deleteLabortory(
                                      context,
                                      items[position],
                                      position))
                            ],
                          ),
                        )
                      ],
                    );
                  })
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _createNewLabortory(context);
        },
        backgroundColor: Color(0xff453097),
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

  _deleteLabortory(
      BuildContext context, Laboratory laboratory, int position) async {
    db.deleteLaboratory(laboratory.id).then((laboratorys) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToLaortory(BuildContext context, Laboratory laboratory) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddLab(laboratory)),
    );

    if (result == 'update') {
      db.getAllLaboratorys().then((laboratorys) {
        setState(() {
          items.clear();
          laboratorys.forEach((laboratory) {
            items.add(Laboratory.fromMap(laboratory));
          });
        });
      });
    }
  }

  void _createNewLabortory(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddLab(Laboratory('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllLaboratorys().then((laboratorys) {
        setState(() {
          items.clear();
          laboratorys.forEach((laboratory) {
            items.add(Laboratory.fromMap(laboratory));
          });
        });
      });
    }
  }
}
