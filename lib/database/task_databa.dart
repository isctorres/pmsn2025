import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDatabase {
  
  static const NAMEDB = 'TODODB';
  static const VERSIONDB = 1;

  static Database? _database;

  Future<Database> get database async {
    if( _database != null ) return _database!;
    _database = initDatabase();
  }
  
  Future<Database?> initDatabase()async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,NAMEDB);
    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query = 'CREATE TABLE .....';
        db.execute(query);
      },
    );
  }

}