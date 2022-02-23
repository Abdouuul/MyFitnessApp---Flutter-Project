import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/addModal.dart';
import 'Pages/activitiesPage.dart';
import 'Pages/homePage.dart';
import 'Pages/addModal.dart';
import 'Pages/profilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.grey[900],
      )),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  final String title = 'MyFitnessApp';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: PageView(
          controller: pageController,
          children: [
            const ActivityPage(),
            HomePage(),
            const ProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, size: 32),
          backgroundColor: Colors.blueGrey,
          onPressed: () => {
            showDialog(
                barrierColor: Colors.grey[800],
                context: context,
                builder: (context) => const AlertDialog(
                      title:  Text('Add New Activity'),
                      content:  AddModal(),
                    ))
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(label: 'Activites', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
          onTap: onTapped,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueGrey[600],
          unselectedItemColor: Colors.grey,
        ),
      );
}
