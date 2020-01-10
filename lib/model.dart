import 'package:flutter/material.dart';

class Wine {
  String price;
  String title;
  String subTitle;
  String imgPath;
  Color bgColor;
  int rating;

  Wine({this.price, this.title, this.subTitle, this.imgPath, this.bgColor,
      this.rating});
}

var Wines = [
  Wine(
    price: '\$1299',
    title: 'Marvrose Rose Wine',
    subTitle: '50% Marvrotragno, 50% Avgoustiatis',
    imgPath: 'assets/wine.png',
    bgColor: Color(0xFFFECBC2),
    rating: 4
  ),
  Wine(
      price: '\$999',
      title: 'Marvrose Rose Wine',
      subTitle: '50% Marvrotragno, 50% Avgoustiatis',
      imgPath: 'assets/wine2.png',
      bgColor: Color(0xFFB4E8EB),
      rating: 4
  ),
];

var recommendedWines = [
  Wine(
      price: '\$49',
      title: 'Marvrose Rose Wine',
      subTitle: '50% Marvrotragno, 50% Avgoustiatis',
      imgPath: 'assets/wine3.png',
      bgColor: Color(0xFF6CD7DC),
      rating: 4
  ),
  Wine(
      price: '\$699',
      title: 'Marvrose Rose Wine',
      subTitle: '50% Marvrotragno, 50% Avgoustiatis',
      imgPath: 'assets/wine4.png',
      bgColor: Color(0xFFF28E90),
      rating: 4
  ),
];