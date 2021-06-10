import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app_mab/utils/databasee_helper_center.dart';
import 'package:flutter_app_mab/model/center.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:flutter_app_mab/ui/AddCenter.dart';

class centerCards extends StatefulWidget {
  @override
  centerCards_state createState() => centerCards_state();
}

class centerCards_state extends State<centerCards> {
  List<Centerr> items = List();
  DatabaseHelperCenter db = new DatabaseHelperCenter();

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

  List<StaggeredTile> _cardTile = const <StaggeredTile>[
    const StaggeredTile.count(5, 2.5),
    StaggeredTile.count(2, 4),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
  ];

//List of Cards with color and icon

  List<Widget> _listTile = const <Widget>[
    const _BackGroundTile(
        gridImage: 'assets/Image/center1.jpg',
        text: 'مركز                                           الفرقان'),
    const _BackGroundTile(
        gridImage: 'assets/Image/center2.jpg', text: 'مركز  بستان  القصر'),
    const _BackGroundTile(
        gridImage: 'assets/Image/center3.jpg', text: 'مركز           المرديان'),
    const _BackGroundTile(
        gridImage: 'assets/Image/center4.jpg',
        text: 'مركز                    حلب الجديدة'),
    const _BackGroundTile(
        gridImage: 'assets/Image/center5.jpg', text: 'مركز الشهباء'),
    const _BackGroundTile(
        gridImage: 'assets/Image/center6.jpg', text: 'مركز الشعار'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
          Container(
              height: MediaQuery.of(context).size.height - 175,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height - 175,
                          child:StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                              itemCount: 10,
                              itemBuilder: (BuildContext context , int index) =>
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage('https://picsum.photos/500/500?random=$index'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Text('${items[index].name}')
                                  ),
                              staggeredTileBuilder: (int index)=>
                                  StaggeredTile.count(2, index.isEven ? 3:2),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0
                            /* primary: false,
                              crossAxisCount: 4,
                              staggeredTiles: _cardTile,
                              children: _listTile,
                              */
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _createNewLabortoryCenter(context);
        },
        backgroundColor: Color(0xff453097),
      ),
      bottomNavigationBar: CurvedNavigationBar(
//  key: _bottomNavigationKey,
// index: 1,
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
/*  onTap: (index) {
          setState(() {
            _page = index;
          });
        },*/
        letIndexChange: (index) => true,
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


class _BackGroundTile extends StatelessWidget {
  const _BackGroundTile({this.backgroundColor, this.gridImage, this.text});

  final Color backgroundColor;
  final gridImage;
  final text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(fit: StackFit.expand, children: <Widget>[
        Image.asset(
          gridImage,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ]),
    );
  }
}
