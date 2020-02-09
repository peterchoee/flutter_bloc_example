import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/bloc/movie_favor_bloc.dart';
import 'package:flutter_bloc_example/src/model/movie_favor.dart';

class MovieFavorList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavorListState();
  }
}

class FavorListState extends State<MovieFavorList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: favorBloc.fetchAllFavor(),
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
    print("buildList snapshot : ${snapshot.toString()}");
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text('${snapshot.data[index].movieNm}'),
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    favorBloc.fetchAllFavor();
  }

  @override
  void dispose() {
    favorBloc.dispose();
    super.dispose();
  }
}