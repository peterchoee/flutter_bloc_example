import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:flutter_bloc_example/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieFavorBloc {

  final _repository = Repository();
  final _favorFetcher = PublishSubject<List<MovieFavor>>();

  Stream<List<MovieFavor>> get rankMovies => _favorFetcher.stream;

  fetchAllFavor() async {
    List<MovieFavor> movieResultList = await _repository.getFavorList();
    _favorFetcher.sink.add(movieResultList);
  }

  saveFavor(MovieFavor movieFavor) async {
    await _repository.setFavor(movieFavor);
  }

  deleteFavor(int id) async {
    await _repository.deleteFavor(id);
  }

  dispose() {
    _favorFetcher.close();
  }
}
final favorBloc = MovieFavorBloc();
