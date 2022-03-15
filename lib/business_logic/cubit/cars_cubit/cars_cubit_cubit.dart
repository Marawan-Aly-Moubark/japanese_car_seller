import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../data/model/car_model.dart';

part 'cars_cubit_state.dart';

class CarsCubit extends Cubit<CarsCubitState> {
  CarsCubit() : super(CarsCubitInitial());

  List<Car> cars = allCars;

  void addCar(
    String pickedTitle,
    File pickedImage,
    String pickedColor,
    String pickedPrice,
    String pickedYear,
    String pickedEngine,
    String pickedKilometres,
    String pickedPlace,
    String pickedStatue,
    String pickedDesc,
  ) {
    final newCar = Car(
      id: 7,
      image: Image.file(pickedImage),
      title: pickedTitle,
      color: pickedColor,
      price: '$pickedPrice  \$',
      year: pickedYear,
      engine: '$pickedEngine cc',
      kilometres: '$pickedKilometres K.M',
      place: pickedPlace,
      statue: pickedStatue,
      description: pickedDesc,
    );
    cars.add(newCar);
    emit(CarsAddedSuccefully(cars));
  }
}
