import 'package:flutter/material.dart';
import 'package:mobileappdev2/reservations_details_page.dart';

class ReservationsPage extends StatefulWidget {
  @override
  _ReservationsPageState createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String>> activeReservations = [
    {'room': 'Library Q1.01', 'time': '10:00AM 27/03/2024', 'imagePath': 'assets/images/studyspace1.jpg'},
    {'room': 'Library Q1.07', 'time': '2:00PM 01/04/2024', 'imagePath': 'assets/images/studyspace2.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservations"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveReservations(),
          _buildPastReservations(),
        ],
      ),
    );
  }

  Widget _buildActiveReservations() {
    return ListView.builder(
      itemCount: activeReservations.length,
      itemBuilder: (context, index) {
        final reservation = activeReservations[index];
        return _buildReservationItem(reservation['room']!, reservation['time']!, reservation['imagePath']!, index);
      },
    );
  }

  Widget _buildPastReservations() {
    return const Center(
      child: Text("No past reservations", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildReservationItem(String room, String time, String imagePath, int index) {
    return ListTile(
      leading: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
      title: Text(room),
      subtitle: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReservationDetails(
            bookingNumber: "123", // Example booking number
            time: time,
            location: room,
            onBookingCancelled: () {
              setState(() {
                activeReservations.removeAt(index);
              });
            },
          )),
        );
      },
    );
  }
}
