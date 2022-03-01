// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';

class ActivitySerivce {
  CollectionReference activityRef =
      FirebaseFirestore.instance.collection('activity');
      

  Future getActivities() async {
    List<Activity> activities = [];
    try {
      await activityRef.get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              dynamic data = element.data();
              Activity activity = Activity(
                  id: element.id,
                  icon: getIcon(data['type']),
                  name: data['name'],
                  duration: data['duration'],
                  description: data['description'],
                  type: data['type'],
                  imagePath: data['imagePath']);

              activities.add(activity);
            })
          });
      return activities;
    } catch (e) {
      return null;
    }
  }

  void addActivity(Activity activity) {
    activityRef.add({
      'name': activity.name,
      'duration': activity.duration,
      'description': activity.description,
      'type': activity.type,
      'imagePath': activity.imagePath
    });
  }

  void deleteActivity(String? id) {
    activityRef.doc(id).delete();
  }

  void updateActivity(Activity activity) {
    activityRef.doc(activity.id).update({
      'name': activity.name,
      'duration': activity.duration,
      'description': activity.description,
      'type': activity.type,
    });
  }

  IconData getIcon(String sportType) {
    switch (sportType) {
      case 'Running':
        return Icons.directions_run;
      case 'Cycling':
        return Icons.directions_bike;
      case 'Swimming':
        return Icons.water_sharp;
      case 'Walking':
        return Icons.directions_walk;
      case 'Workout':
        return Icons.fitness_center;
      default:
        return Icons.sports;
    }
  }
}
