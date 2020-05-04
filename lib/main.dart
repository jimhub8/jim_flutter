import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:jimkiarie8/components/HorizontalList.dart';
import 'package:jimkiarie8/components/Products.dart';
import 'package:jimkiarie8/components/auth/Login.dart';
import 'package:jimkiarie8/components/orders/Orders.dart';
// import 'package:jimkiarie8/components/pages/InfinitScroll.dart';
import 'package:jimkiarie8/components/pages/cart.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/a.jpg'),
          AssetImage('images/b.jpg'),
          AssetImage('images/c.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
        appBar: new AppBar(
          title: Text('Dellmat App'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search), onPressed: () {}),
            new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
               Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
            })
          ],
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              // Header
              UserAccountsDrawerHeader(
                accountName: Text('Jimmy'),
                accountEmail: Text('jimkiarie8@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.red),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new HomePage()));
                },
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new LoginPage()));
                },
                child: ListTile(
                  title: Text('My account'),
                  leading: Icon(Icons.person),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Orders()));
                },
                child: ListTile(
                  title: Text('My Orders'),
                  leading: Icon(Icons.shopping_basket),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
                },
                child: ListTile(
                  title: Text('Shopping Cart'),
                  leading: Icon(Icons.shopping_cart, color: Colors.blue[700]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
                },
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(Icons.favorite),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Categories'),
                  leading: Icon(Icons.category),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.info),
                ),
              ),
            ],
          ),
        ),
        body: new ListView(
          children: <Widget>[
            // image carousel
            image_carousel,

            // Category
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text('Categoies')),

            // Horizontal
            HorizontalList(),

            // product List

            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text('Recent Products'),
            ),
            // Grid View
            Container(
              height: 320.0,
              child: Products(),
            ),

            // new Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: new Text('Infinite Product'),
            // ),
            // // Grid View
            // Container(
            //   height: 320.0,
            //   child: InfinitScroll(),
            // ),

            // InfinitScroll(),
          ],
        ));
  }
}
