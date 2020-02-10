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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: rankBloc.rankMovies,
        builder: (context, snapshot) {
          //print("ui stream builder : $snapshot");
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
    //print("buildList snapshot : ${snapshot.toString()}");
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
          color: Colors.black),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          leading: Container(
            width: 40, // can be whatever value you want
            alignment: Alignment.center,
            child: Text('${snapshot.data[index].rank}'),
          ),
          title: Text('${snapshot.data[index].movieNm}'),
          subtitle: Text('${snapshot.data[index].rankInten}'),
          trailing: Icon(Icons.arrow_forward_ios),
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
}
