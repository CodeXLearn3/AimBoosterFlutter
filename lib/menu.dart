import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aimbooster/main.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu ...'),
      ),
      body: Center(
        child:
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return MyApp();
              }));
            }, child: Text('Open Aim Booster')),
      ),
    );
  }
}
