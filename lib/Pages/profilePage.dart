import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/editProfile.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/profileService.dart';
import 'package:flutter_application_1/widgets/ProfileCard.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final ProfileService profileService = ProfileService();
  User user = User(
    id: '',
    firstName: '',
    lastName: '',
    imageUrl: '',
    email: '',
    age: 0,
    weight: 0,
    height: 0,
  );

  @override
  void initState() {
    super.initState();

    fetchUserData();
  }

  void fetchUserData() async {
    User result = await profileService.getUser();
    setState(() {
      user = result;
    });
  }

  void onClicked() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => editProfilePage(user: user)));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
            children: <Widget>[ProfileCard(user: user, onClicked: onClicked)]),
      ));
}
