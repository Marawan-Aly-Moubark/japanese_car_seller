import 'package:flutter/material.dart';

class Car {
  final int? id;
  String? title;
  String? description;
  Image? image;
  String? color;
  String? price;
  String? year;
  String? place;
  String? statue;
  String? engine;
  String? kilometres;

  Car(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.color,
      this.price,
      this.year,
      this.place,
      this.statue,
      this.engine,
      this.kilometres});
}
