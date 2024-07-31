import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


class ManageAlarmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Alarms'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FlutterAlarmClock.showAlarms();
          },
          child: Text('Show Alarms'),
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
      ),
    );
  }
}
