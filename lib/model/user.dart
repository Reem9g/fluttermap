class User {
  String _number;
  String _username;
  String _password;
  String _flaglogged;



  User(this._number, this._username, this._password, this._flaglogged);

  User.map(dynamic obj) {
    this._number = obj['number'];
    this._username = obj['username'];
    this._password = obj['password'];
    this._flaglogged = obj['password'];
  }

  String get number => _number;
  String get username => _username;
  String get password => _password;
  String get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["number"] = _number;
    map["username"] = _username;
    map["password"] = _password;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}
