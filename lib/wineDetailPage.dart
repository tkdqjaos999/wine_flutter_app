import 'package:flutter/material.dart';
import 'model.dart';

class WineDetail extends StatefulWidget {
  final wineDetail;

  const WineDetail({Key key, this.wineDetail}) : super(key: key);

  @override
  _WineDetailState createState() => _WineDetailState();
}

class _WineDetailState extends State<WineDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 7,
                        blurRadius: 12)]
                ),
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: widget.wineDetail.bgColor
                ),
              ),
              Positioned(
                  top: 15,
                  left: 10,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: ()=>Navigator.of(context).pop()),
                      Icon(Icons.shopping_cart, color: Colors.white,)
                    ],),
                  )),
              Positioned(
                  top: 45,
                  left: 15,
                  right: 15,
                  child: Hero(tag: widget.wineDetail.imgPath, child: RotationTransition(turns: AlwaysStoppedAnimation(20/360),
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.wineDetail.imgPath))
                    ),
                  ),))),
              Positioned(
                  top: 375,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.wineDetail.title, style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                        Text(widget.wineDetail.price, style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: widget.wineDetail.bgColor
                        ),)
                      ],
                    ),
                  ))
            ],
          )

        ],
      ),
    );
  }
}
