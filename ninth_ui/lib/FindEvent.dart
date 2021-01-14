import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

class FindEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(Icons.menu, color: Colors.black,),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/image4.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800]
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: FadeAnimation(1, SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    hintText: "Search Events",
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              SizedBox(height: 30,),
              makeItem(image: 'assets/images/image2.jpg', date: 29),
              SizedBox(height: 20,),
              makeItem(image: 'assets/images/image3.jpg', date: 27),
              SizedBox(height: 20,),
              makeItem(image: 'assets/images/image5.jpg', date: 25),
              SizedBox(height: 20,),
              makeItem(image: 'assets/images/image6.jpg', date: 20),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    ));
  }
  Widget makeItem({image, date}){
    return Row(
      children: <Widget>[
        Container(
          height: 200,
          width: 50,
          margin: EdgeInsets.only(right: 20),
          child:  Column(
            children: <Widget>[
              Text(date.toString(), style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),),
              Text("Sep", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        Expanded(
          child: FadeAnimation(1.3, Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Let's Party...",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("8:00 - 10:00 PM", style: TextStyle(color: Colors.white),)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      )],
    );
  }
}