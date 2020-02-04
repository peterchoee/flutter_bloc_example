import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/ui/rank_list.dart';

class HomeRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: RankList(),
      ),
    );
  }
}