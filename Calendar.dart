import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rent_hub/AlertPage.dart';
import 'package:rent_hub/DueDate.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<Calendar> {
  late final ValueNotifier<DateTime> _focusedDay;
  late DateTime _selectedDay;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(DateTime.now());
    _selectedDay = DateTime.now();
    _updateDay();
  }

  void _updateDay() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != _focusedDay.value.day) {
        setState(() {
          _focusedDay.value = now;
          _selectedDay = now;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _showDueDates() {
    // Implement your logic to show due dates here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Showing due dates!')),
    );
  }

  void _navigateToAlertPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AlertPage()),
    );
  }

  void _navigateToDueDatesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DueDatesPage()), // Navigate to DueDates page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay.value,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay.value = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: _navigateToAlertPage,
                iconSize: 50.0,
                color: Colors.red,
              ),
              Text('Alert Tenant'),
            ],
          ),
          SizedBox(height: 20), // Adjusting spacing
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: _navigateToDueDatesPage, // Navigate to DueDates page
                iconSize: 50.0,
                color: Colors.blue,
              ),
              Text('Show Due Dates'),
            ],
          ),
        ],
      ),
    );
  }
}
