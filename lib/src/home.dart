import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/home_rank.dart';
import 'package:flutter_bloc_example/src/home_favor.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: '영화 순위'),
                Tab(text: '저장한 영화'),
              ],
            ),
            title: Text('BLOC Example'),
          ),
          body: TabBarView(
            children: [
              HomeRank(),
              HomeFavor(),
            ],
          ),
        ),
      ),
    );
  }
}