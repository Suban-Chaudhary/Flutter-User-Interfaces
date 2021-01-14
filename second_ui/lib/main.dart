import 'package:flutter/material.dart';
import 'package:second_ui/FadeAnimation.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  PageController _pageController;

  void _onScroll(){}

  @override
  void initState(){
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          _makePage(
            title: 'Super Car',
            image:'assets/images/image6.jpg',
            description: 'The name of the car is unknown and its price is also unknown.',
            page: '1'
          ),
          _makePage(
            title: 'Beautiful Scenery',
            image:'assets/images/image3.jpg',
            description: 'The scenery behind the colorful houses is amazing that cannot be expressed.',
            page: '2'
          ),
          _makePage(
            title: 'Building',
            image:'assets/images/image7.jpg',
            description: 'The amazing place of the world this is top recommended accomodation.',
            page: '3'
          ),
          _makePage(
            title: 'The Brilliant Photographer',
            image:'assets/images/image8.jpg',
            description: 'The one of the best photographer in the world with millions of fans.',
            page: '4'
          ),
        ],
      ),
    );
  }

  Widget _makePage({title,image,description,page}){
    int totalpage = 4;
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
            begin: Alignment.bottomRight,
            stops: [0.3,0.9],
            colors: [
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(.1)
            ]
          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/' + totalpage.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            '4.0',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70
                            ),
                          )
                        ),
                      ],
                    ),                    
                    SizedBox(height: 20,),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Read More',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}


