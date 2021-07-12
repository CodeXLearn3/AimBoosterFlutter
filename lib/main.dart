import 'package:flutter/material.dart';

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
    generator = ListGenerator(count: 3, setState: _myFunction);
    balls = generator!.getBallList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
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
    );
  }
}

class ListGenerator {
  int count;
  double ballWidth;
  double ballHeight;
  final List<double> tops = [0, 0, 0];
  final List<double> lefts = [0, 100, 200];
  double top = 0;
  double left = 0;
  Function setState;

  ListGenerator(
      {this.count = 1,
      this.ballWidth = 50,
      this.ballHeight = 50,
      required this.setState});

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
                color: Color.fromRGBO(100, 0, i * 60, 1), // Button color
                child: InkWell(
                  splashColor: Color.fromRGBO(256, 256, i * 10, 1),
                  // Splash color
                  onTapDown: (TapDownDetails e) {
                    print(e.localPosition);
                    tops[i] = tops.elementAt(i) + 100;
                    setState();
                  },
                  onTap: () {
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
