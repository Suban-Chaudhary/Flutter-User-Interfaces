import 'package:flutter/material.dart';
import 'package:third_ui/animations/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:third_ui/pages/HomePage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  bool textVisible = true;

  @override
  void initState(){
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 1.0,end: 25.0
    ).animate(_animationController);
    super.initState();
  }

  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _onTap(){
    setState(() {
      textVisible = false;
    });
  
  _animationController.forward().then((f)=>
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()))
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image9.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.1),
              ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(1,Text(
                  'Taking Order For Faster Delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),
                ),),
                SizedBox(height: 20,),
                FadeAnimation(1.8,Text(
                  'See restaurants nearby\nadding Location...',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.6,
                    fontSize: 20
                  ),
                )),
                SizedBox(height: 120,),
                FadeAnimation(1.3,
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ],
                    ),
                  ),
                  child: AnimatedOpacity(
                    opacity: textVisible ? 1.0:0.0,
                    duration: Duration(milliseconds: (50)),
                    child: MaterialButton(
                      onPressed: () => _onTap(),
                        minWidth: double.infinity,
                        child: Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                
                  SizedBox(height: 20,),
                  FadeAnimation(1.3,
                  AnimatedOpacity(
                    opacity: textVisible ? 1.0: 0.0,
                    duration: Duration(milliseconds: 50),
                    child: Align(
                      child: Text(
                        'Now delivery to your door 24/7',
                        style: TextStyle(
                          color: Colors.white70
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          )
        ),
      ),      
    );
  }
}