import 'package:flutter/material.dart';
import 'package:rent_hub/ApartmentDetailsPage.dart';
import 'package:rent_hub/Statistics.dart'; // Ensure this is the correct file name and path
import 'package:rent_hub/Tenants.dart';
import 'package:rent_hub/Calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartment Details',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Tenants(),
    ApartmentDetailsPage(),
    Statistics(),
    Calendar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ['Tenants', 'Apartment', 'Statistics', 'Calendar'][_selectedIndex],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28), // Increased size slightly
            label: 'Tenants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment, size: 28), // Increased size slightly
            label: 'Apartment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart, size: 28), // Increased size slightly
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 28), // Increased size slightly
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Colors.blue, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        backgroundColor: Colors.grey[200], // Background color of the BottomNavigationBar
        showUnselectedLabels: true, // Ensuring labels are always visible
        type: BottomNavigationBarType.fixed, // Removing shifting animation
      ),
    );
  }
}
