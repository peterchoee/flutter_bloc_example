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
                Tab(icon: Icon(Icons.apps)),
                Tab(icon: Icon(Icons.archive)),
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