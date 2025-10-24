enum BookingStatus { pending, confirmed, cancelled, completed }

class Booking {
  final String? id;
  final String title;
  final String description;
  final String location;
  final String price;
  final DateTime date;
  final BookingStatus status;
  final bool isFavorite;

  const Booking({
    this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.date,
    this.status = BookingStatus.pending,
    this.isFavorite = false,
  });

  Booking copyWith({
    String? id,
    String? title,
    String? description,
    String? location,
    String? price,
    DateTime? date,
    BookingStatus? status,
    bool? isFavorite,
  }) {
    return Booking(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      price: price ?? this.price,
      date: date ?? this.date,
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'date': date.toIso8601String(),
      'status': status.toString().split('.').last,
      'isFavorite': isFavorite,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      price: json['price'],
      date: DateTime.parse(json['date']),
      status: BookingStatus.values.firstWhere(
        (status) => status.toString().split('.').last == json['status'],
        orElse: () => BookingStatus.pending,
      ),
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
