import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartment Details',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const ApartmentDetailsPage(),
    );
  }
}

class ApartmentDetailsPage extends StatelessWidget {
  const ApartmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit Apartment Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          const IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ListTile(
            leading: Icon(Icons.apartment, color: Colors.red),
            title: Text('Apartment name: Kowalski Enteries'),
          ),
          const ListTile(
            leading: Icon(Icons.apartment, color: Colors.red),
            title: Text('Apartment size: five story building'),
          ),
          ListTile(
            leading: const Icon(Icons.image, color: Colors.red),
            title: const Text('Apartment picture:'),
            trailing: Container(
              width: 50,
              height: 50,
              color: Colors.grey[300],
              child: const Icon(Icons.camera_alt),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.house, color: Colors.red),
            title: Text('House type: Two bedroomed'),
          ),
          ListTile(
            leading: const Icon(Icons.image, color: Colors.red),
            title: const Text('House Picture:'),
            trailing: Container(
              width: 50,
              height: 50,
              color: Colors.grey[300],
              child: const Icon(Icons.camera_alt),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.attach_money, color: Colors.red),
            title: Text('Rent: 50000 ksh per month'),
          ),
          const ListTile(
            leading: Icon(Icons.people, color: Colors.red),
            title: Text('Number of occupants: 4'),
          ),
          const ListTile(
            leading: Icon(Icons.house, color: Colors.red),
            title: Text('House Number: 23'),
          ),
          const ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text('Location: River road, Montpellier'),
          ),
          const ListTile(
            leading: Icon(Icons.house, color: Colors.red),
            title: Text('Number of vacant houses: 6'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.person, color: Colors.red),
              Icon(Icons.apartment, color: Colors.red),
              Icon(Icons.insert_chart, color: Colors.red),
              Icon(Icons.calendar_today, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}