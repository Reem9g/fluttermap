import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app_mab/model/doctor.dart';

class DatabaseHelperDoctor{

  final String tableDoctor = 'DoctorTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnAddress= 'address';
  final String columnFrom = 'from';
  final String columnTo = 'to';
  final String columnPhone= 'phone';
  final String columnAbout= 'about';

  //final String columnLat = 'lat';
  //final String columnLng = 'lng';



  static Database _db ;

  // if DB is here or not
  Future<Database> get db async{
    if(_db != null){
      return _db ;
    }
    _db = await initDb();

    return _db;
  }

  // create DB
  initDb()async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , ' doctors.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableDoctor ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT , [$columnAddress] TEXT ,'
        '[$columnFrom] TEXT ,[$columnTo] TEXT ,[$columnPhone] TEXT,[$columnAbout] TEXT)';
    /*'$columnLat Double ,$columnLng Double'*/
    await db.execute(sql);
  }

// use the model laboratory succ or not
  Future<int> saveDoctor(Doctor doctor) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tableDoctor , doctor.toMap() );
    return result;
  }

// read from DB
  Future<List> getAllDoctors() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tableDoctor ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,columnAbout//columnLat,columnLng
        ]
    );
    return result.toList();
  }

// read count
  Future<int> getCount() async{
    var dbClient = await db;

    return Sqflite.firstIntValue(await dbClient.rawQuery(
        'SELECT COUNT(*) FROM $tableDoctor'));
  }

// select aspecific Laboratory
  Future<Doctor> getDoctor(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tableDoctor ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,columnAbout/*columnLat,columnLng*/],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Doctor.fromMap(result.first);
    }

    return null;
  }

// update
  Future<int> updateDoctor(Doctor doctor)async{
    var dbClient = await db;
    return await dbClient.update(
        tableDoctor , doctor.toMap(), where: '$columnId = ?',
        whereArgs: [ doctor.id ]
    );
  }

// delete
  Future<int> deleteDoctor(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableDoctor ,   where: '$columnId = ?',whereArgs: [id]
    );
  }

//close DB
  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}