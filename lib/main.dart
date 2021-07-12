import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool create = true;

  void _myFunction() {
    setState(() {
      balls = generator!.getBallList();
    });
  }

  double positionLeft1 = 200;
  double positionTop1 = 50;
  List<Widget> balls = [];
  ListGenerator? generator;

  final AppBar appBar = AppBar(
    centerTitle: true,
    title: Text('Aim Booster'),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (create) {
      generator = ListGenerator(
          count: 3,
          setState: _myFunction,
          screenHeight: screenHeight,
          screenWidth: screenWidth);
      balls = generator!.getBallList();
      create = false;
    }

    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print('wrong on tapped');
      },
      onTapDown: (e){
        print('wrong on tap down!');
      },
      child: Scaffold(
        appBar: appBar,
        body: Stack(
          fit: StackFit.expand,
          children:
              // [
              balls,
          //   Positioned(
          //       left: 0,
          //       top: height-100,
          //       child: ClipOval(
          //         child: Material(
          //           color: Colors.blue, // Button color
          //           child: InkWell(
          //             splashColor: Colors.red, // Splash color
          //             onTap: () {
          //               print('width is : $width');
          //               print('height is : $height');
          //             },
          //             child: SizedBox(width: 100, height: 100),
          //           ),
          //         ),
          //       )),
          //   Positioned(
          //       left: width-100,
          //       top: 400,
          //       child: ClipOval(
          //         child: Material(
          //           color: Colors.blue, // Button color
          //           child: InkWell(
          //             splashColor: Colors.red, // Splash color
          //             onTap: () {
          //               print('width is : $width');
          //               print('height is : $height');
          //             },
          //             child: SizedBox(width: 100, height: 100),
          //           ),
          //         ),
          //       )),
          // ],
        ),
      ),
    );
  }
}

class ListGenerator {
  int count;
  double screenWidth;
  double screenHeight;
  double ballWidth;
  double ballHeight;
  late final List<double> tops;
  late final List<double> lefts;
  Function setState;

  ListGenerator(
      {this.count = 1,
      this.ballWidth = 75,
      this.ballHeight = 75,
      required this.setState,
      required this.screenHeight,
      required this.screenWidth}) {
    tops = [];
    lefts = [];
    for (int i = 0; i < count; i++) {
      tops.add(
          Random().nextInt((screenHeight - ballHeight).toInt()).toDouble());
      lefts.add(Random().nextInt((screenWidth - ballWidth).toInt()).toDouble());
    }
  }

  List<Widget> getBallList() {
    List<Widget> balls = [];
    for (int i = 0; i < count; i++) {
      balls.add(
        Positioned(
            key: ObjectKey(i),
            left: lefts.elementAt(i),
            top: tops.elementAt(i),
            child: ClipOval(
              child: Material(
                color: Colors.lightBlue, // Button color
                child: InkWell(
                  splashColor: Colors.lightBlue,
                  // Splash color
                  onTapDown: (TapDownDetails e) {
                    tops[i] = Random()
                        .nextInt((screenHeight - ballHeight).toInt())
                        .toDouble();
                    lefts[i] = Random()
                        .nextInt((screenWidth - ballWidth).toInt())
                        .toDouble();
                    setState();
                  },
                  onTap: () {},
                  onHover: (e) {
                    print('hovered');
                  },
                  child: SizedBox(width: ballHeight, height: ballWidth),
                ),
              ),
            )),
      );
    }
    return balls;
  }
}
