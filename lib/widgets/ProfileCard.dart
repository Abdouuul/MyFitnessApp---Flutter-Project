import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class ProfileCard extends StatelessWidget {
  User user;
  final VoidCallback onClicked;

  ProfileCard({Key? key, required this.user, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Stack(children: [
          buildImage(),
          buildEditButton(),
        ]),
        buildUserDetails(context),
      ],
    ));
  }

  Widget buildImage() {
    final image = NetworkImage(user.imageUrl);

    return ClipOval(
        child: Material(
            child: Ink.image(
      image: image,
      fit: BoxFit.cover,
      width: 120,
      height: 120,
      child: InkWell(onTap: onClicked),
    )));
  }

  Widget buildEditButton() {
    return Positioned(
      bottom: 0,
      right: 5,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildUserDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
        color: Colors.blue[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Text(user.firstName + " " + user.lastName,
                      style: Theme.of(context).textTheme.headline6)),
              Expanded(
                  flex: 2,
                  child: Text(user.age.toString() + " ans",
                      style: const TextStyle(fontSize: 15))),
            ],
          ),
          Text(
            user.email,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
