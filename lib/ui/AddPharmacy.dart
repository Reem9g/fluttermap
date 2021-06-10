import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/pharmacy.dart';
import 'package:flutter_app_mab/utils/database_helper_phar.dart';
import 'home_page.dart';
import 'logIn.dart';

class AddPharmacy extends StatefulWidget {
  final Pharmacy pharmacy;

  AddPharmacy(this.pharmacy);

  @override
  createState() => AddPharmacyState();
}

class AddPharmacyState extends State<AddPharmacy> {

  DatabaseHelperPhar db = new DatabaseHelperPhar();

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _fromController;
  TextEditingController _toController;
  TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.pharmacy.name);
    _addressController = new TextEditingController(text: widget.pharmacy.address);
    _fromController = new TextEditingController(text: widget.pharmacy.from);
    _toController = new TextEditingController(text: widget.pharmacy.to);
    _phoneController = new TextEditingController(text: widget.pharmacy.phone);
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, top: 40, left: 5.0),
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        controller: _nameController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.home, color: Color(0xff4d36ad)),
                          hintText: 'اسم الصيدلية',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
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
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        controller: _addressController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_on_rounded,
                              color: Color(0xff4d36ad)),
                          hintText: 'عنوان الصيدلية',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
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
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        controller: _phoneController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone, color: Color(0xff4d36ad)),
                          hintText: 'رقم الصيدلية',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
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
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        controller: _fromController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon:
                          Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                          hintText: 'البدء',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
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
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        controller: _toController,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon:
                          Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                          hintText: 'الانتهاء',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
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
                              //  borderRadius: BorderRadius.all(Radius.circular(33)),
                              color: Color(0xff4d36ad)),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: (widget.pharmacy.id != null)
                              ? Text(
                            'تعديل',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                              : Text(
                            'حفظ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (widget.pharmacy.id != null) {
                          db
                              .updatePharmacy(Pharmacy.fromMap({
                            'id': widget.pharmacy.id,
                            'name': _nameController.text,
                            'address': _addressController.text,
                            'from': _fromController.text,
                            'to': _toController.text,
                            'phone': _phoneController.text
                          }))
                              .then((_) {
                            Navigator.pop(context, 'update');
                          });
                        } else {
                          db
                              .savePharmacy(Pharmacy(
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
                      })
                ],
              )
          )
        ],
      ),
    );
  }
}
