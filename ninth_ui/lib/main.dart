import 'package:flutter/material.dart';
import 'package:ninth_ui/FindEvent.dart';
import 'package:page_transition/page_transition.dart';

import 'Animation/FadeAnimation.dart';

void main() {runApp(
  MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    )
  );
}
class HomePage extends StatefulWidget{
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;
  
  @override
  void initState(){
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(_scaleController)..addStatusListener((status){
    if (status == AnimationStatus.completed){
      Navigator.push(context, PageTransition(child: FindEvent(), type: PageTransitionType.fade));
    }});
  }

  @override
  void dispose(){
    super.dispose();
    _scaleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(1, Text('Find out the best best location for spending your night for a party.',
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, height: 1.1),)),
              SizedBox(height: 30,),
              FadeAnimation(1.2, Text('Let us find you an event for your interest.',
              style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 25, fontWeight: FontWeight.w300),)),
              SizedBox(height: 150,),
              FadeAnimation(1.4, InkWell(
                onTap: (){
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[700]
                      ),
                      child: hide == false? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Find nearest event', style: TextStyle(color: Colors.white, fontSize: 20),),
                          Icon(Icons.arrow_forward, color: Colors.white,),
                        ],
                      ):
                      Container(color: Colors.yellow,)
                    ),
                  )
                ),
              ),),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}