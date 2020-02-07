import 'package:flutter_bloc_example/src/model/movie_rank.dart';
import 'package:flutter_bloc_example/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieRankBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<DailyBoxOfficeList>>();

  Stream<List<DailyBoxOfficeList>> get rankMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<DailyBoxOfficeList> movieResultList = await _repository.getRank();
    _moviesFetcher.sink.add(movieResultList);
  }

  dispose() {
    _moviesFetcher.close();
  }
}
final rankBloc = MovieRankBloc();