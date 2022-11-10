import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Model {
  Future<Database> createDatabase() async {
    // First create database
    // Then Create Table

    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Register.db');

    print("Database Path : $path");  //data/user/0/com.example.text_field/databases/Register.db


    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE register (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, contact TEXT, Password TEXT, conf_Pass TEXT, Date TEXT)');
    });
    print("Database : $database");   // Database : 1 /data/user/0/com.example.text_field/databases/Register.db

    return database;
  }
}
