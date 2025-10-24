import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/booking.dart';

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Временные данные для демонстрации
    final List<Booking> bookings = [
      Booking(
        id: '1',
        title: 'Hotel California',
        description: 'Luxury hotel in the heart of the city',
        location: 'Los Angeles, CA',
        price: '\$250/night',
        date: DateTime.now().add(const Duration(days: 1)),
        status: BookingStatus.confirmed,
      ),
      Booking(
        id: '2',
        title: 'Beach Resort',
        description: 'Beautiful beachfront resort',
        location: 'Miami, FL',
        price: '\$180/night',
        date: DateTime.now().add(const Duration(days: 3)),
        status: BookingStatus.pending,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: bookings.isEmpty
          ? const Center(child: Text('No bookings found'))
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.book)),
                    title: Text(booking.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.description),
                        Text(booking.location),
                        Text(
                          'Status: ${booking.status.name}',
                          style: TextStyle(
                            color: _getStatusColor(booking.status),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      booking.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      // Логика перехода к деталям
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Логика перехода к добавлению бронирования
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.confirmed:
        return Colors.green;
      case BookingStatus.cancelled:
        return Colors.red;
      case BookingStatus.completed:
        return Colors.blue;
    }
  }
}
