import 'event.dart';

enum BookingStatus { confirmed, pending, cancelled }

class Booking {
  final String id;
  final Event event;
  final int ticketQuantity;
  final double totalPrice;
  final DateTime bookingDate;
  final BookingStatus status;

  Booking({
    required this.id,
    required this.event,
    required this.ticketQuantity,
    required this.totalPrice,
    required this.bookingDate,
    required this.status,
  });
}

final List<Booking> mockBookings = [
  Booking(
    id: 'b1',
    event: mockEvents[0],
    ticketQuantity: 2,
    totalPrice: 10000.00,
    bookingDate: DateTime(2026, 1, 10),
    status: BookingStatus.confirmed,
  ),
  Booking(
    id: 'b2',
    event: mockEvents[2],
    ticketQuantity: 3,
    totalPrice: 4500.00,
    bookingDate: DateTime(2026, 1, 15),
    status: BookingStatus.cancelled,
  ),
];
