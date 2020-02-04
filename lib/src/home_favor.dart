import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/ui/favor_list.dart';

class HomeFavor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: FavorList(),
      ),
    );
  }
}