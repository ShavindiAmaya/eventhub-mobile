import 'package:flutter/material.dart';
import '../../models/booking.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  void _cancelBooking(BuildContext context, Booking booking) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: Text('Are you sure you want to cancel your booking for "${booking.event.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('No')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking cancelled')),
              );
            },
            child: const Text('Yes, Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Bookings'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList(context, mockBookings.where((b) => b.status != BookingStatus.cancelled).toList(), true),
            _buildBookingList(context, mockBookings.where((b) => b.status == BookingStatus.cancelled).toList(), false),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(BuildContext context, List<Booking> bookings, bool isUpcoming) {
    if (bookings.isEmpty) {
      return const Center(child: Text('No bookings found'));
    }
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        booking.event.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildStatusChip(booking.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Date: ${booking.event.date.day}/${booking.event.date.month}/${booking.event.date.year}'),
                Text('Tickets: ${booking.ticketQuantity}'),
                Text('Total: Rs. ${booking.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                if (isUpcoming && booking.status == BookingStatus.confirmed) ...[
                  const Divider(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _cancelBooking(context, booking),
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      label: const Text('Cancel Booking', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(BookingStatus status) {
    Color color;
    switch (status) {
      case BookingStatus.confirmed:
        color = Colors.green;
        break;
      case BookingStatus.pending:
        color = Colors.orange;
        break;
      case BookingStatus.cancelled:
        color = Colors.red;
        break;
    }
    return Chip(
      label: Text(status.name.toUpperCase(), style: const TextStyle(fontSize: 10, color: Colors.white)),
      backgroundColor: color,
      visualDensity: VisualDensity.compact,
    );
  }
}
