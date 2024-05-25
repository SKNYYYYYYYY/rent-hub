import 'package:flutter/material.dart';
import 'package:rent_hub/TenantFormScreen.dart';

class ApartmentDetailsPage extends StatefulWidget {
  const ApartmentDetailsPage({super.key});

  @override
  _ApartmentDetailsPageState createState() => _ApartmentDetailsPageState();
}

class _ApartmentDetailsPageState extends State<ApartmentDetailsPage> {
  String apartmentName = '';
  String rentDueDate = '1st of every month';
  String rent = '';
  String houseNumber = '';
  String houseType = '';

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
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TenantFormScreen(
                    apartmentName: apartmentName,
                    rentDueDate: rentDueDate,
                    rent: rent,
                    houseNumber: houseNumber,
                    houseType: houseType,
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  apartmentName = result['apartmentName'];
                  rentDueDate = result['rentDueDate'];
                  rent = result['rent'];
                  houseNumber = result['houseNumber'];
                  houseType = result['houseType'];
                });
              }
            },
            child: const Text('Add/Edit Apartment Details'),
          ),
          ListTile(
            leading: Icon(Icons.apartment, color: Colors.black),
            title: Text('Apartment name: $apartmentName'),
          ),
          ListTile(
            leading: Icon(Icons.house, color: Colors.black),
            title: Text('House type: $houseType'),
          ),
          ListTile(
            leading: Icon(Icons.house, color: Colors.black),
            title: Text('Number of Houses: $houseNumber'),
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.black),
            title: Text('Rent: $rent ksh per month'),
          ),
          
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.black),
            title: Text('Rent Due Date: $rentDueDate'),
          ),
        ],
      ),
    );
  }
}
