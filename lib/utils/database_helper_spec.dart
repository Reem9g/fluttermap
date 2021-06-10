import 'dart:async';
import 'package:flutter_app_mab/model/spcialized.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperSpec{

  final String tableSpcialized = 'SpcializedTable';
  final String columnId = 'id';
  final String columnName = 'name';
  //final String columnLng = 'img';


  static Database _db ;

  Future<Database> get db async{
    if(_db != null){
      return _db ;
    }
    _db = await initDb();

    return _db;
  }

  initDb()async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , 'spcializeds.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableSpcialized ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT )';
    /*'$columnimg TEXT*/
    await db.execute(sql);
  }


  Future<int> saveSpcialized(Spcialized spcialized) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tableSpcialized , spcialized.toMap() );
    return result;
  }


  Future<List> getAllspcialized() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tableSpcialized ,
        columns: [columnId,
          columnName //columnimg
        ]
    );
    return result.toList();
  }


  Future<int> getCount() async{
    var dbClient = await db;

    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableSpcialized'));
  }


  Future<Spcialized> getspcialized(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tableSpcialized ,
        columns: [columnId, columnName /*columnimg*/],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Spcialized.fromMap(result.first);
    }

    return null;
  }

  Future<int> updateSpcialized(Spcialized spcialized)async{
    var dbClient = await db;
    return await dbClient.update(
        tableSpcialized , spcialized.toMap(), where: '$columnId = ?',whereArgs: [ spcialized.id ]
    );
  }


  Future<int> deleteSpcialized(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableSpcialized ,   where: '$columnId = ?',whereArgs: [id]
    );
  }


  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }


}
