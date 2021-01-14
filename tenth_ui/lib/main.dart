import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:  ThemeData(primarySwatch: Colors.blue),
      home:  LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() =>  LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =  AnimationController(
        vsync: this, duration:  Duration(milliseconds: 500));
    _iconAnimation =  CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  Stack(fit: StackFit.expand, children: <Widget>[
         Image(
          image:  AssetImage("assets/images/image1.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
         Theme(
          data:  ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme:  InputDecorationTheme(
                hintStyle:  TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                     TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
               Container(
                padding: const EdgeInsets.all(40.0),
                child:  Form(
                  autovalidate: true,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       TextFormField(
                        decoration:  InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                       TextFormField(
                        decoration:  InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                       MaterialButton(
                        child: Text('Login'),
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}