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
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                controller: _nameController,
                autofocus: true,
                maxLength: 10,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _descriptionController,
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DropdownButton(
                dropdownColor: Colors.blue,
                hint: const Text('Duration'),
                isExpanded: true,
                alignment: Alignment.centerLeft,
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
              const SizedBox(
                height: 30,
              ),
              DropdownButton(
                dropdownColor: Colors.blue,
                hint: const Text('Workout Type'),
                isExpanded: true,
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
              const SizedBox(
                height: 30,
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
          )));
}
