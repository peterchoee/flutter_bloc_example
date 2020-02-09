import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import '../model/movie_rank.dart';
import 'movie_api_provider.dart';
import 'movie_db_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();

  final movieDbProvider = MovieDbProvider();

  Future<List<DailyBoxOfficeList>> getRank() => movieApiProvider.fetchMovieRank();

  Future<MovieFavor> setFavor(MovieFavor movieFavor) => movieDbProvider.insertFavor(movieFavor);

  Future<List<MovieFavor>> getFavorList() => movieDbProvider.selectFavorList();

  Future<void> deleteFavor(int id) => movieDbProvider.deleteFavor(id);
}