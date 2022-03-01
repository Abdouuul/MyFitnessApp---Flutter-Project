import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';
import 'package:flutter_application_1/services/activityService.dart';

class ActivityCard extends StatelessWidget {
  Activity activity;
  final activityService = ActivitySerivce();

  ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(activity.imagePath),
              fit: BoxFit.fitWidth,
              opacity: 0.050,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF7D3C98),
                  Color(0xFFA569BD),
                  Color(0xFFD2B4DE)
                ])),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(activity.icon, size: 50, color: Colors.black),
                    Text(
                      activity.type,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      activity.date,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    activity.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    activity.description,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Text(
                    activity.duration,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon:
                          const Icon(Icons.delete, size: 30, color: Colors.red),
                      onPressed: () => {
                        activityService.deleteActivity(activity.id),
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
