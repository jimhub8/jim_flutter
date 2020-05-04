import 'package:flutter/material.dart';
import 'package:jimkiarie8/components/api/user_api.dart';
import 'package:jimkiarie8/components/models/user.dart';
import 'dart:ui' as ui;

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  PageController _myPage = PageController(initialPage: 0);

  UsersApi usersApi = UsersApi();
  String token = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 45,
          color: Colors.white54,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.local_shipping),
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(3);
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: PageView(

        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            child: FutureBuilder(
              future: usersApi.fetchLogedInUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return _loading();
                    break;
                  case ConnectionState.waiting:
                    return _loading();
                    break;
                  case ConnectionState.none:
                    return _error('No connection made');
                    break;

                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return _error(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      // return Container();
                      return _drawCategoryList(snapshot.data);
                    }
                    break;
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _error(error) {
    return Container(
      child: Center(
        child: Text(
          error,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _drawCategoryList(users) {
    // print('***************************************');
    // print(users['image']);
    // print('***************************************');
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = users['image'];

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            )),
        new Center(
          child: new Column(
            children: <Widget>[
              new SizedBox(
                height: _height / 12,
              ),
              new CircleAvatar(
                radius: _width < _height ? _width / 4 : _height / 4,
                backgroundImage: NetworkImage(imgUrl),
              ),
              new SizedBox(
                height: _height / 25.0,
              ),
              new Text(
                users['name'],
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 15,
                    color: Colors.white),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                    top: _height / 30, left: _width / 8, right: _width / 8),
                child: new Text(
                  'Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
                  style: new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: _width / 25,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              new Divider(
                height: _height / 30,
                color: Colors.white,
              ),
              new Row(
                children: <Widget>[
                  rowCell('Email', users['email']),
                  rowCell('Phone', users['phone']),
                  // rowCell(275, 'FOLLOWING'),
                ],
              ),
              new Divider(height: _height / 30, color: Colors.white),
              new Padding(
                padding:
                    new EdgeInsets.only(left: _width / 8, right: _width / 8),
                child: new FlatButton(
                  onPressed: () {},
                  child: new Container(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.person),
                      new SizedBox(
                        width: _width / 30,
                      ),
                      new Text('Edit Profile')
                    ],
                  )),
                  color: Colors.blue[50],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget rowCell(String count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));

  // setToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   return localStorage.getString('token');
  //   // setState(() {
  //   //   token = localStorage.getString('token');
  //   // });
  // }
}
