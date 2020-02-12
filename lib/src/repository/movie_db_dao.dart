import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:flutter_bloc_example/src/repository/movie_db_provider.dart';

class MovieDbDAO {

  final dbProvider = MovieDbProvider.dbProvider;

  Future<int> insertFavor(MovieFavor movieFavor) async {
    final db = await dbProvider.database;
    var result = await db.insert(favorTableName, movieFavor.toDatabaseJson());
    return result;
  }

  Future<List<MovieFavor>> selectFavorList() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result = await db.rawQuery('SELECT * FROM $favorTableName');

    List<MovieFavor> favorList = result.isNotEmpty
        ? result.map((item) => MovieFavor.fromDatabaseJson(item)).toList() : [];

    return favorList;
  }

  Future<void> deleteFavor(int id) async {
    final db = await dbProvider.database;
    var response = db.rawDelete('DELETE FROM $favorTableName WHERE id = ?', [id]);
    return response;
  }
}