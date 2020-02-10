import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/bloc/movie_favor_bloc.dart';
import 'package:flutter_bloc_example/src/model/movie_favor.dart';
import 'package:flutter_bloc_example/src/model/movie_rank.dart';
import 'package:flutter_bloc_example/src/util/FormatDateUtil.dart';

class Detail extends StatelessWidget {

  final DailyBoxOfficeList detailMovie;

  Detail({Key key, @required this.detailMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailMovie.movieNm),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.white),
            onPressed: favorBloc.saveFavor(
                MovieFavor(
                    rank: detailMovie.rank, rankInten: detailMovie.rankInten,
                    movieNm: detailMovie.movieNm, openDt: detailMovie.openDt,
                    salesAcc: detailMovie.salesAcc, audiAcc: detailMovie.audiAcc,
                    createAt: FormatDateUtil().todayDate()
                )
              ),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('순위 : ${detailMovie.rank}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('순위증감 : ${detailMovie.rankInten}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('개봉일 : ${detailMovie.openDt}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('총관객 : ${detailMovie.audiAcc}명',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('총매출 : ${detailMovie.salesAcc}원',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
        ],
      ),
    );
  }


}