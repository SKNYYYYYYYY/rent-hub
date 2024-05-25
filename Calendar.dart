import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
    const Calendar ({super.key}); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text('This is the Calendar Page'),
      ),
    );
  }
}
