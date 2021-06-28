class Doctor{

  int _id;
  String _name;
  String _address;
  String _from;
  String _to;
  String _phone;
  String _about;
  String _spec;
  //double _lat;
  //double _lng;


  Doctor(
      this._name, this._address, this._from,
      this._to, this._phone,this._about,this._spec
      //this._lat, this._lng

      );

  //seter
  Doctor.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._address = obj['address'];
    this._from = obj['from'];
    this._to = obj['to'];
    this._phone = obj['phone'];
    this._about = obj['about'];
    this._spec = obj['spec'];

    //this._lat = obj['lat'];
    //this._lng = obj['lng'];


  }

  //geter
  int get id => _id;
  String get name => _name;
  String get address => _address;
  String get from => _from;
  String get to => _to;
  String get phone => _phone;
  String get about => _about;
  String get spec => _spec;

  //double get lat => _lat;
  //double get lng => _lng;




  // the info from user to map
  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;
    }

    map['name'] = _name;
    map['address'] = _address;
    map['from'] = _from;
    map['to'] = _to;
    map['phone'] = _phone;
    map['about'] = _about;
    map['spec'] = _spec;

    //map['lat'] = _lat;
    // map['lng'] = _lng;

    return map;
  }
  Doctor.fromMap(Map<String , dynamic> map){

    this._id = map['id'] ;
    this._name = map['name']  ;
    this._address = map['address'] ;
    this._from  = map['from']   ;
    this._to = map['to'] ;
    this._phone = map['phone'] ;
    this._about  = map['about']   ;
    this._spec  = map['spec']   ;

    // this._lat  = map['lat'];
    //this._lng  = map['lng']   ;
  }

}