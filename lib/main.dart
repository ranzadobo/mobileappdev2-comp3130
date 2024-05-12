import 'package:flutter/material.dart';
import 'package:mobileappdev2/booking_page.dart';
import 'package:mobileappdev2/reservations_page.dart';
import 'login_page.dart';
import 'main_app.dart';

void main() {
  runApp(MaterialApp(
    title: 'MQU Library 46635793',
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/main': (context) => MainApp(),
      '/reservations': (context) => ReservationsPage(),
      '/booking':(context) => BookingPage(),
    },
  ));
}
