import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import '../model/movie_result.dart';
import 'movie_api_provider.dart';
import 'movie_db_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();

  final movieDbProvider = MovieDbProvider();

  Future<MovieResult> fetchRankMovie() => movieApiProvider.fetchMovieResult();

  Future<MovieFavor> saveFavor(MovieFavor movieFavor) => movieDbProvider.insertMovie(movieFavor);

  Future<List<MovieFavor>> fetchFavorList(String movieCd) => movieDbProvider.selectMovieList(movieCd);

  Future<void> deleteFavor(String movieCd) => movieDbProvider.deleteMovie(movieCd);
}