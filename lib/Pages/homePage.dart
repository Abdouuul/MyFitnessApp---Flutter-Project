import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
                color: Colors.red[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Welcome to my',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Flutter App',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.flutter_dash_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'By Abdoul Alim Idlbi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
                color: Colors.blue[100],
              ),
              child: Column(children: <Widget>[
                const Text('In this app you can use the following features:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 18,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Add a new Workout / Activity',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Icon(
                    Icons.delete,
                    size: 18,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Delete an existing Activity',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 18,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Check your profile',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Icon(
                    Icons.edit,
                    size: 18,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Edit your profile and your profile pic',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])
              ]),
            )
          ],
        )),
      );
}
