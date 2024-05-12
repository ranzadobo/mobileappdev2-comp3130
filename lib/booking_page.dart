import 'package:flutter/material.dart';
import 'booking_details_page.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Date and Time'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(width: 160, child: const Card(child: Center(child: Text("Tue 10/05")))),
                Container(width: 160, child: const Card(child: Center(child: Text("Wed 11/05")))),
                Container(width: 160, child: const Card(child: Center(child: Text("Thu 12/05")))),
              ],
            ),
          ),
          DropdownButton<String>(
            items: <String>['Quiet room Q1.01'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Dummy count for times
              itemBuilder: (context, index) => ListTile(
                title: Text('${index + 9}:00 AM'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () { // Button logic to go to next page
                  Navigator.push( 
                    context,
                    MaterialPageRoute(builder: (context) => BookingDetailsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Book'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}