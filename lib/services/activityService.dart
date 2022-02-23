import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/activity.dart';

class ActivitySerivce {
  CollectionReference activityRef =
      FirebaseFirestore.instance.collection('activity');

  Future getActivities() async {
    List<Activity> activities = [];
    try {
      print('ENTERED TRY CATCH ... GETTING DATA . . .');
      await activityRef.get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              dynamic data = element.data();
              print(data);
              print(data['description']);
              Activity activity = Activity(
                  name: data['name'],
                  duration: data['duration'],
                  description: data['description'],
                  type: data['type']
                  );

              activities.add(activity);
            })
          });
      return activities;
    } catch (e) {
      print('[ERROR] ERROR MESSAGE : ' + e.toString());
      return null;
    }
  }
}
