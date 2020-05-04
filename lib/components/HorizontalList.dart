import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/cats/ca1.png',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'images/cats/ca2.png',
            image_caption: 'Blouse',
          ),
          Category(
            image_location: 'images/cats/ca3.png',
            image_caption: 'Pants',
          ),
          Category(
            image_location: 'images/cats/ca4.png',
            image_caption: 'Sandles',
          ),
          Category(
            image_location: 'images/cats/ca5.png',
            image_caption: 'T-Shirts',
          ),
          Category(
            image_location: 'images/cats/ca6.png',
            image_caption: 'Jacket',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 120.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              scale: 0.8,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
