import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user.dart';

class ProfileService {
  CollectionReference profilesRef =
      FirebaseFirestore.instance.collection('profiles');

  Future getUser() async {
    late User user;
    print('HELLLOOOO????');
    try {
      await profilesRef.get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              dynamic data = element.data();
              user = User(
                id: element.id,
                firstName: data['firstName'],
                lastName: data['lastName'],
                imageUrl: data['imageUrl'],
                email: data['email'],
                age: data['age'],
                weight: data['weight'],
                height: data['height'],
              );
            })
          });
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  void updateUser(User user) {
    profilesRef.doc(user.id).update({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'imageUrl': user.imageUrl,
      'weight': user.weight,
      'height': user.height,
      'age': user.age,
      'email': user.email,
    });
  }
}
