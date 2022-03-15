import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../data/model/car_model.dart';

class CarItem extends StatelessWidget {
  const CarItem({Key? key, required this.car, required this.index})
      : super(key: key);
  final Car car;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, carDetailsScreen, arguments: {
          'car': car,
          'index': index,
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: Hero(
                tag: car.id!,
                child: Container(color: Colors.white, child: car.image)),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                car.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
