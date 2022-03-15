import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/cars_cubit/cars_cubit_cubit.dart';
import 'business_logic/cubit/login_cubit/login_cubit.dart';
import 'business_logic/cubit/register_cubit/register_cubit.dart';
import 'constants/strings.dart';
import 'data/model/car_model.dart';
import 'data/repoistry/login_repoistry.dart';
import 'data/repoistry/register_repoistry.dart';
import 'data/web_services/login_web_services.dart';
import 'data/web_services/register_web_services.dart';
import 'view/screens/add_car_screen.dart';
import 'view/screens/car_details_screen.dart';
import 'view/screens/cars_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/register_screen.dart';

class AppRouter {
  late LoginRepoistry loginRepoistry;
  late LoginCubit loginCubit;
  late RegisterRepoistry registerRepoistry;
  late RegisterCubit registerCubit;
  late CarsCubit carsCubitCubit;

  AppRouter() {
    loginRepoistry = LoginRepoistry(LoginWebServices());
    loginCubit = LoginCubit(loginRepoistry);
    registerRepoistry = RegisterRepoistry(RegisterWebServices());
    registerCubit = RegisterCubit(registerRepoistry);
    carsCubitCubit = CarsCubit();
  }

  Route? genertaRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loginCubit,
            child: const LoginScreen(),
          ),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => registerCubit,
            child: RegisterScreen(),
          ),
        );

      case carsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: carsCubitCubit,
            child: const CarsScreen(),
          ),
        );

      case carDetailsScreen:
        final arguments = settings.arguments as Map;
        final product = arguments['car'] as Car;
        final index = arguments['index'] as int;

        return MaterialPageRoute(
          builder: (_) => CarDetailsScreen(
            car: product,
            index: index,
          ),
        );

      case addCarScreen:
        final cars = settings.arguments as List<Car>;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: carsCubitCubit,
            child: AddCarScreen(cars: cars),
          ),
        );
    }
    return null;
  }
}
