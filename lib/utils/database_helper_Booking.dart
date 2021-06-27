import 'dart:async';
import 'package:flutter_app_mab/model/booking.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelperBooking{

  final String tableBooking = 'BookingTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnTime= 'time';
  final String columnDate = 'date';
  final String columnNameDoctor = 'nameDoctor';



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
    String path = join(databasePath , 'booking.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableBooking ([$columnId] INTEGER PRIMARY KEY,'
        '[$columnName] TEXT , [$columnTime] TEXT ,'
        '[$columnDate] TEXT,[$columnNameDoctor] TEXT )';
    /*'$columnLat Double ,$columnLng Double*/
    await db.execute(sql);
  }

// use the model laboratory succ or not
  Future<int> saveBooking(Bookings booking) async{
    var dbClient = await db;
    var result = await dbClient.insert( tableBooking , booking.toMap() );
    return result;
  }

// read from DB
  Future<List> getAllBookings() async{
    var dbClient = await db;
    var result = await dbClient.query(
        tableBooking ,
        columns: [columnId,
          columnName,columnTime,
          columnDate,columnNameDoctor
        ]
    );
    return result.toList();
  }

// read count
  Future<int> getCount() async{
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableBooking'));
  }

// select aspecific Laboratory
  Future<Bookings> getBooking(int id) async{
    var dbClient = await db;
    List<Map> result = await dbClient.query(
        tableBooking ,
        columns: [columnId,
          columnName,columnTime,
          columnDate,columnNameDoctor],where: '$columnId = ?',whereArgs: ['id']
    );

    if(result.length > 0){
      return new Bookings.fromMap(result.first);
    }

    return null;
  }

// update
  Future<int> updateBooking(Bookings booking)async{
    var dbClient = await db;
    return await dbClient.update(
        tableBooking , booking.toMap(), where: '$columnId = ?',
        whereArgs: [ booking.id ]
    );
  }

// delete
  Future<int> deleteBooking(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableBooking ,   where: '$columnId = ?',whereArgs: [id]
    );
  }

//close DB
  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}
