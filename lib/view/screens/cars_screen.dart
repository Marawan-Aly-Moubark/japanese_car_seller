import '../../business_logic/cubit/cars_cubit/cars_cubit_cubit.dart';
import '../widgets/car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/strings.dart';

import '../../data/model/car_model.dart';
import '../../helpers/shared_prefrences.dart';

// ignore: must_be_immutable
class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  List<Car> allCars = [];

  Widget buildBlocWidget() {
    return BlocBuilder<CarsCubit, CarsCubitState>(
      builder: (context, state) {
        allCars = BlocProvider.of<CarsCubit>(context).cars;

        return buildTheBody();
      },
    );
  }

  Widget buildTheBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildTheCarsList(context),
          ],
        ),
      ),
    );
  }

  Widget buildTheCarsList(context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCars.length,
      itemBuilder: ((context, index) {
        return CarItem(
          car: allCars[index],
          index: index,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black87,
        ),
        backgroundColor: Colors.black87,
        title: const Text('Cars Screen'),
        actions: [
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.teal,
            ),
            label: const Text(
              'sign out',
              style: TextStyle(color: Colors.teal),
            ),
            onPressed: () {
              CacheHelper.removeData(key: 'token');
              Navigator.pushNamed(context, loginScreen);
            },
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, addCarScreen, arguments: allCars);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.tealAccent,
              ))
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
