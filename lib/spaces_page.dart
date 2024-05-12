import 'package:flutter/material.dart';
import 'package:mobileappdev2/booking_page.dart';

class SpacesPage extends StatefulWidget {
  @override
  _SpacesPageState createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  String selectedLocation = 'Macquarie University Library';
  String selectedZone = 'Library level 1';
  String selectedCategory = 'Presentation Pods';
  String selectedCapacity = 'Space for 1 person';
  bool accessible = false;
  bool powerAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book a Space"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: selectedLocation,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              items: <String>['Macquarie University Library']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Location',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedZone,
              onChanged: (String? newValue) {
                setState(() {
                  selectedZone = newValue!;
                });
              },
              items: <String>['Library level 1', 'Library level 2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Zone',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: <String>['Presentation Pods', 'Quiet Rooms', 'Wellbeing Q Rooms']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Category',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedCapacity,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCapacity = newValue!;
                });
              },
              items: <String>['Space for 1 person', 'Space for up to 8 people']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Capacity',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            CheckboxListTile(
              title: const Text('Accessible Seat/Space'),
              value: accessible,
              onChanged: (bool? value) {
                setState(() {
                  accessible = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Power Available'),
              value: powerAvailable,
              onChanged: (bool? value) {
                setState(() {
                  powerAvailable = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800], 
                    foregroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  child: const Text('Show Availability'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

