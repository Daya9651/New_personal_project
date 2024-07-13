import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

giveDateOnly(String date) {
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  var formattedDate =
      formatter.format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(date));
  return formattedDate;
}

giveDateWithOnly(String date) {
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  var formattedDate =
      formatter.format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(date));
  return formattedDate;
}

giveDateWithTimeOnly(String date) {
  DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
  var formattedDate =
      formatter.format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(date));
  return formattedDate;
}

showDeliveryDatePicker(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2099));
  debugPrint('date $picked');

  return picked;
}

String? dateTimeToString(DateTime? dateTime) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return dateTime != null ? formatter.format(dateTime) : null;
}

String formatDateTime(DateTime? dateTime) {
  if (dateTime != null) {
    return DateFormat("MMM d, yyyy hh:mm a").format(dateTime);
  }
  return '';
}

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd ').format(dateTime);
}

DateTime stringToDateTime(String dateString) {
  // Split the string at "T" to separate date and time
  List<String> parts = dateString.split("T");

  // Extract date and time parts
  String datePart = parts[0];
  String timePart = parts[1];

  // Split the time part at "." to separate seconds and milliseconds
  List<String> timeParts = timePart.split(".");

  // Extract hours, minutes, seconds, and milliseconds
  List<String> timeUnits = timeParts[0].split(":");
  int hours = int.parse(timeUnits[0]);
  int minutes = int.parse(timeUnits[1]);
  int seconds = int.parse(timeUnits[2]);

  // Milliseconds might be missing, default to 0 if not present
  int milliseconds = timeParts.length > 1 ? int.parse(timeParts[1]) : 0;

  // Split the date part at "-" to extract year, month, and day
  List<String> dateUnits = datePart.split("-");
  int year = int.parse(dateUnits[0]);
  int month = int.parse(dateUnits[1]);
  int day = int.parse(dateUnits[2]);

  // Create and return a DateTime object
  return DateTime(year, month, day, hours, minutes, seconds, milliseconds);
}

String formatDuration(Duration duration) {
  // Calculate hours, minutes, and seconds from the duration
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  // Format into a string
  return '${hours}h ${minutes}m ${seconds}s ago'; // Adjust the format as needed
  // return '${hours}h ${minutes}m ago'; // Adjust the format as needed
}
