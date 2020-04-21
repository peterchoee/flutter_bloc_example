import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:flutter_bloc_example/src/repository/movie_db_dao.dart';
import '../model/movie_rank.dart';
import 'movie_api_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();

  final movieDao = MovieDbDAO();

  Future<List<DailyBoxOfficeList>> getRank() => movieApiProvider.fetchMovieRank();

  Future<int> setFavor(MovieFavor movieFavor) => movieDao.insertFavor(movieFavor);

  Future<List<MovieFavor>> getFavorList() => movieDao.selectFavorList();

  Future<void> deleteFavor(int id) => movieDao.deleteFavor(id);
}