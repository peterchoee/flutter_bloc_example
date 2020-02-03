import 'package:flutter_bloc_example/src/model/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/movie_result_model.dart';

class Repository {

  // 데이터베이스를 열고 참조 값을 얻습니다.
  final Future<Database> database = openDatabase(
    // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
    // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
    join(await getDatabasesPath(), 'user_movie.db'),
      onCreate: (db, version) {
        // 데이터베이스에 CREATE TABLE 수행
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
          );
        },
        // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
        // 수행하기 위한 경로를 제공합니다.
        version: 1,

  );
  Future<void> insertDog(Movie movie) async {
    // 데이터베이스 reference를 얻습니다.
    final Database db = await database;

    // Dog를 올바른 테이블에 추가하세요. 또한
    // `conflictAlgorithm`을 명시할 것입니다. 본 예제에서는
    // 만약 동일한 dog가 여러번 추가되면, 이전 데이터를 덮어쓸 것입니다.
    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Movie>> movies() async {
    // 데이터베이스 reference를 얻습니다.
    final Database db = await database;

    // 모든 Dog를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('movies');

    // List<Map<String, dynamic>를 List<Dog>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Movie(
        id: maps[i]['id'],
      );
    });
  }

  Future<void> updateDog(Movie movie) async {
    // 데이터베이스 reference를 얻습니다.
    final db = await database;

    // 주어진 Dog를 수정합니다.
    await db.update(
      'dogs',
      movie.toMap(),
      // Dog의 id가 일치하는 지 확인합니다.
      where: "id = ?",
      // Dog의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [movie.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // 데이터베이스 reference를 얻습니다.
    final db = await database;

    // 데이터베이스에서 Dog를 삭제합니다.
    await db.delete(
      'dogs',
      // 특정 dog를 제거하기 위해 `where` 절을 사용하세요
      where: "id = ?",
      // Dog의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [id],
    );
  }
}