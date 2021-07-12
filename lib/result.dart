import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int hits;
  final int misses;

  ResultPage({this.hits = 0, this.misses = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Results are :'),
        ),
        body: Center(child: Text('Your Score is : ${hits*200 -  misses*50}', style: TextStyle(fontSize: 30),),),
    );
  }
}
