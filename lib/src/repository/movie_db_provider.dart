import 'dart:io';

import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final databaseName = 'MovieFavor.db';
final favorTableName = 'favor';
class MovieDbProvider {

  static final MovieDbProvider dbProvider = MovieDbProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, databaseName);

    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $favorTableName ("
        "id INTEGER PRIMARY KEY, "
        "rank TEXT, "
        "rankInten TEXT, "
        "movieNm TEXT, "
        "openDt TEXT, "
        "salesAcc TEXT, "
        "audiAcc TEXT, "
        "createAt TEXT"
        ")");
  }
}