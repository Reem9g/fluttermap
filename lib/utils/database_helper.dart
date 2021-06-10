import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app_mab/model/laboratory.dart';
//import 'package:path_provider/path_provider.dart';
class DatabaseHelper{

  final String tableLaboratory = 'LaboratoryTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnAddress= 'address';
  final String columnFrom = 'from';
  final String columnTo = 'to';
  final String columnPhone= 'phone';
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
    String path = join(databasePath , 'laboratorys.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableLaboratory ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT , [$columnAddress] TEXT ,'
        '[$columnFrom] TEXT ,[$columnTo] TEXT ,[$columnPhone] TEXT)';
        /*'$columnLat Double ,$columnLng Double*/
    await db.execute(sql);
  }

// use the model laboratory succ or not
  Future<int> saveLaboratory(Laboratory laboratory) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tableLaboratory , laboratory.toMap() );
    return result;
  }

// read from DB
  Future<List> getAllLaboratorys() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tableLaboratory ,
        columns: [columnId,
        columnName,columnAddress,
        columnFrom,columnTo,
        columnPhone,//columnLat,columnLng
        ]
    );
    return result.toList();
  }

// read count
  Future<int> getCount() async{
    var dbClient = await db;

    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableLaboratory'));
  }

// select aspecific Laboratory
  Future<Laboratory> getLaboratory(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tableLaboratory ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,/*columnLat,columnLng*/],where: '$columnId = ?',whereArgs: ['id']
    );

       if(result.length > 0){
         return new Laboratory.fromMap(result.first);
       }

    return null;
  }

// update
  Future<int> updateLaboratory(Laboratory laboratory)async{
    var dbClient = await db;
    return await dbClient.update(
        tableLaboratory , laboratory.toMap(), where: '$columnId = ?',
        whereArgs: [ laboratory.id ]
    );
  }

// delete
  Future<int> deleteLaboratory(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableLaboratory ,   where: '$columnId = ?',whereArgs: [id]
    );
  }

//close DB
  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}
