import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/booking.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Временные данные для демонстрации
    final List<Booking> favorites = [
      Booking(
        id: '1',
        title: 'Hotel California',
        description: 'Luxury hotel in the heart of the city',
        location: 'Los Angeles, CA',
        price: '\$250/night',
        date: DateTime.now().add(const Duration(days: 1)),
        status: BookingStatus.confirmed,
        isFavorite: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No favorites yet'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final booking = favorites[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.hotel)),
                    title: Text(booking.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.location),
                        Text(
                          booking.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        // Логика удаления из избранного
                      },
                    ),
                    onTap: () {
                      // Логика перехода к деталям
                    },
                  ),
                );
              },
            ),
    );
  }
}
