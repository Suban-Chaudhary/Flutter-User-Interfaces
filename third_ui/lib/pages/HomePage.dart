import 'package:flutter/material.dart';
import 'package:third_ui/animations/FadeAnimation.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
            onPressed: (){},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1.0,
                    Text(
                      'Food Delivery',
                      style: TextStyle(
                        color: Colors.grey[80],
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FadeAnimation(1, isCategory(isActive: true, title: 'Pizza')),
                          FadeAnimation(1.3, isCategory(isActive: false, title: 'Burger')),
                          FadeAnimation(1.4, isCategory(isActive: false, title: 'Drinks')),
                          FadeAnimation(1.5, isCategory(isActive: false, title: 'Desert')),
                          FadeAnimation(1.6, isCategory(isActive: false, title: 'Salad')),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            FadeAnimation(1,Padding(
              padding: EdgeInsets.all(20),
              child: Text('Free Delivery', style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.bold),),
            )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image10.jpg', price: 15, food: 'Vegetarian Pizza')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image1.jpg', price: 25, food: 'Soup')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image2.jpg', price: 50, food: 'New Momo')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image3.jpg', price: 80, food: 'Special Rice')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image4.jpg', price: 55, food: 'Noodles')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image5.jpg', price: 5, food: 'Toffee')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image7.jpg', price: 5, food: 'Candy')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image8.jpg', price: 30, food: 'Desert')),
                    FadeAnimation(1.3, makeItem(image: 'assets/images/image9.jpg', price: 40, food: 'Egg Dish')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),      
    );
  }

  Widget isCategory({isActive, title}){
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 20,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600 
            )
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, price , food}){
    return AspectRatio(
      aspectRatio: 1/1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right:20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                stops: [.2,.9],
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1)
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,                
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite, color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,                    
                    children: <Widget>[
                      Text('\$ '+price.toString()+'.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text(food.toString(), style: TextStyle(color: Colors.white, fontSize: 20),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}