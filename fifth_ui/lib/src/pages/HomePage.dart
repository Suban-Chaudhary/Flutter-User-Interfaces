import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _appbar(){
    return AppBar(
      backgroundColor: Colors.cyan,
      elevation: 0.0,
      leading: Icon(Icons.menu, size : 30),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  
  Widget _createCard(String imageName, String url, String about){
  return Container(
    child: Card(
      color: Colors.grey,
      child: Container(
        width: 350.0,
        height: 300.0,
        child: Column(
          children: <Widget>[
            Text(imageName),
            Image.network(url, width: 370, height: 250,),
            Text(about)
          ],
        ),
      ),
    )
  );      
  }

    Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search",
           suffixIcon: SizedBox(
              width: 50,
              child: Icon(Icons.search, color: Colors.purple)
                  
        ),
      ),
    ));
  }

  Widget _image(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "PHOTO GALLERY",
              style: TextStyle(
                color: Colors.purple[900],
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),              
            ),
          ),
          Image.network('https://images.unsplash.com/photo-1588263271723-c6b8dec450f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80'
          ),
        ],
      )
    ),
  );
  }

  Widget _imageandsearch(){
  return Stack(
    children: <Widget>[
      _image(),
    ],
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _searchField(),
                  _imageandsearch(),                  
                  _createCard(
                  'Sagarmatha',
                  'https://images.unsplash.com/photo-1533130061792-64b345e4a833?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                  'Hello there this is Sagarmatha mountain of Nepal.'),
                  _createCard(
                  'Amazing Place',
                  'https://images.unsplash.com/photo-1582073389612-c18eb815b0e6?ixlib=rb-1.2.1&auto=format&fit=crop&w=890&q=80',
                  'This is one of the amazing place of the world'),
                  _createCard(
                  'Amazing Place',
                  'https://images.unsplash.com/photo-1575383367694-9d88b074daa3?ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
                  'This is one of the amazing place of the world'),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}