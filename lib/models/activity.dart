import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class Activity {
  String? id;
  String name;
  String duration;
  String type;
  String description;
  String imagePath;
  String date = DateFormat('MM/yyyy').format(now);
  IconData? icon = Icons.directions_run;

  Activity(
      {this.id,
      this.icon,
      required this.name,
      required this.duration,
      required this.type,
      required this.description,
      this.imagePath = 'https://previews.123rf.com/images/gjee/gjee1806/gjee180600008/104618688-einfacher-musterhintergrundumriss-der-variet%C3%A9-sportikone-auf-wei%C3%9Fem-hintergrund.jpg'
      });

  
}
