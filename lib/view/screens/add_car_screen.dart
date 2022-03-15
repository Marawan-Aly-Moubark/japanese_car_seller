// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cars_seller/business_logic/cubit/cars_cubit/cars_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/car_model.dart';
import '../widgets/image_input.dart';

// ignore: must_be_immutable
class AddCarScreen extends StatefulWidget {
  AddCarScreen({Key? key, required this.cars}) : super(key: key);
  List<Car> cars;

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _titleController = TextEditingController();
  final _colorController = TextEditingController();
  final _priceController = TextEditingController();
  final _yearController = TextEditingController();
  final _engineController = TextEditingController();
  final _kiloMetresController = TextEditingController();
  final _placeController = TextEditingController();
  final _statuController = TextEditingController();
  final _descController = TextEditingController();

  // ignore: unused_field
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _descController.text.isEmpty ||
        _engineController.text.isEmpty ||
        _kiloMetresController.text.isEmpty ||
        _placeController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _yearController.text.isEmpty ||
        _statuController.text.isEmpty ||
        _colorController.text.isEmpty ||
        _pickedImage == null) {
      return;
    }
    BlocProvider.of<CarsCubit>(context).addCar(
      _titleController.text,
      _pickedImage!,
      _colorController.text,
      _priceController.text,
      _yearController.text,
      _engineController.text,
      _kiloMetresController.text,
      _placeController.text,
      _statuController.text,
      _descController.text,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add a New Car'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Color'),
                      controller: _colorController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Price'),
                      controller: _priceController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Year'),
                      controller: _yearController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Engine'),
                      controller: _engineController,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: 'KiloMetres'),
                      controller: _kiloMetresController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Place'),
                      controller: _placeController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Statue'),
                      controller: _statuController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Desc'),
                      controller: _descController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            color: Colors.yellow,
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Car',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
