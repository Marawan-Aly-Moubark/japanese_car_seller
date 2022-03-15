part of 'cars_cubit_cubit.dart';

@immutable
abstract class CarsCubitState {}

class CarsCubitInitial extends CarsCubitState {}

class CarsAddedSuccefully extends CarsCubitState {
  final List<Car> cars;

  CarsAddedSuccefully(this.cars);
}
