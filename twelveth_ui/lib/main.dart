import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image10.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(.6),
                      Colors.black.withOpacity(.2)
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1, Text("Find your best location for the travel...",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,),
                    ),),
                    FadeAnimation(1.3, Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 23,),
                          border: InputBorder.none,
                          hintText: "Search for the best location...",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 18)
                        ),
                      ),
                    )),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("BEST DESTINATIONS..", style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/image5.jpg', title: 'Canada'),
                        makeItem(image: 'assets/images/image9.jpg', title: 'Nepal, Pokhara'),
                        makeItem(image: 'assets/images/image4.jpg', title: 'Waterfall'),
                        makeItem(image: 'assets/images/image1.jpg', title: 'Wow'),
                        makeItem(image: 'assets/images/image3.jpg', title: 'Amazing'),
                        makeItem(image: 'assets/images/image2.jpg', title: 'Italy'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeAccomodation(icon: Icons.hotel, color: Colors.blue.withOpacity(.2), iconColor: Colors.blue),
                        makeAccomodation(icon: Icons.flight, color: Colors.red.withOpacity(.2), iconColor: Colors.red),
                        makeAccomodation(icon: Icons.event, color: Colors.green.withOpacity(.2), iconColor: Colors.green),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Best Hotels", style: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 30),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  makeItem(image: 'assets/images/image5.jpg', title: 'Canada'),
                  makeItem(image: 'assets/images/image9.jpg', title: 'Nepal, Pokhara'),
                  makeItem(image: 'assets/images/image4.jpg', title: 'Waterfall'),
                  makeItem(image: 'assets/images/image1.jpg', title: 'Wow'),
                  makeItem(image: 'assets/images/image3.jpg', title: 'Amazing'),
                  makeItem(image: 'assets/images/image2.jpg', title: 'Italy'),
                ],
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }

  Widget makeItem({image, title}){
    return AspectRatio(
      aspectRatio: 1/1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.2)
              ]
            )
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),)
          ),
        ),
      ),
    );
  }

  Widget makeAccomodation({icon, color, iconColor}){
    return AspectRatio(
      aspectRatio: 1.5/1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color
        ),
        child: Icon(icon, color: iconColor,),
      ),
    );
  }
}