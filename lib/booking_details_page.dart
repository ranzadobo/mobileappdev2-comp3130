import 'package:flutter/material.dart';
import 'reservations_page.dart';

class BookingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.check_circle, size: 120, color: Colors.green),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Booking reserved',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Colors.grey[700]),
            title: const Text("Time: 10:00AM 27/03/2024"),
          ),
          ListTile(
            leading: Icon(Icons.place, color: Colors.grey[700]),
            title: const Text("Location: Quiet room Q1.01"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () { // Button logic to go to next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('View Booking'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

