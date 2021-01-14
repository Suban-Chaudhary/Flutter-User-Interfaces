import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.png'
                    ),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(                    
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(1, Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/light-1.png'
                            )
                          )
                        ),
                      ),),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.5,Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/light-2.png'
                            )
                          )
                        ),
                      ),)
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 88,
                      height: 150,
                      child: FadeAnimation(1.6 ,Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/clock.png'
                            )
                          )
                        ),
                      ),)
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10)
                          ),
                        ]
                      ),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1.8 ,Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[100])
                              ),
                            ),
                            child:TextField(
                              decoration: InputDecoration(
                                hintText: "Email or Phone",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),),
                          FadeAnimation(1.8 ,Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[100])
                              ),
                            ),
                            child:TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    FadeAnimation(2, Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          List: [
                            Color.fromRGBO(143, 148, 251, .1),
                            Color.fromRGBO(143, 148, 251, .6),                          
                          ]
                        )
                      ),
                      child: Center(child: Text("Login", style: TextStyle(color: Colors.grey[800], fontSize: 17, fontWeight: FontWeight.bold,),),)
                    ),),
                    SizedBox(height: 70,),
                    FadeAnimation(1.5 ,Center(child: Text("Forget Password ?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),fontSize: 15,fontWeight: FontWeight.w500,),),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}