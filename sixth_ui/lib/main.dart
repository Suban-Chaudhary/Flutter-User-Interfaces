import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sixth_ui/Dashboard.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  PageController _pageController;
  AnimationController rippleController;
  AnimationController scaleController;

  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(
      initialPage: 0
    );
    rippleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    )..addStatusListener((status){
      if (status == AnimationStatus.completed){
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }
    });

    rippleAnimation = Tween<double>(
      begin: 80.0,
      end: 90.0
    ).animate(rippleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        rippleController.reverse();}
        else if(status == AnimationStatus.dismissed){
          rippleController.forward();
        }
      }
    );

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(scaleController);
    rippleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(image: 'assets/images/image1.jpg'),
          makePage(image: 'assets/images/image2.jpg'),
          makePage(image: 'assets/images/image3.jpg'),
        ],
      ),
      
    );
  }

  Widget makePage({image}){
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.3),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60,),
              Text('Exercise 1', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('15', style: TextStyle(color: Colors.yellow[400], fontSize: 40, fontWeight: FontWeight.bold),),
                  Text('Minutes', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('3', style: TextStyle(color: Colors.yellow[400], fontSize: 40, fontWeight: FontWeight.bold),),
                  Text('Exercises', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 180,),
              Align(
                child: Text(
                  'Start your morning with your health.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedBuilder(
                  animation: rippleAnimation,
                  builder: (context, child) => Container(
                    width: rippleAnimation.value,
                    height: rippleAnimation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.4)
                      ),
                      child: InkWell(
                        onTap: (){
                          scaleController.forward();
                        },
                        child: AnimatedBuilder(
                          animation: scaleAnimation,
                          builder: (context, child) => Transform.scale(
                            scale: scaleAnimation.value,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}