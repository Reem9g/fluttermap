import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/doctor.dart';
import 'package:flutter_app_mab/utils/database_helper_doctor.dart';

class AddDoctors extends StatefulWidget {
  final Doctor doctor;

  AddDoctors(this.doctor);
  @override
  createState() => AddDoctorsState();
}

class AddDoctorsState extends State<AddDoctors> {
  DatabaseHelperDoctor db = new DatabaseHelperDoctor();
  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _fromController;
  TextEditingController _toController;
  TextEditingController _phoneController;
  TextEditingController _about;


  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.doctor.name);
    _addressController = new TextEditingController(text: widget.doctor.address);
    _fromController = new TextEditingController(text: widget.doctor.from);
    _toController = new TextEditingController(text: widget.doctor.to);
    _phoneController = new TextEditingController(text: widget.doctor.phone);
    _about = new TextEditingController(text: widget.doctor.about);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
              child: SingleChildScrollView(
                  child:Column(
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
                            controller: _nameController,
                            textAlign: TextAlign.right,
                            cursorColor: Color(0xff4d36ad),
                            decoration: InputDecoration(
                              icon: Icon(Icons.home, color: Color(0xff4d36ad)),
                              hintText: 'اسم الطبيب',
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
                              hintText: 'عنوان الطبيب',
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
                              hintText: 'رقم الطبيب',
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
                            controller: _fromController,
                            textAlign: TextAlign.right,
                            cursorColor: Color(0xff4d36ad),
                            decoration: InputDecoration(
                              icon:
                              Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                              hintText: 'البدء',
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
                            controller: _toController,
                            textAlign: TextAlign.right,
                            cursorColor: Color(0xff4d36ad),
                            decoration: InputDecoration(
                              icon:
                              Icon(Icons.timer_outlined, color: Color(0xff4d36ad)),
                              hintText: 'الانتهاء',
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
                            keyboardType: TextInputType.multiline,
                            controller: _about,
                            textAlign: TextAlign.right,
                            cursorColor: Color(0xff4d36ad),
                            decoration: InputDecoration(
                              icon:
                              Icon(Icons.account_box, color: Color(0xff4d36ad)),
                              hintText: 'حول',
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
                              child: (widget.doctor.id != null)
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
                            if (widget.doctor.id != null) {
                              db.updateDoctor(Doctor.fromMap({
                                'id': widget.doctor.id,
                                'name': _nameController.text,
                                'address': _addressController.text,
                                'from': _fromController.text,
                                'to': _toController.text,
                                'phone': _phoneController.text,
                                'about': _about.text,
                              }))
                                  .then((_) {
                                Navigator.pop(context, 'update');
                              });
                            } else {
                              db.saveDoctor(Doctor(
                                  _nameController.text,
                                  _addressController.text,
                                  _fromController.text,
                                  _toController.text,
                                  _phoneController.text,
                                _about.text
                              ))
                                  .then(
                                    (_) {
                                  Navigator.pop(context, 'save');
                                },
                              );
                            }
                          })
                    ],
                  )
              ),
            ),
      )
    );
  }
}
