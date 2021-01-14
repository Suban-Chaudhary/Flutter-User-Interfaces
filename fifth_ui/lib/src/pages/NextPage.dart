import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  NextPage({Key key}) : super(key: key);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1588272078600-63bde33f336e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                  ]
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _makeItem(
                            'https://images.unsplash.com/photo-1570280406793-fb05bcb5d395?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                            'Lamborghini Sen'
                            ),
                          SizedBox(width: 30.0,),
                          _makeItem(
                            'https://images.unsplash.com/photo-1577473404054-cbdf6c62ebaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                            'Farari Liberal 500  MAX'
                            ),
                          SizedBox(width: 30.0,),
                          _makeItem(
                            'https://images.unsplash.com/photo-1566023967456-785e9a45c537?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
                            'Bugati Inferor 300'
                            ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          _makepoint(top: 140.0, left:40.0),
          _makepoint(top: 240.0, left:250.0),
          _makepoint(top: 256.0, left:150.0),
        ],
      ),
      
    );
  }
}

Widget _makepoint({top, left}){
  return Positioned(
    top: top,
    left: left,
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.cyan.withOpacity(0.3),
      ),
      child: Animator<double>(
        duration: Duration(seconds: 1),
        tween:Tween<double>(begin: 4.0, end: 6.0),
        cycles: 0,
        builder: (anim)=> Center(
          child: Container(
            margin: EdgeInsets.all(anim.value),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
          ),
        ),
      ),
    ),
  ));
}

Widget _makeItem(String image, String about){
  return AspectRatio(
    aspectRatio: 0.75/1,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill
                  )
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey[200]
            ),
            height: 30.0,
            width: 117.0,
            child: Text(
              '       Super Car',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold
              ),  
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: Text(
              about,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 25.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 7.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[900],
                size: 30.0,
              ),
            ),
          )
        ],
      ),
    ),
  );
}