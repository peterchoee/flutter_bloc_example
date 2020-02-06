import 'package:flutter_bloc_example/src/model/movie_result.dart';
import 'package:flutter_bloc_example/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieResult>();

  Stream<MovieResult> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MovieResult itemModel = await _repository.fetchRankMovie();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MovieBloc();