import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/bloc/movie_favor_bloc.dart';
import 'package:flutter_bloc_example/src/model/movie_favor.dart';

import '../bloc/movie_favor_bloc.dart';
import '../detail.dart';
import '../model/movie_rank.dart';
import '../util/FormatDateUtil.dart';

class MovieFavorList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavorListState();
  }
}

class FavorListState extends State<MovieFavorList> {

  @override
  Widget build(BuildContext context) {
    favorBloc.fetchAllFavor();
    return Scaffold(
      body: StreamBuilder(
        stream: favorBloc.getAllFavor,
        builder: (context, snapshot) {
          print("ui stream builder : $snapshot");
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot == null) {
            return Text("저장한 영화가 없습니다.", textAlign: TextAlign.center);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<MovieFavor>> snapshot) {
    //print("buildList snapshot : ${snapshot.toString()}");
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
            color: Colors.black),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = snapshot.data[index];
          return Dismissible(
            key: Key(item.id.toString()),
            child: ListTile(
              title: Text('${snapshot.data[index].movieNm}'),
              subtitle: Text('저장일: ${FormatDateUtil().formattedDate(snapshot.data[index].createAt)} | 순위: ${snapshot.data[index].rank}'),
            ),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              setState(() {
                favorBloc.deleteFavor(item.id);
              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("${item.movieNm} 삭제완료")));
            },
          );
        }
    );
    /*return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = snapshot.data[index];
          return Dismissible(
            key: Key(item.id.toString()),
            child: ListTile(
              title: Text('${snapshot.data[index].movieNm}'),
            ),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              setState(() {
                favorBloc.deleteFavor(item.id);
              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("${item.movieNm} 삭제완료")));
            },
          );
        }
    );*/
  }
}