import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  final String bookingNumber;
  final String time;
  final String location;
  final VoidCallback onBookingCancelled;

  ReservationDetails({
    required this.bookingNumber,
    required this.time,
    required this.location,
    required this.onBookingCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Your booking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Booking number: $bookingNumber',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Time: $time',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: $location',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                print('Policy view requested');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: const Text('View policy'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Policy');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, 
                backgroundColor: Colors.grey[350], 
              ),
              child: const Text('Edit booking'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onBookingCancelled();
                Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: const Color.fromARGB(255, 244, 167, 161), 
              ),
              child: const Text('Cancel booking'),
            ),
          ],
        ),
      ),
    );
  }
}
