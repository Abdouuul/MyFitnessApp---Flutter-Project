import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/profileService.dart';

class editProfilePage extends StatelessWidget {
  User user;
  ProfileService profileService = ProfileService();
  editProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController =
        TextEditingController(text: user.firstName);
    final TextEditingController _lastNameController =
        TextEditingController(text: user.lastName);
    final TextEditingController _emailController =
        TextEditingController(text: user.email);
    final TextEditingController _weightController =
        TextEditingController(text: user.weight.toString());
    final TextEditingController _heightController =
        TextEditingController(text: user.height.toString());
    final TextEditingController _ageController =
        TextEditingController(text: user.age.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _firstNameController,
                  autofocus: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Weight',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Height',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.blue[100]),
                    ),
                    onPressed: () => {
                          user.firstName = _firstNameController.text,
                          user.lastName = _lastNameController.text,
                          user.email = _emailController.text,
                          user.age = int.parse(_ageController.text),
                          user.weight = int.parse(_weightController.text),
                          user.height = int.parse(_heightController.text),
                          profileService.updateUser(user),
                          Navigator.of(context).pop()
                        },
                    child: const Text('Save')),
              ],
            )));
  }
}
