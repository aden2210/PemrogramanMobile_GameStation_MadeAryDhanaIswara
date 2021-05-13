import 'package:flutter/material.dart';
import 'package:game_station/detailproduct.dart';

class PheripheralsPage extends StatefulWidget {
  @override
  _PheripheralsPageState createState() => _PheripheralsPageState();
}

class _PheripheralsPageState extends State<PheripheralsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(child: Text('GAME CONSOLE')),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduct(
                  name: "Arctis 3",
                  description: "Wired Headset",
                  price: 995000,
                  image: "Arctic3W.png",
                  star: 3,
                ),
              ));
            },
            child: ProductBox(
                name: "Arctic 3",
                description: "Original",
                price: 995000,
                image: "Arctic3W.png",
                star: 3),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduct(
                  name: "Arctis 7",
                  description: "Recomended Wireless Headset",
                  price: 2285000,
                  image: "Arctic7.png",
                  star: 4,
                ),
              ));
            },
            child: ProductBox(
                name: "Arctis 7",
                description: "Original",
                price: 2285000,
                image: "Arctic7.png",
                star: 4),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduct(
                  name: "DualShock Sony PS 4",
                  description:
                      "Recomended DualShock Sony for Playstation 4 (Steel Black)",
                  price: 599000,
                  image: "DS4.jpg",
                  star: 3,
                ),
              ));
            },
            child: ProductBox(
                name: "DualShock Sony PS 4",
                description: "Original",
                price: 599000,
                image: "DS4.jpg",
                star: 3),
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];

  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }

    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset(
                "assets/appimages/" + image,
                width: 150,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Price: " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: children,
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
