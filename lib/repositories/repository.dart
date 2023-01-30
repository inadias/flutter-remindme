import 'package:remind_me/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';
class Repository{
  var _databaseConnexion;

 Repository(){
    _databaseConnexion= DatabaseConnexion();
  }
  static Database? _database;

  Future<Database?>get database async{
    if(_database != null )return _database;
    _database = await _databaseConnexion.setDatabase();
    return _database;
  }
  insertData(table,data)async{
    final connection =await database;
    return await connection?.insert(table, data);


  }

  readData(table)async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(table);
    return List.generate(maps.length, (i) {
      return table(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['description'],

      );
    });

    //return await db!.query(table);
  }


}