import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aimbooster/aimbooster.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double ballSize = 75;
  double ballColorValue = 0;
  double ballCount = 3;
  Color ballColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aim Booster - Menu'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(200, 100, 200, 0),
          child: Column(
            children: [
              Text(
                'Ball Size',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: ballSize,
                onChanged: (newBallSize) {
                  setState(() {
                    ballSize = newBallSize;
                  });
                },
                min: 50,
                max: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Ball Color',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: ballColorValue,
                onChanged: (newBallColor) {
                  setState(() {
                    ballColorValue = newBallColor;
                    switch (ballColorValue.toInt()) {
                      case (0):
                        ballColor = Colors.blue;
                        break;
                      case (1):
                        ballColor = Colors.pinkAccent;
                        break;
                      case (2):
                        ballColor = Colors.green;
                        break;
                    }
                  });
                },
                activeColor: ballColor,
                divisions: 2,
                min: 0,
                max: 2,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Ball Count',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: ballCount,
                onChanged: (newBallCount) {
                  setState(() {
                    ballCount = newBallCount;
                  });
                },
                divisions: 4,
                label: '${ballCount.toInt()}',
                min: 1,
                max: 5,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return MyApp(ballCount: ballCount.toInt(),ballSize: ballSize, ballColor: ballColor,);
                    }));
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 50,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Preview',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 50,
              ),
              ClipOval(
                child: Material(
                  color: ballColor, // Button color
                  child: InkWell(
                      child: GestureDetector(
                    child: SizedBox(width: ballSize, height: ballSize),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
