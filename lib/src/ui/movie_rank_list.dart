import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/bloc/movie_rank_bloc.dart';
import 'package:flutter_bloc_example/src/detail.dart';
import 'package:flutter_bloc_example/src/model/movie_rank.dart';

class MovieRankList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RankListState();
  }
}

class RankListState extends State<MovieRankList> {

  final MovieRankBloc rankBloc = MovieRankBloc();

  @override
  void initState() {
    super.initState();
    rankBloc.fetchAllMovies();
  }

  @override
  void dispose() {
    rankBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.rankMovies,
        builder: (context, snapshot) {
          print("ui stream builder : $snapshot");
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<DailyBoxOfficeList>> snapshot) {
    print("buildList snapshot : ${snapshot.toString()}");
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('${snapshot.data[index].movieNm}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(detailMovie: snapshot.data[index]),
              ),
            );
          }
        );
      }
    );
  }
}
