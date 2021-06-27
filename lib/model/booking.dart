class Bookings{

  int _id;
  String _name;
  String _time;
  String _date;
  String _nameDoctor;



  Bookings(
      this._name, this._date,this._time,this._nameDoctor
      );

  //seter
  Bookings.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
   this._time = obj['time'];
   this._date = obj['date'];
    this._nameDoctor = obj['nameDoctor'];



  }

  //geter
  int get id => _id;
  String get name => _name;
  String get time => _time;
  String get date => _date;
  String get nameDoctor => _nameDoctor;




  // the info from user to map
  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;
    }

    map['name'] = _name;
    map['date'] = _date;
    map['time'] = _time;
    map['nameDoctor'] = _nameDoctor;


    return map;
  }
  Bookings.fromMap(Map<String , dynamic> map){

    this._id = map['id'] ;
    this._name = map['name'] ;
    this._time = map['time'];
    this._date = map['date'];
    this._nameDoctor = map['nameDoctor'];

  }
}