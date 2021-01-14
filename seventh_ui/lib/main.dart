import 'package:flutter/material.dart';
import 'ButtonAnimation.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonAnimation(Color.fromRGBO(57,92,253,1),Color.fromRGBO(44,78,223,1),),
              SizedBox(height: 20,),

              ButtonAnimation(Colors.yellow[700],Colors.yellow[800],),
              SizedBox(height: 20,),

              ButtonAnimation(Colors.green[400],Colors.green[600],),
              SizedBox(height: 20,),
              
              ButtonAnimation(Colors.red[500],Colors.red[700],),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}