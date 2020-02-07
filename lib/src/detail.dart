import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/model/movie_rank.dart';

class Detail extends StatelessWidget {

  // Declare a field that holds the Todo.
  final DailyBoxOfficeList detailMovie;

  // In the constructor, require a Todo.
  Detail({Key key, @required this.detailMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailMovie.movieNm),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(detailMovie.movieCd),
      ),
    );
  }
}