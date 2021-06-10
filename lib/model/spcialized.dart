class Spcialized{

  int _id;
  String _name;
  //String _img;


  Spcialized(
      this._name, //this._img
   );

  Spcialized.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    //this._img = obj['img'];

  }

  int get id => _id;
  String get name => _name;
  //String get img => _img;



  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;
    }

    map['name'] = _name;
    // map['img'] = _img;


    return map;
  }

  Spcialized.fromMap(Map<String , dynamic> map){

    this._id = map['id'] ;
    this._name = map['name']  ;
    //this._img  = map['_mg']   ;

  }

}