import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home_page.dart';
import 'logIn.dart';

// زر البحث
/**   Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 35),
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  // width: size.width * 0.8,
                  //  height: 50,
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(55.0)),
                    color: Color(0xffffffff).withAlpha(50),
                  ),
                  child: TextField(
                    cursorColor: Color(0xffffffff),
                    decoration: InputDecoration(
                      //  icon: Icon(Icons.search, color: Color(0xff6CECB3)),
                      hintText: 'بحث',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230, top: 35),
                child: Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    child: FlatButton(
                        onPressed: null,
                        child: Icon(
                          Icons.search,
                          color: Color(0xff453097),
                        ))),
              ),
            ],
          ),
* */

class centerCards extends StatelessWidget {
  @override
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
        gridImage: 'assets/Image/center2.jpg',
        text: 'مركز  بستان  القصر'),
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
                        padding: const EdgeInsets.only(left:20.0,right: 20.0),
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height -175,
                          child: StaggeredGridView.count(
                              primary: false,
                              crossAxisCount: 4,
                              staggeredTiles: _cardTile,
                              children: _listTile,
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        // index: 1,
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home()));
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
