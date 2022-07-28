import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//23 February, 2022
var datemonthyear = DateFormat('d MMM, y').format(
  DateTime.now(),
);
//Sunday
var day = DateFormat.EEEE().format(
  DateTime.now(),
);
//28-2-2022
var date_month_year_seperated_by_minus = DateFormat('dd-MM-yyyy');
//Day of today
var date_now = DateTime.now();

var time = TimeOfDay.now();
