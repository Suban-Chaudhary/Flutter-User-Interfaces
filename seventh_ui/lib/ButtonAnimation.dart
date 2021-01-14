import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
  
  final Color primaryColor;
  final Color darkPrimaryColor;

  ButtonAnimation(this.primaryColor, this.darkPrimaryColor);

}

class _ButtonAnimationState extends State<ButtonAnimation> with TickerProviderStateMixin {
  
  AnimationController _animationController;
  AnimationController _fadeAnimationController;
  AnimationController _scaleAnimationController;

  Animation<double> _animation;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;

  double buttonWidth = 230.0;
  double scale = 1.0;
  double barColorOpacity = 0.6;
  bool animationStart = false;
  bool animationComplete = false;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      value: this,
      duration: Duration(seconds: 3)
    );
    _scaleAnimationController = AnimationController(
      value: this,
      duration: Duration(milliseconds: 300)
    );
    _fadeAnimationController = AnimationController(
      value: this,
      duration: Duration(milliseconds: 400)
    );

    _fadeAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(_fadeAnimationController);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_scaleAnimationController)..addStatusListener((status){
      if (status == AnimationStatus.completed){
        _scaleAnimationController.reverse();
        _fadeAnimationController.forward();
        _animationController.forward();
      }
    });

    _animation = Tween<double>(
      begin: 0.0,
      end: buttonWidth,
    ).animate(_animationController)..addStatusListener((status){
      if (status == AnimationStatus.completed){
        setState(() {
          animationComplete = true;
          barColorOpacity = 0;
        });
      }
    });
  }
  @override
  void dispose(){
    super.dispose();
    _animationController.dispose();
    _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _scaleAnimationController,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              onTap: (){
                _scaleAnimationController.forward();
              },
              child: Container(
                width: 230,
                height: 55,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(                      
                      child: Align(
                        child:
                        animationComplete == false ?
                        Text('Download', style: TextStyle(color: Colors.white, fontSize: 18),)
                        :
                        Icon(Icons.check, color: Colors.white)
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _fadeAnimationController,
                      builder: (context, child) => Container(
                        width: _fadeAnimation.value,
                        height: 55,
                        decoration: BoxDecoration(
                          color: widget.darkPrimaryColor
                        ),
                        child: Icon(Icons.file_download, color: Colors.white,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Positioned(
            left: 0,
            top: 0,
            width: _animation.value,
            height: 55,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: barColorOpacity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}