import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';
import 'package:flutter_application_1/services/activityService.dart';
import 'package:flutter_application_1/widgets/ActivityCard.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();

    fetchDataList();
  }

  void fetchDataList() async {
    List<Activity> result = await ActivitySerivce().getActivities();
    setState(() {
      activities = result;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            for (var activity in activities) ActivityCard(activity: activity)
          ],
        ),
      ));
}
