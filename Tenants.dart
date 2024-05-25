import 'package:flutter/material.dart';

class Tenants extends StatelessWidget {
    const Tenants({super.key}); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tenants'),
      ),
      body: Center(
        child: Text('This is the Tenants` Page'),
      ),
    );
  }}
