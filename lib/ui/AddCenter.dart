import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/center.dart';
import 'package:flutter_app_mab/utils/databasee_helper_center.dart';

class AddCenters extends StatefulWidget {
  final Centerr center;

  AddCenters(this.center);

  @override
  createState() => AddCentersState();
}

class AddCentersState extends State<AddCenters> {
  DatabaseHelperCenter db = new DatabaseHelperCenter();
  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _fromController;
  TextEditingController _toController;
  TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.center.name);
    _addressController = new TextEditingController(text: widget.center.address);
    _fromController = new TextEditingController(text: widget.center.from);
    _toController = new TextEditingController(text: widget.center.to);
    _phoneController = new TextEditingController(text: widget.center.phone);
  }

  final scaffoldKeyL = new GlobalKey<ScaffoldState>();
  void _showSnackBar(String text) {
    scaffoldKeyL.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKeyL,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:  Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, top: 40, left: 5.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.home, color: Color(0xff4d36ad)),
                          hintText: '?????? ????????????',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 20, left: 10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        controller: _addressController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_on_rounded,
                              color: Color(0xff4d36ad)),
                          hintText: '?????????? ????????????',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 20, left: 10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone, color: Color(0xff4d36ad)),
                          hintText: '?????? ????????????',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 20, left: 10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        controller: _fromController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon:
                              Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                          hintText: '??????????',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 20, left: 10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        controller: _toController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon:
                              Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                          hintText: '????????????????',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 100, right: 100, top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff4d36ad)),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: (widget.center.id != null)
                              ? Text(
                                  '??????????',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )
                              : Text(
                                  '??????',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                      onTap: () {
                        if (widget.center.id != null && _nameController.text.isNotEmpty
                            && _addressController.text.isNotEmpty && _phoneController.text.isNotEmpty
                            && _fromController.text.isNotEmpty && _toController.text.isNotEmpty ) {
                          db.updateCenter(Centerr.fromMap({
                            'id': widget.center.id,
                            'name': _nameController.text,
                            'address': _addressController.text,
                            'from': _fromController.text,
                            'to': _toController.text,
                            'phone': _phoneController.text
                          }))
                              .then((_) {
                            Navigator.pop(context, 'update');
                          });
                        } else if( _nameController.text.isNotEmpty
                        && _addressController.text.isNotEmpty && _phoneController.text.isNotEmpty
                            && _fromController.text.isNotEmpty && _toController.text.isNotEmpty ){
                          db.saveCenter(Centerr(
                                  _nameController.text,
                                  _addressController.text,
                                  _fromController.text,
                                  _toController.text,
                                  _phoneController.text))
                              .then(
                            (_) {
                              Navigator.pop(context, 'save');
                            },
                          );
                        }
                        else{
                          _showSnackBar('?????? ?????? ???????? ??????????????????');
                        }
                      })
                ]
              )),
            )

    );
  }
}
