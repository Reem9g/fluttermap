import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app_mab/model/center.dart';

class DatabaseHelperCenter{

  final String tableCenter = 'CenterTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnAddress= 'address';
  final String columnFrom = 'from';
  final String columnTo = 'to';
  final String columnPhone= 'phone';
  //final String columnLat = 'lat';
  //final String columnLng = 'lng';
  //final String columnimg = 'img';



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
    String path = join(databasePath , ' centers.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableCenter ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT , [$columnAddress] TEXT ,'
        '[$columnFrom] TEXT ,[$columnTo] TEXT ,[$columnPhone] TEXT,)';
    /*'$columnLat Double ,$columnLng Double, [$columnimg] TEXT'*/
    await db.execute(sql);
  }

// use the model laboratory succ or not
  Future<int> saveCenter(Centerr center) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tableCenter , center.toMap() );
    return result;
  }

// read from DB
  Future<List> getAllCenters() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tableCenter ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,//columnLat,columnLng,columnimg

        ]
    );
    return result.toList();
  }

// read count
  Future<int> getCount() async{
    var dbClient = await db;

    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCenter'));
  }

// select aspecific Laboratory
  Future<Centerr> getCenter(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tableCenter ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,/*columnLat,columnLng,columnimg*/
          ],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Centerr.fromMap(result.first);
    }

    return null;
  }

// update
  Future<int> updateCenter(Centerr center)async{
    var dbClient = await db;
    return await dbClient.update(
        tableCenter , center.toMap(), where: '$columnId = ?',
        whereArgs: [ center.id ]
    );
  }

// delete
  Future<int> deleteCenter(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableCenter ,   where: '$columnId = ?',whereArgs: [id]
    );
  }

//close DB
  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}
