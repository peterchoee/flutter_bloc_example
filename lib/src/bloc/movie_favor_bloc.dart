import 'dart:async';

import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:flutter_bloc_example/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieFavorBloc {

  final _repository = Repository();
  final _favorController = StreamController<List<MovieFavor>>.broadcast();

  get favors => _favorController.stream;
  Stream<List<MovieFavor>> get getAllFavor => _favorController.stream;

  fetchAllFavor() async {
    List<MovieFavor> movieResultList = await _repository.getFavorList();
    _favorController.sink.add(movieResultList);
  }

  saveFavor(MovieFavor movieFavor) async {
    print("saveFavar : $movieFavor");
    await _repository.setFavor(movieFavor);
  }

  deleteFavor(int id) async {
    await _repository.deleteFavor(id);
  }

  dispose() {
    _favorController.close();
  }
}
final favorBloc = MovieFavorBloc();
