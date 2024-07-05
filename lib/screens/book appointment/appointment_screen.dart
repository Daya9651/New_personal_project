import 'package:flutter/material.dart';
import 'package:likhit/common/widget/time_picker.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Container(
        height: 100,
        width: 100,
        // child: TimePickerDialog(initialTime: null,),
        child: TimePickerWidget(),
      )
    );
  }
}
