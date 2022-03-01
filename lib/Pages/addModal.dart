import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activity.dart';
import 'package:flutter_application_1/services/activityService.dart';

class AddModal extends StatelessWidget {
  ActivitySerivce activitySerivce = ActivitySerivce();
  late Activity activity;
  //Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AddModal({Key? key}) : super(key: key);

  String name = '';
  String description = '';
  String type = '';
  String duration = '';

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            controller: _nameController,
            autofocus: true,
            maxLength: 10,
            maxLines: 1,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 15,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
          DropdownButton(
            isExpanded: true,
            alignment: Alignment.centerLeft,
            hint: const Text('Duration'),
            onChanged: (String? newValue) {
              duration = newValue as String;
            },
            items: <String>[
              '1h',
              '2h',
              '3h',
              '4h',
            ].map<DropdownMenuItem<String>>((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
          ),
          DropdownButton(
            isExpanded: true,
            hint: const Text('Workout Type'),
            onChanged: (String? newValue) {
              type = newValue as String;
            },
            items: <String>[
              'Running',
              'Walking',
              'Swimming',
              'Cycling',
              'Workout'
            ].map<DropdownMenuItem<String>>((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.blue[100]),
              ),
              onPressed: () => {
                    activity = Activity(
                        name: _nameController.text,
                        duration: duration,
                        type: type,
                        description: _descriptionController.text),
                    activitySerivce.addActivity(activity),
                    Navigator.of(context).pop()
                  },
              child: const Text('Add')),
        ],
      ));
}
