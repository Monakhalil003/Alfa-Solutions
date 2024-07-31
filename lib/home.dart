import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'manage_alarm_screen.dart';
import 'alarm.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'MK Alarm Clock',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 2.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.blueGrey[50],
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('hh:mm a').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        DateFormat('EEEE, MMMM d').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlarmScreen()),
                  );
                },
                icon: Icon(Icons.alarm_add, color: Colors.white),
                label: Text('Set Alarm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800], // Use backgroundColor instead of primary
                  foregroundColor: Colors.white, // Set text color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageAlarmsScreen()),
                  );
                },
                icon: Icon(Icons.alarm, color: Colors.white),
                label: Text('Manage Alarms'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800], // Use backgroundColor instead of primary
                  foregroundColor: Colors.white, // Set text color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
