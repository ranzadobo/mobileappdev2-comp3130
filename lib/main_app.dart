import 'package:flutter/material.dart';
import 'home_page.dart';
import 'spaces_page.dart';
import 'reservations_page.dart';
import 'login_page.dart'; // Ensure you import your login page

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  ThemeMode _themeMode = ThemeMode.light; // Default to light mode

  final List<Widget> _widgetOptions = [
    HomePage(),
    SpacesPage(),
    ReservationsPage(),
    LoginPage() // This is for log out button on nav bar to go back to login page
  ];

  void _onItemTapped(int index) {
    if (index == _widgetOptions.length - 1) { //Indices is -1 of widget options length
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        hintColor: Colors.amberAccent,
      ),
      themeMode: _themeMode, 
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(0), 
            width: 500, 
            child: Image.asset('assets/images/macquarie-logo.jpg', fit: BoxFit.contain),
          ),
          title: const Text('Macquarie Library'),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                });
              },
            ),
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Spaces'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Reservations'),
            BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Logout'), 
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: TextStyle(color: Colors.amber[800]), 
          unselectedLabelStyle: TextStyle(color: Colors.grey[600]), 
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
