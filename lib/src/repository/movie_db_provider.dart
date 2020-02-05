import 'dart:io';

import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String databaseName = 'user_favor_movie.db';
final String tableName = 'FAVOR_MOVIE';

class MovieDbProvider {

  MovieDbProvider._();
  static final MovieDbProvider _db = MovieDbProvider._();
  factory MovieDbProvider() => _db;

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
        }
    );
  }

  Future<void> insertMovie(MovieFavor movie) async {
    final db = await database;
    var response = await db.rawInsert('INSERT INTO $tableName(*) VALUES(?)', [movie]);
    return response;
  }

  Future<List<MovieFavor>> selectMovieList(String movieCd) async {
    final db = await database;
    var response = await db.rawQuery('SELECT * FROM $tableName WHERE movieCd = ?', [movieCd]);
    return response.isNotEmpty ? MovieFavor(movieCd: response.first['movieCd'], movieNm: response.first['movieNm']) : Null;
  }

  Future<void> deleteMovie(String movieCd) async {
    final db = await database;
    var response = db.rawDelete('DELETE FROM $tableName WHERE movieCd = ?', [movieCd]);
    return response;
  }
}