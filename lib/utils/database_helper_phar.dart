import 'dart:async';
import 'package:flutter_app_mab/model/pharmacy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelperPhar{

  final String tablePharmacy = 'PharmacyTable';
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
    String path = join(databasePath , 'pharmacy.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tablePharmacy ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT , [$columnAddress] TEXT ,'
        '[$columnFrom] TEXT ,[$columnTo] TEXT ,[$columnPhone] TEXT)';
    /*'$columnLat Double ,$columnLng Double*/
    await db.execute(sql);
  }

// use the model laboratory succ or not
  Future<int> savePharmacy(Pharmacy pharmacy) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tablePharmacy , pharmacy.toMap() );
    return result;
  }

// read from DB
  Future<List> getAllPharmacys() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tablePharmacy ,
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

    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tablePharmacy'));
  }

// select aspecific Pharmacy
  Future<Pharmacy> getPharmacy(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tablePharmacy ,
        columns: [columnId,
          columnName,columnAddress,
          columnFrom,columnTo,
          columnPhone,/*columnLat,columnLng*/],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Pharmacy.fromMap(result.first);
    }

    return null;
  }

// update
  Future<int> updatePharmacy(Pharmacy pharmacy)async{
    var dbClient = await db;
    return await dbClient.update(
        tablePharmacy , pharmacy.toMap(), where: '$columnId = ?',
        whereArgs: [ pharmacy.id ]
    );
  }

// delete
  Future<int> deletePharmacy(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tablePharmacy ,   where: '$columnId = ?',whereArgs: [id]
    );
  }

//close DB
  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}
