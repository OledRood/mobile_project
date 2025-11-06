import 'package:flutter/material.dart';

class CarRentScreen extends StatelessWidget {
  final String carId;
  const CarRentScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Страница забронировать машину с ID: $carId')),
    );
  }
}
