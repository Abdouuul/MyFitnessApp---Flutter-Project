import 'package:flutter/material.dart';

class AddModal extends StatelessWidget {
  const AddModal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
        children: const [
          TextField(
            autofocus: true,
            maxLength: 25,
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            maxLength: 25,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          DropdownButton(
            onChanged: (String? newValue) {},
            items: <String>[
              'Running',
              'Walking',
              'Swimming',
              'Bicycle',
              'Workout'
            ].map<DropdownMenuItem<String>>((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
          )
        ],
      ));
}
