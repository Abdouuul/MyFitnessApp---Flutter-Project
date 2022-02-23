import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';

class ActivityCard extends StatelessWidget {
  Activity activity;

  ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Text(activity.name),
              Text(activity.description),
              Text(activity.date),
            ],
          )),
    );
  }
}
