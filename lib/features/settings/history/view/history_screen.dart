import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ваши брони')),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Бронирование #$index'),
              subtitle: Text('Детали бронирования'),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
