import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:remind_me/Services/model/categorie.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnexion {
  setDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqlite.db');

    var database =
        await openDatabase(path, version: 1, onCreate: _creatingDatabase);
    return database;
  }

  _creatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");
  }
}
/*
class DatabaseConnexion {

  setDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'db_todolist_sqlite.db'),
      onCreate: (Database db, int version) {
        return db.execute(
          "CREATE TABLE categories(id TEXT PRIMARY KEY, name TEXT, description TEXT)",
        );
      },
      version: 1,
    );

  }
  }
*/