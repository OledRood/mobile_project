import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final String carId;
  const CarDetailsScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Детали о машине с ID: $carId')));
  }
}
