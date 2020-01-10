import 'package:flutter/material.dart';
import 'package:wine_flutter_app/wineDetailPage.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wineBrand = Wines;
  final recommendList = recommendedWines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 7)
                    ]),
              ),
              Positioned(
                  top: 15,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 7, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  top: 45,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Boutique',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              'More',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 275,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: wineBrand.map((wine) {
                                return _buildCard(wine);
                              }).toList()),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recommended',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'More',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 275,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recommendList.map((wine) {
                  return _buildCard(wine);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Wine wine) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WineDetail(wineDetail: wine,)));
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 3,
                    color: Colors.grey.withOpacity(0.1))
              ]),
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
              Container(
                height: 160,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: wine.bgColor),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Hero(
                    tag: wine.imgPath,
                    child: Container(
                      height: 125,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(wine.imgPath),
                              fit: BoxFit.contain),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                    )),
              ),
              Positioned(
                  top: 7,
                  left: 7,
                  child: Text(
                    wine.price,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 7,
                  right: 10,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 15,
                  )),
              Positioned(
                  top: 175,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        wine.title,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        wine.subTitle,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          getRatingStar(wine.rating, 1),
                          getRatingStar(wine.rating, 2),
                          getRatingStar(wine.rating, 3),
                          getRatingStar(wine.rating, 4),
                          getRatingStar(wine.rating, 5),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            wine.rating.roundToDouble().toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF199693)),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  getRatingStar(rating, index) {
    if (index <= rating) {
      return Icon(
        Icons.star,
        color: Color(0xFF199693),
        size: 20,
      );
    } else {
      return Icon(
        Icons.star,
        color: Color(0xFFADDDDD),
        size: 20,
      );
    }
  }
}
