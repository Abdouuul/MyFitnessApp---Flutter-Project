import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';
import 'package:flutter_application_1/services/activityService.dart';
import 'package:flutter_application_1/widgets/ActivityCard.dart';
import 'package:flutter_application_1/widgets/SearchWidget.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  List<Activity> activities = [];
  List<Activity> backupActivities = [];
  List<String> searchTerms = [];
  String query = '';

  @override
  void initState() {
    super.initState();

    fetchDataList();
  }

  void fetchDataList() async {
    List<Activity> result = await ActivitySerivce().getActivities();
    setState(() {
      activities = result;
      backupActivities = result;
      buildSearchTerms();
    });
  }

  void buildSearchTerms() {
    for (var activity in activities) {
      searchTerms.add(activity.name);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchBox(),
            for (var activity in activities) ActivityCard(activity: activity)
          ],
        ),
      ));

  Widget buildSearchBox() =>
      SearchWidget(text: query, hintText: 'Title', onChanged: searchActivity);

  void searchActivity(String query) {
    final searchedActivities = activities.where((Activity activity) {
      final title = activity.name.toLowerCase();
      final search = query.toLowerCase();

      return title.contains(search);
    }).toList();

    setState(() {
      this.query = query;
      activities = searchedActivities;
      if (query == '') {
        activities = backupActivities;
      }
    });
  }
}
